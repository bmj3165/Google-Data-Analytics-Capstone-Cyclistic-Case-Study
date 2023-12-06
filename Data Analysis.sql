
-- Determing the number of trips based on bike types
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `6_month_data.combined_tripdata`
GROUP BY rideable_type;

--Determine bike types by user
SELECT DISTINCT member_casual, rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY member_casual,rideable_type
ORDER BY member_casual,no_of_trips;

-- Determing the number of trips based on member type
SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_riders
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY member_casual;

--Number of trips per month
SELECT month, member_casual, COUNT(ride_id) as no_of_trips
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY month, member_casual
ORDER BY member_casual;

--Number of trips per week
SELECT day_of_week, member_casual, COUNT(ride_id) as no_of_trips
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY day_of_week, member_casual
ORDER BY member_casual;

-- Average ride length per user type

SELECT member_casual, ROUND(AVG(ride_length_mins)) AS avg_ride_length
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY member_casual;

--Average ride length per day
SELECT day_of_week, member_casual, ROUND(AVG(ride_length_mins)) AS avg_ride_length
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY day_of_week, member_casual;

--Average ride length per month
SELECT month, member_casual, ROUND(AVG(ride_length_mins)) AS avg_ride_length
FROM `6_month_data.cleaned_combined_tripdata`
GROUP BY month, member_casual;
