# Task 2: Catching Fraud

The Financial Crime team in company X noticed something odd happening over the last few days and have requested additional information to investigate. I was tasked to help in analysing data from customer's transactional records, to find out what is wrong.

This task is divided into three sections:
* SQL query debugging
* Identifying users of specific transactional attributes
* Finding fraudsters

## SQL query debugging 
In this section, I was given an SQL query. The task was to explain describe what the query means, whether the query will work, and explain why or why not. The query is as follows:

<img src="https://github.com/YingXie24/images/blob/master/SQL-1-DigitalBanking/CatchingFraudDebugging.PNG" width=70% >

## Identifying users of specific transactional attributes
In this section, I wrote an SQL query to identify users whose first transaction was a successful card payment over $10 USD equivalent. Company X provides digital banking services to customers worldwide and therefore allows payment to be made in different currencies. 

## Finding fraudsters
In this section, I was challenged to find 5 likely fraudsters, based on their transactional history. I then presented how I found them, and why they are likely fraudsters.

### Information provided for the task
I received 5 for analysis of the data:
1. facial_similarity_reports.csv: Reports of all Facial similarity checks
1. doc_reports.csv: Reports of all Document checks

The csv files can be found in the [csv](https://github.com/YingXie24/SQL/tree/master/1-DigitalBanking-DataAnalytics/2-CatchingFraud/csv) directory.

### My task deliverables
1. A PDF [report](https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/Task1-ImprovingKYC-github.pdf) outlining the root causes and solutions to the problem, as well as inconsistencies in the data;
1. An Excel calculation [spreadsheet](https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/Supporting_materials.xlsx) to support the findings;
1. As SQL file containing queries used to parse and analyse the csv data.
