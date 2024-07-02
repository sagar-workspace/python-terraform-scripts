#Python code for image comparison:
import pandas as pd
import csv
df1 = pd.read_csv("~/profileimage-db.csv")
df2 = pd.read_csv("~/profileimage.csv")

print(df1,"\n")
print(df2,"\n")
print(type(df1))

list1=df1['s_image'].tolist()
list2=df2['profile_image_S3'].tolist()
main_list = list(set(list1) - set(list2))
print(main_list)
# print(list1)
# print(list2)

pd.DataFrame(main_list).to_csv(r'~/profile-image-comparison.csv')


# c_result_m = pd.merge(df1,df2,left_index=True,right_index=True)
# print(c_result_m)

# comparison_result = df1[df1.apply(tuple,1).isin(df2.apply(tuple,1))]
# print(comparison_result)