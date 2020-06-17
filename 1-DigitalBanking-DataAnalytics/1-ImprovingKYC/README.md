# Task 1: Improving KYC

As a financial institution regulated by the FCA, digital banking company X has the obligation to verify the identity of all customers who want to open an account. 
Each prospective customer has to go through a Know Your Customer (KYC) process by submitting a government-issued photo ID and a facial picture of themself. 

Two checks will be performed:
* Document check: To verify that the photo ID is valid and authentic;
* Facial similarity check: To verify that the face in the picture is the same as that on the submitted ID.

The customer "passes" the KYC process if the results for both Document check and Facial similarity checks are "clear". If the result of any check is not "clear", the customer has to submit all the photos again.

The "pass rate" is defined as the number of customer who pass both Document and Facial similarity checks, divided by the number of customers who attempt the process. Each customer has up to 2 attempts for the KYC process.

It is found that the pass rate has decreased substantially in the recent period. 

**This project aims to identify the root causes and solutions causing the decrease in pass rate.**

### Information provided for the task
Two csv files were provided to me for analysis of the data:
1. facial_similarity_reports.csv: Reports of all Facial similarity checks
1. doc_reports.csv: Reports of all Document checks

The csv files can be found in the [csv](https://github.com/YingXie24/SQL/tree/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/csv) directory.

### My task deliverables
1. A PDF [report](https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/Task1-ImprovingKYC-github.pdf) outlining the root causes and solutions to the problem, as well as inconsistencies in the data;
1. An Excel calculation [spreadsheet] (https://github.com/YingXie24/SQL/blob/master/1-DigitalBanking-DataAnalytics/1-ImprovingKYC/Supporting_materials.xlsx) to support the findings;
1. As SQL file containing queries used to parse and analyse the csv data.
