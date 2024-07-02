#command to change for single codebuild project
aws codebuild update-project --name my-codebuild-project --environment "type=LINUX_CONTAINER,image=aws/codebuild/standard:6.0"

#shell script to automatically change the environment type(image type) for all codebuild projects
#!/bin/bash

OLD_IMAGE="aws/codebuild/standard:5.0"
NEW_IMAGE="aws/codebuild/standard:6.0"
COMPUTE_TYPE="BUILD_GENERAL1_SMALL"

for PROJECT in $(aws codebuild list-projects --query 'projects[]' --output text)
do
  CURRENT_IMAGE=$(aws codebuild batch-get-projects --names "$PROJECT" --query 'projects[].environment.image' --output text)
  if [ "$CURRENT_IMAGE" = "$OLD_IMAGE" ]; then
    echo "Updating project: $PROJECT"
    aws codebuild update-project --name "$PROJECT" --environment "type=LINUX_CONTAINER,computeType=$COMPUTE_TYPE,image=$NEW_IMAGE"
  fi
done
