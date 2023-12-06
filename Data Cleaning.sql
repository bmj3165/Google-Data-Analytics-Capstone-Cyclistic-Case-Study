-- Remove rows containong null values(start_station_name, end_station_id, start_station_id, end_lat, end_lng)
DELETE FROM `6_month_data.combined_tripdata`
WHERE start_station_name IS NULL;

DELETE FROM `6_month_data.combined_tripdata`
WHERE end_station_id IS NULL;

DELETE FROM `6_month_data.combined_tripdata`
WHERE start_station_id IS NULL;

DELETE FROM `6_month_data.combined_tripdata`
WHERE end_lat IS NULL;

DELETE FROM `6_month_data.combined_tripdata`
WHERE end_lng IS NULL;


-- Create cleaned data table
DROP TABLE IF EXISTS `6_month_data.cleaned_combined_tripdata`;

CREATE TABLE IF NOT EXISTS `6_month_data.cleaned_combined_tripdata` AS(

  SELECT
    ride_id,rideable_type,start_station_name,start_station_id, end_station_name, end_station_id, start_lat, start_lng,end_lat, end_lng, member_casual,started_at, ended_at, 
    CASE 
      WHEN EXTRACT (DAYOFWEEK FROM started_at) = 1 THEN 'SUN'
      WHEN EXTRACT (DAYOFWEEK FROM started_at) = 2 THEN 'MON'
      WHEN EXTRACT (DAYOFWEEK FROM started_at) = 3 THEN 'TUE'
      WHEN EXTRACT (DAYOFWEEK FROM started_at) = 4 THEN 'WED'
      WHEN EXTRACT (DAYOFWEEK FROM started_at) = 5 THEN 'THU'
      WHEN EXTRACT (DAYOFWEEK FROM started_at) = 6 THEN 'FRI'
    ELSE 'SAT'
    END AS day_of_week,
    TIME_ADD(
          TIME '0:0:0',
          INTERVAL TIMESTAMP_DIFF(ended_at, started_at, SECOND) SECOND
        ) AS ride_length,
      TIMESTAMP_DIFF (ended_at, started_at, minute) AS ride_length_mins,
    CASE
      WHEN EXTRACT (MONTH FROM started_at) = 11 THEN 'NOV'
      WHEN EXTRACT (MONTH FROM started_at) = 12 THEN 'DEC'
      WHEN EXTRACT (MONTH FROM started_at) = 1 THEN 'JAN'
      WHEN EXTRACT (MONTH FROM started_at) = 2 THEN 'FEB'
      WHEN EXTRACT (MONTH FROM started_at) = 3 THEN 'MAR'
      WHEN EXTRACT (MONTH FROM started_at) = 4 THEN 'APR'
   
    ELSE 'UNKOWN'
    END AS month,
  FROM `6_month_data.combined_tripdata`

  WHERE TIMESTAMP_DIFF (ended_at, started_at, minute) > 1 AND TIMESTAMP_DIFF (ended_at, started_at, hour) < 24
);

--Count the number of rows in new table
SELECT COUNT(*) FROM `6_month_data.cleaned_combined_tripdata`;
