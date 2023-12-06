-- Get column names and data types

SELECT column_name, data_type 
FROM `6_month_data`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_tripdata';

-- Determine number of null values for each column

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `6_month_data.combined_tripdata`;

-- Checking for duplicates based on ride_id
SELECT COUNT(ride_id) - COUNT(DISTINCT(ride_id)) AS duplicate_rows
FROM `6_month_data.combined_tripdata`;
