-- Several problems can be found in the data:

-- 1. There are a lot of duplicate entries
SELECT COUNT(*)
FROM (SELECT dr.user_id, dr.created_at, dr.result, COUNT(*)
        FROM doc_reports dr
        GROUP BY dr.user_id, dr.created_at, dr.result
        HAVING COUNT(*) > 1
      );

-- 1(b) From which the number of duplicate entries that failed:
SELECT COUNT(*)
FROM (SELECT dr.user_id, dr.created_at, dr.result, COUNT(*)
        FROM doc_reports dr
        WHERE result = 'consider'
        GROUP BY dr.user_id, dr.created_at, dr.result
        HAVING COUNT(*) > 1
      );

-- 2. Although company X intends customers to have no more than 2 attempts,
-- the rule is not withheld. The number of customers that attempted more than
-- twice:

SELECT COUNT(*)
FROM (SELECT user_id, created_at, COUNT(*)
      FROM doc_reports dr
      GROUP BY user_id
      HAVING COUNT(DISTINCT created_at) > 2
     );

--or--

SELECT COUNT(*)
FROM (SELECT user_id, created_at, COUNT(*)
        FROM (SELECT DISTINCT dr.user_id, dr.created_at, dr.result
                FROM doc_reports dr)
        GROUP BY user_id
        HAVING COUNT(*) > 2
      );


-- 2(b) From which the number of customers who failed more than twice:
SELECT COUNT(*)
FROM (SELECT user_id, created_at, COUNT(*)
        FROM (SELECT DISTINCT dr.user_id, dr.created_at, dr.result
                FROM doc_reports dr)
      WHERE result = 'consider'
      GROUP BY user_id
      HAVING COUNT(*) > 2
     );

-- 3. Attempt_id that is not mutual in doc_reports.xls and
-- facial_similarity_reports.xls. The attempt_id is saved in a different format
-- (scientific numerical format) in xls as the characters are all digits.
SELECT number, dr.attempt_id
FROM doc_reports dr
EXCEPT
SELECT number, fsr.attempt_id
FROM facial_similarity_reports fsr;


-- 4. Distinct attempts that are flagged as 'caution', even though there are
-- no clear reasons why. Breakdown tests are either 'clear' or are blank.
SELECT COUNT(*)
FROM (SELECT DISTINCT user_id, created_at, sub_result
    FROM doc_reports
    WHERE sub_result = 'caution'
        AND visual_authenticity_result != 'consider'
        AND data_validation_result!= 'consider'
        AND data_comparison_result !='consider'
        AND image_integrity_result != 'consider'
        AND data_consistency_result !='consider'
        AND police_record_result != 'consider'
        AND compromised_document_result != 'consider'
    );
