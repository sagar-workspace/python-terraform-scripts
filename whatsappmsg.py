#py to find out the phone numbers who arent having whatsapp(to track)
import requests
import csv

with open('farmer_id.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')

line_count = 0
for row in csv_reader:
    if line_count == 0:
        print(f'Column names are {", ".join(row)}')
        line_count += 1
else:
    print(row[0])
api = "https://api.kaleyra.io/v1/HXIN1704805738IN/messages"
in_values = {
'api-key':'Afdd5509105f88f9e29820bd7b0f756bc',
'from' : '919801985666',
'to': '91' + row[0],
'type': 'template',
'channel' : 'whatsapp',
'template_name' :'smartphone_validation',
'params' :'',
'lang_code':'en',
}
res = requests.post(api,data = in_values)
with open('result_csv_file', 'w') as f:

# create the csv writer
writer = csv.writer(f)
writer.writerow(res.json())
f.close()
print(res.json())