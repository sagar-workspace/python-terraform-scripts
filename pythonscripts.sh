#!/bin/bash
python3 /Users/sagarh/PycharmProjects/missingcsvfilesfolder/family-kyc-columnheader.py ;
python3 /Users/sagarh/PycharmProjects/missingcsvfilesfolder/farmer-cheque-columnheader.py &
python3 /Users/sagarh/PycharmProjects/missingcsvfilesfolder/farmer-kyc-columnheader.py &
python3 /Users/sagarh/PycharmProjects/missingcsvfilesfolder/gatepass-columnheader.py &
python3 /Users/sagarh/PycharmProjects/missingcsvfilesfolder/profileimage-columnheader.py &
python3 /Users/sagarh/PycharmProjects/missingcsvfilesfolder/combinationofcsv.py &
wait
