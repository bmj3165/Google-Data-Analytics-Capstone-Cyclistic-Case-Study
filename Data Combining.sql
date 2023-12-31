DROP TABLE IF EXISTS `6_month_data.combined_tripdata`;

-- Combine 6 months of data into one table

CREATE TABLE IF NOT EXISTS `6_month_data.combined_tripdata` AS (
  SELECT * FROM `6_month_data.202212_divvy_tripdata`
  UNION ALL
  SELECT * FROM `6_month_data.202211_divvy_tripdata`
  UNION ALL
  SELECT * FROM `6_month_data.202301_divvy_tripdata`
  UNION ALL
  SELECT * FROM `6_month_data.202302_divvy_tripdata`
  UNION ALL
  SELECT * FROM `6_month_data.202303_divvy_tripdata`
  UNION ALL
  SELECT * FROM `6_month_data.202304_divvy_tripdata`
);

-- Determine the # of rows in table
SELECT COUNT(*) FROM `6_month_data.combined_tripdata`
