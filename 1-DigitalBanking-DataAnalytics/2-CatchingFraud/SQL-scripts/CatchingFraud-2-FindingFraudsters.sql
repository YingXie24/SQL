-- Show users with transactions that are declined more than 5 times in a
SELECT t.user_id,
  t.state,
  GROUP_CONCAT(t.created_date),
  COUNT(*) AS number_of_times
FROM transactions t
WHERE t.state != "COMPLETED"
GROUP BY t.user_id, ROUND(strftime('%s', t.created_date) / 60 / 1 - 0.5, 0)
HAVING COUNT(*) > 5;

-- List the fraudsters
SELECT ROW_NUMBER() OVER (ORDER BY (frauds.user_id)) AS "",
  frauds.user_id
FROM (
  SELECT DISTINCT t.user_id
  FROM transactions t
  WHERE t.state != "COMPLETED"
  GROUP BY t.user_id, ROUND(strftime('%s', t.created_date) / 60 / 1 - 0.5, 0)
  HAVING COUNT(*) > 5
) frauds;

/*The query here intends to group transactions that happen in the same minute.
strftime('%s', t.created_date) converts the timestamp to the number of seconds since 1970-01-01.
Then convert the number of seond to the number of minutes since 1970-01-01, by diving by 60.*
To group time by 1 minute, divide by 1.
To round down to the nearest integer, use ROUND(value - 0.5, 0)
