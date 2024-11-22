
CREATE TABLE data_mart.clean_weekly_sales (
  week_date DATE,
  week_number INTEGER,
  month_number INTEGER,
  calendar_year INTEGER,
  region VARCHAR(13),
  platform VARCHAR(7),
  segment VARCHAR(4),
  age_band VARCHAR(15),
  demographic VARCHAR(10),
  transactions INTEGER,
  sales INTEGER,
  avg_transaction INTEGER 
  );

USE data_mart;


INSERT INTO clean_weekly_sales (
  week_date,
  week_number,
  month_number,
  calendar_year,
  region,
  platform,
  segment,
  age_band,
  demographic,
  transactions,
  sales,
  avg_transaction
)
SELECT
  STR_TO_DATE(week_date, '%d/%m/%y') AS  week_date,
  CEIL(DAYOFYEAR(week_date) / 7) AS week_number,
  MONTH( STR_TO_DATE(week_date, '%d/%m/%y')) AS month_number,
  YEAR ( STR_TO_DATE(week_date, '%d/%m/%y')) AS  calendar_year,
  region, 
  platform,
  segment,
  CASE
      WHEN segment LIKE '%1%'  THEN 'Young Adults'
      WHEN segment LIKE '%2%' THEN 'Middle Aged'
      WHEN segment LIKE '%3%' OR segment LIKE '%4%' THEN 'Retirees'
      ELSE 'unknown'
  END AS age_band,
  CASE
      WHEN LEFT(segment, 1) = 'C' THEN 'Couples'
      WHEN LEFT(segment, 1) = 'F' THEN 'Families'
      ELSE 'unknown'
  END AS demographic,
  transactions, -- Assuming transactions column exists in the source table
  sales,        -- Assuming sales column exists in the source table
    ROUND(CASE
      WHEN transactions > 0 THEN sales / transactions
      ELSE 0
  END, 2) AS avg_transaction
FROM weekly_sales;
