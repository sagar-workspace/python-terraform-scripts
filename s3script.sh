#!/usr/bin/env bash
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/cheque/ | awk '{print $4}' > ~/farmer-cheque.csv &
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/atr/gatepass/ | awk '{print $4}' > ~/farmer-gatepass.csv &
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/kyc/ | awk '{print $4}' > ~/farmer-kyc.csv &
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/family/kyc/ | awk '{print $4}' > ~/family-kyc.csv &
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/profile/profileimage/ | awk '{print $4}' > ~/profileimage.csv &
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/contract/ | awk '{print $4}' > ~/farmer-contract.csv &
aws s3 ls s3://grainbank-php-static-assets/ergos-grainbank-php-prod-storage-uploads/uploads/farmer/crop/ | awk '{print $4}' > ~/farmer-crop.csv &
