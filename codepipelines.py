#python code to release all the non-prod environments codepipelines
#list all the codepipeline names to a csv file(NON-PROD)
import boto3
import csv

with open('~/codepipelines.csv', 'r', encoding="utf-8") as f:
    reader = csv.reader(f)
    client = boto3.client('codepipeline')
    for row in reader:
        print(row[0])
        response = client.start_pipeline_execution(
            name=row[0],
            clientRequestToken='string'
        )