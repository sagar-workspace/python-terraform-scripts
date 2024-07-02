#!/usr/bin/env bash
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/kyc | awk '{print $9}' > ~/farmer-kyc.csv
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/cheque | awk '{print $9}' > ~/farmer-cheque.csv
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/atr/gatepass | awk '{print $9}' > ~/farmer-gatepass.csv
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/family/kyc | awk '{print $9}' > ~/family-kyc.csv
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/profile/profileimage | awk '{print $9}' > ~/profileimage.csv
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/contract | awk '{print $9}' > ~/farmer-contract.csv
ssh -i ~/.ssh/php-prod-keypair.pem ubuntu@3.110.180.215 ls -l /var/www/grainbank.in/storage/uploads/farmer/crop | awk '{print $9}' > ~/farmer-crop.csv
