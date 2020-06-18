# Improving KYC SQL Database
This version of the .sql file is compatible with sqlite3.

There are two csv databases: **facial_similarity_reports.csv** and **doc_reports.csv**. Each database has **181991** rows, with each row representing a registered user attempt for a digital banking account with company X.

KYC_init.sql creates two tables:
* **facial_similarity_reports:** number, user_id, result, face_comparison_result, created-at, facial_image_integrity_result, visual_authenticity_result, properties, and attempt_id.
* **doc_reports:** number, user_id, result, visual_authenticity_result, image_integrity_result, face_detection_result, image_quality_result, created_at, supported_document_result, conclusive_document_quality_result, colour_picture_resultdata_validation_result, data_consistency_result, data_comparison_result, attempt_id, police_record_result, compromised_document_result, properties, sub_result

## Usage

To create the database:
```javascript
sqlite3 ying_sql_work.db
```
To open the database:
```javascript
sqlite3 ying_sql_work.db
```
To create the tables, download [KYC_init.sql](addhere) and read the file:
```javascript
.read KYC_init.sql
```
To import [facial_similarity_reports.csv](https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/csv/facial_similarity_reports.csv) into the *facial_similarity_reports* table, and [doc_reports.csv](https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/csv/doc_reports.csv) into the *doc_report* table, do the following:
1. Download the csv files
2. Delete the first row (header) of the csv files
3. Type the following commands in your console:
```javascript
.mode csv
.import *path to the facial_similarity_reports_without_header.csv on your machine* facial_similarity_reports
.import *path to the doc_reports_without_header.csv on your machine* doc_reports
```

The SQL queries that I used to arrive at my report finding can be found at [SQL_scripts](addhere) directory. Copy and paste the queries to your sqlite3 console.
