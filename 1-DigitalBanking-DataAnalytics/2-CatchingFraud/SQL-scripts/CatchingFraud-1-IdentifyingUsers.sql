INSERT INTO fx_rates VALUES("USD", "USD", 1);

WITH first_transaction
    AS (SELECT user_id,
            MIN(created_date) AS first_date
        FROM transactions t
        GROUP BY t.user_id)
SELECT ROW_NUMBER() OVER (ORDER BY (ft.first_date)) AS "",
        t.user_id,
        ft.first_date,
        ROUND(t.amount * fx.rate / 100, 2) AS usd_amount
FROM transactions t
    JOIN first_transaction ft
      ON ( t.created_date = ft.first_date
        AND t.user_id = ft.user_id )
    JOIN fx_rates fx
      ON (fx.ccy = t.currency
            AND fx.base_ccy = 'USD')
    JOIN currency_details cd
      ON cd.currency = t.currency
WHERE t.amount * fx. rate / 100 > 10
        AND t.type = "CARD_PAYMENT"
        AND t.state = "COMPLETED"
ORDER BY first_date;

-- MySQL equivalent:
WITH first_transaction
    AS (SELECT t.user_id,
            MIN(t.created_date) AS first_date
        FROM transactions t
        GROUP BY t.user_id)
SELECT ROW_NUMBER() OVER (ORDER BY (ft.first_date)) AS "",
        t.user_id,
        ft.first_date,
        ROUND(t.amount * fx.rate / Power(10, cd.exponent), 2) AS usd_amount
FROM transactions t
    JOIN first_transaction ft
      ON ( t.created_date = ft.first_date
        AND t.user_id = ft.user_id )
    JOIN fx_rates fx
      ON (fx.ccy = t.currency
            AND fx.base_ccy = 'USD')
    JOIN currency_details cd
      ON cd.currency = t.currency
WHERE t.amount * fx. rate / Power(10, cd.exponent) > 10
        AND t.type = "CARD_PAYMENT"
        AND t.state = "COMPLETED"
ORDER BY first_date;
