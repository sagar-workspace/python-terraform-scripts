# Python Code for epoch converter
import pandas as pd
import datetime
# df=pd.read_csv("/Users/sagarh/Downloads/output.csv")
# #print(df.to_string())
# for row in df:
#     print(int(row['output']))

import csv

# with open("/Users/sagarh/Downloads/output.csv", newline='') as f:
#     ereader = csv.DictReader(f)
#     for row in ereader:
#         image_name = row['output']
#         #image = pd.DataFrame(data=image_name)
#         print(image_name)
#
with open('/Users/sagarh/Documents/csv_files_missing/profile-image-comparison.csv', 'r', encoding="utf-8") as f:
            reader = csv.reader(f)
            next(reader)
            name = [row[1].split("-")[0] for row in reader]
            # print(name)

imageDict=dict()
for image_no in name:
    print(image_no)
    imageDate=datetime.datetime.fromtimestamp(float(image_no)/1000.0)
    #print(imageDate)
    imageDict[image_no] = str(imageDate)

print(imageDict)
f.close()

#for k,v in imageDict.items():
    #f=open('/Users/sagarh/Downloads/test-output1.csv','w')
with open('/Users/sagarh/Documents/csv_epoch_files/profile_image_epoch_number.csv', 'w+') as f:
    w = csv.writer(f)
    for k, v in imageDict.items():
        w.writerow([k, v])
