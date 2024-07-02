# importing python package
import pandas as pd
import csv

with open('/Users/sagarh/Documents/csv_files_S3/family-kyc.csv', newline='') as f:
    reader = csv.reader(f)
    data = list(reader)
    print(reader)
print(data)
print(data)

with open("/Users/sagarh/Documents/csv_files_S3_ColumnHeader/family-kyc-header.csv", 'w',newline='') as myfile:
    wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
    for i in range(len(data)):
        if(i==0):
            wr.writerow(["family-kyc-S3"])
        wr.writerow(data[i])