#!/usr/bin/env bash
mysql -u shivashankari_ro -pShankari@12345 -h ergosprd-rr1.caaquijxdja0.ap-south-1.rds.amazonaws.com -D grainbankprd -e "select s_image from er_users
where s_image is not null and TRIM(s_image) not in ('') order by i_user_id desc;" > ~/profileimage-db.csv

mysql -u shivashankari_ro -pShankari@12345 -h ergosprd-rr1.caaquijxdja0.ap-south-1.rds.amazonaws.com -D grainbankprd -e "select DISTINCT kyc from
(select s_kyc_proof_front_image as kyc from er_user_kyc
euk where s_kyc_proof_front_image is not null and TRIM(s_kyc_proof_front_image) not in ('') union select s_kyc_proof_back_image as kyc
from er_user_kyc euk where s_kyc_proof_back_image is not null and
TRIM(s_kyc_proof_back_image) not in (''))a;" > ~/farmer-kyc-db.csv

mysql -u shivashankari_ro -pShankari@12345 -h ergosprd-rr1.caaquijxdja0.ap-south-1.rds.amazonaws.com -D grainbankprd -e "select DISTINCT s_cheque_image
from er_bank_infos ebi
where s_cheque_image is not null and TRIM(s_cheque_image) not in ('') ;" > ~/farmer-cheque-db.csv

mysql -u shivashankari_ro -pShankari@12345 -h ergosprd-rr1.caaquijxdja0.ap-south-1.rds.amazonaws.com -D grainbankprd -e "select distinct s_gate_pass_img from
er_farmer_stock_in efsi where s_gate_pass_img is not null and s_gate_pass_img not in ('');" > ~/farmer-gatepass-db.csv

mysql -u shivashankari_ro -pShankari@12345 -h ergosprd-rr1.caaquijxdja0.ap-south-1.rds.amazonaws.com -D grainbankprd -e"select distinct kyc from
(select s_kyc_family_member_id_proof_front_image as kyc from er_farmer_family_member effm
where s_kyc_family_member_id_proof_front_image is not null and TRIM(s_kyc_family_member_id_proof_front_image) not in ('')
UNION
select s_kyc_family_member_id_proof_back_image as kyc from er_farmer_family_member effm
where s_kyc_family_member_id_proof_back_image is not null and TRIM(s_kyc_family_member_id_proof_back_image) not in (''))a ;" > ~/family-kyc-db.csv
