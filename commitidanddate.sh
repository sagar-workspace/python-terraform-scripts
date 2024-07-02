#shell script to get all commitid and commitdate for codepipelines based on environment
#!/bin/bash

# Output file path
output_file="pipeline_dates.csv"

# Retrieve the pipeline names
pipeline_names=$(aws codepipeline list-pipelines --query 'pipelines[?starts_with(name, `uat`)].name' --output text)

# Function to format the output as CSV
format_csv() {
    local rows=("$@")
    
    # Print the header
    printf "Pipeline,Commit ID,Completion Date\n"
    
    # Print each row
    for row in "${rows[@]}"; do
        printf "%s\n" "$row"
    done
}

# Array to store the output rows
output_rows=()

# Iterate over each pipeline and collect the output
for pipeline_name in $pipeline_names; do
    # Retrieve the latest execution details
    execution_details=$(aws codepipeline list-pipeline-executions --pipeline-name "$pipeline_name" --query 'pipelineExecutionSummaries[?status==`Succeeded`].[sourceRevisions[0].revisionId, lastUpdateTime]' --output text)
    
    # Extract the latest commit and execution completion date
    latest_commit=$(echo "$execution_details" | awk 'NR==1{print $1}')
    latest_completion_date=$(echo "$execution_details" | awk 'NR==1{print $2}')
    
    # Add the output row to the array
    output_rows+=("$pipeline_name,$latest_commit,$latest_completion_date")
done

# Format the output as CSV and write it to the file
format_csv "${output_rows[@]}" > "$output_file"

echo "Output written to $output_file"
