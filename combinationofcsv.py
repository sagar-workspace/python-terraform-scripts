import pandas as pd
import csv
import datetime
import math

# df=pd.read_csv("/Users/sagarh/Downloads/comparison.csv")
#
# for imagerow in df:
#     print(imagerow["DB File"])



def createFiles(dbFile,sFile,dbColumn,s3Column,destinationFile):
    df1 = pd.read_csv(dbFile)
    df2 = pd.read_csv(sFile)

    list1=df1[dbColumn].tolist()
    list2=df2[s3Column].tolist()
    main_list = list(set(list1) - set(list2))
    print(main_list)
    main_list = [x for x in main_list if str(x) != 'nan']
    # main_list.remove('nan')
    print(type(main_list))
    df3 = pd.DataFrame([])
    for m in main_list:
        if (m != 'Dummy.jpeg' and m!='dummy.jpeg' and m!='dummy.jpg'):
            print(type(m))
            name = [m.split("-")[0]]
            imageDate = datetime.datetime.fromtimestamp(float(m[0:10]))
            print(m)
            print(imageDate)
            dram = pd.DataFrame({'MISSING_IMAGE':[m],'DATE':imageDate})
            df3 = pd.concat([df3,dram])
    df3=df3.sort_values(by=['DATE'],ascending=False)
    print(type(df3.DATE.dtype))
    df3.to_csv(destinationFile)

with open("/Users/sagarh/Downloads/comparison.csv") as csvFile:
    imagerow=csv.DictReader(csvFile)
    print(imagerow)
    for i in imagerow:
        createFiles(i["DB File"],i["S3 Files"],i["column header DB"],i["column header S3"],i["Destination file"])
        print(i["DB File"])

