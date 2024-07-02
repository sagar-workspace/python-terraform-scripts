#shell script to enable the privilege mode flag to true for all codebuild projects
#!/bin/bash

NEW_IMAGE="aws/codebuild/standard:6.0"
COMPUTE_TYPE="BUILD_GENERAL1_SMALL"

for PROJECT in $(aws codebuild list-projects --query 'projects[]' --output text)
do
  echo "Updating project: $PROJECT"
  aws codebuild update-project --name "$PROJECT" --environment "type=LINUX_CONTAINER,image=$NEW_IMAGE,computeType=$COMPUTE_TYPE,privilegedMode=true"
done
