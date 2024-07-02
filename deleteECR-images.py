import subprocess
import json
import boto3
import logging

client = boto3.client('ecr')
from datetime import datetime, date
import csv
import os

#ECR properties to delete images from repository
dry_run = False
region = 'ap-south-1'
delete_older_than = 180

#command to fetch all the repository names to a csv file
os.system('aws ecr describe-repositories --query "repositories[].[repositoryName]" --output text --no-cli-pager > /Users/sagarh/Documents/ECR.csv')
repository_list = []
logging.basicConfig(level=logging.DEBUG)
logging.debug('logged to get the list of images in the repository')
with open('/Users/sagarh/Documents/ECR.csv') as file_obj:
    image_reader = csv.reader(file_obj)
    for row in image_reader:
        repository_list.append(row[0])

file_obj.close()

for repository in repository_list:
    ecr_get_cmd = 'aws --region {} ecr describe-images --repository-name "{}"'.format(region, repository)
    ecr_delete_cmd = 'aws --region {} ecr batch-delete-image --repository-name "{}" --image-ids '.format(region,
                                                                                                         repository)
    ecr_get_cmd_result = subprocess.check_output(ecr_get_cmd, stderr=subprocess.STDOUT, shell=True)
    images = json.loads(ecr_get_cmd_result)['imageDetails']
    print("Repository", repository)
    print("IMAGES_IN_THE_REPOSITORY: ", len(images))

#datetime for ecr images inside a repository
    images_to_be_deleted = []
    images_deleted = 0
    for image in images:
        strptime = datetime.strptime(str(image['imagePushedAt']).split("T")[0], '%Y-%m-%d')
        days_old = (datetime.now() - strptime).days
        logging.basicConfig(level=logging.DEBUG)
        logging.debug('datetime format with images > 180 days')

        if days_old > delete_older_than:
            images_to_be_deleted.append(image)
            images_deleted += 1


        batch_delete_size = 100

#ECR delete images condition
    for i in range(0, len(images_to_be_deleted), batch_delete_size):
        ids_delete_arg = ' '.join(['imageDigest=' + image['imageDigest'] for image in images_to_be_deleted[i:i+batch_delete_size]])
        if dry_run:
            print(ecr_delete_cmd + ids_delete_arg)
        else:
            print(subprocess.check_output(ecr_delete_cmd + ids_delete_arg, stderr=subprocess.STDOUT, shell=True))
    logging.basicConfig(level=logging.DEBUG)
    logging.debug('logged after deletion is complete for the ECR images inside a repository')
    print("IMAGES DELETED:", images_deleted)
print('DONE')
