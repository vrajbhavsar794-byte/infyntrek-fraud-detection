CREATE DATABASE fraud_analysis;
USE fraud_analysis;

#Preview of first 5 rows
SELECT * FROM transactions 
LIMIT 5;

#Extraction of whole data
select * from transactions;


#Count of total records
SELECT COUNT(*) AS total_records 
FROM transactions;