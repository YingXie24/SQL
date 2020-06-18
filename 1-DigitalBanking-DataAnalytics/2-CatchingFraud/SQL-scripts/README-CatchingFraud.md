# Catching Fraud SQL Database
This version of the .sql file is compatible with sqlite3.

There are 5 csv databases: **countries.csv** ,**fx_rates.csv**, **transactions.csv**, **users.csv**, and **currency_details.csv**.

CatchingFraud-0-Init creates 4 tables:
* **transactions:** number, currency, amount, state, created_date, merchant_category, merchant_country, entry_method, user_id, type, source, id
* **users:** number, failed_sign_in_attempts, kyc, birth_year, country, state, created_date, terms_version, phone_country, has_email, id
* **fx_rate:** base_ccy, ccy, rate
* **currency_details:** currency, iso_code, exponent, is_crypto

## Usage
To create the database:
```javascript
sqlite3 ying_sql_work.db
```
To open the database:
```javascript
sqlite3 ying_sql_work.db
```
To create the tables, download [CatchingFraud-0-Init.sql](addhere) and read the file:
```javascript
.read CatchingFraud-0-Init.sql
```
To import the csv's into your sqlite3 console table, do the following:
1. Download the csv files
2. Delete the first row (header) of the csv files
3. Type the following commands in your console:
```javascript
.mode csv
.import *path to the csv on your machine* *table_name*
```

Data under the CREATED_DATE column in transactions.xls is edited to conform to the SQL TIMESTAMP format: YYYY-MM-DD HH:MI:SS. Do the following: 
1. Open transactions.xls on your machine.
1. Right click on the CREATED_DATE column,
1. Under "Format cells", choose category date and then the desired timestamp format

Because the transactions spreadsheet is in the xls format, rather than the csv format, convert it into .csv before importing it to the sqlite3 console. 

To analyse the data in the tables, either copy + paste the queries in the .sql files into your sqlite3 console, or download the sql files and read them.
