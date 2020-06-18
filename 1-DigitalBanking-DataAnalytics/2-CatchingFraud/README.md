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

## Information provided for the task
I received 5 csv's for the analysis of customer transactional history:
1. **countries.csv**: A table with all alpha-numeric representations of countries. 
1. **fx_rates.csv**: A table with fx rates on a particular day.
1. **transactions.csv**: A table of all transactions conducted by users. *amount* is denominated in integers at the lowest unit. e.g. 5000 GBP => 50 GBP (because the lowest unit in GBP is a penny, w/ 100 pence = 1 GBP).
1. **users.csv**: A table of user data. The *kyc* column indicates the status of the user's identity verification process. The *terms_version* column indicates the user's current version of the mobile app.
1. **currency.details.csv**: A table with iso codes and exponents for currencies. The *exponent* column can be used to convert the integer amounts in the transactions table into cash amounts. (e.g for 5000 GBP, exponent = 2, so apply: 5000/(10^2) = 50 GBP).

The csv files can be found in the [csv](https://github.com/YingXie24/SQL/tree/master/1-DigitalBanking-DataAnalytics/2-CatchingFraud/csv) directory.

## My task deliverables
1. A PDF [report](https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/2-CatchingFraud/Task2-CatchingFraud.pdf) on the solutions for Sections 1, 2 and 3;
1. SQL files containing queries used to parse and analyse the csv data.
