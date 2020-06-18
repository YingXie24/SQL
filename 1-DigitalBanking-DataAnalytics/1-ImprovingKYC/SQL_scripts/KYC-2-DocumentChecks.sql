-- INVESTIGATING SUB_RESULTS OF DOCUMENT CHECKS

-- Count number of entries in document check that have
-- sub_result = 'rejected' each month
SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'rejected'
GROUP BY strftime('%m', created_at);

-- Count number of entries in document check that have
-- sub_result = suspected' each month
FROM doc_reports
WHERE sub_result = 'suspected'
GROUP BY strftime('%m', created_at);

-- Count number of entries in document check that have
-- sub_result = 'caution' each month
SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
GROUP BY strftime('%m', created_at);

/*From the queries above it is found that customer document checks fail
because they are mostly flagged as 'rejected' or 'caution'*/
-----------------------------------------------------------------
-- INVESTIGATING REJECTED CASES

-- Count number of rejected cases that have the sub-breakdowns
-- 'unidentified' or 'consider'

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'rejected'
  AND image_quality_result = 'unidentified'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'rejected'
  AND supported_document_result = 'unidentified'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'rejected'
  AND conclusive_document_quality_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'rejected'
  AND colour_picture_result = 'consider'
GROUP BY strftime('%m', created_at);

/* From the queries above we can deduce that rejected cases are primarily
caused by failed image_quality and supported_document checks*/

--------------------------------------------------------------------
-- INVESTIGATING CAUTION CASES
SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND visual_authenticity_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND face_detection_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND image_integrity_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND image_quality_result = 'unidentified'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND supported_document_result = 'unidentified'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND conclusive_document_quality_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND colour_picture_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND data_validation_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND data_consistency_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND data_comparison_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND police_record_result = 'consider'
GROUP BY strftime('%m', created_at);

SELECT COUNT(*)
FROM doc_reports
WHERE sub_result = 'caution'
  AND compromised_document_result = 'consider'
GROUP BY strftime('%m', created_at);

/* From the queries above we can deduce that caution cases are primarily
caused by failed conclusive_document_quality_result*/
