-- Determine time span of the records (2017-05-23T15:13:02Z|2017-10-31T23:54:24Z)
SELECT MIN(created_at), MAX(created_at)
FROM doc_reports;

-- Count number of csv-registered entries each month
SELECT COUNT(*)
FROM doc_reports dr
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM facial_similarity_reports fsr
GROUP BY strftime('%m', created_at);

-- Count number of distinct customers each month
SELECT COUNT(DISTINCT dr.user_id)
FROM doc_reports dr
GROUP BY strftime('%m', created_at);

SELECT COUNT(DISTINCT fsr.user_id)
FROM facial_similarity_reports fsr
GROUP BY strftime('%m', created_at);

-- Count number of distinct attempt_ids each month
SELECT COUNT(DISTINCT attempt_id)
FROM doc_reports dr
GROUP BY strftime('%m', created_at);

SELECT COUNT(DISTINCT attempt_id)
FROM facial_similarity_reports fsr
GROUP BY strftime('%m', created_at);

/* From the queries above, we find that the number of distinct attempt_ids
equals to the number of entries in both doc and fac tables. Therefore,
it can be deduced that that attempt_id for each row is unique:
attempt_id is the PRIMARY KEY. */

-- Count number of distinct customers that passed document check each month
SELECT COUNT(DISTINCT user_id)
FROM doc_reports
WHERE result = 'clear'
GROUP BY strftime('%m', created_at);

-- Count number of distinct customers that passed facial similarity check each month
SELECT COUNT(DISTINCT user_id)
FROM facial_similarity_reports
WHERE result = 'clear'
GROUP BY strftime('%m', created_at);

-- Count number of distinct customers that passed both document check AND facial
-- similarity check each month

SELECT COUNT(DISTINCT dr.user_id)
FROM facial_similarity_reports fr
    JOIN doc_reports dr
        ON dr.number = fr.number
WHERE dr.result = "clear"
    AND fr.result = "clear"
GROUP BY strftime('%m', dr.created_at);

/* From the queries above, we find that document checks have a low passing rate.
It pulls down the overall passing rate of the KYC process. Hence, we need to
investigate document checks next to determine the root problem. */
