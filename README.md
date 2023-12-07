# Google Data Analytics Capstone: Cyclistic Case Study

### Quick links:

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

SQL Queries:
[Data Combining](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Combining.sql)
[Data Exploration](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Exploration.sql)
[Data Cleaning](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)
[Data Analysis](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)



Data Visualizations: [Tableau](https://public.tableau.com/views/CyclisticCaseStudyGoogleDataAnalyticsCapstone/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)


## Background

### Cyclistic

A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Ask

Find a way to convert casual riders into annual members
Questions asked to guide future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Assigned question to answer:
How do annual members and casual riders use Cyclistic bikes differently?


## Prepare

The data has been provided by Motivate International Inc under this [license](https://divvybikes.com/data-license-agreement) and due to data-privacy issues the use of riders’ personally identifiable information has been prohibited. I will be looking at data from the last 12-months, November 2022 to April 2023. The data is located on a AWS server and is named/organized by date (XXXXXX-divvy-tripdata.zip). The 6 excel files include information from each month such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. 


## Process

I will be using Bigquery to combine and clean the data, as the dataset is rather large and excel would not be able to handle the large dataset efficiently.
Before loading the data, I first created two new columns in each CSV file, ride_length which stored the duration of each trip and day_of_week which provided the day of the week in which the trip took place. 
I combined all the files into one table and named it combined_tripdata from there I determined if there are any duplicates using the ride_id as the main identifier. After verifying there are no duplicates I then proceeded to determine if there are any null values. Once identified I removed the entries that contained nulls as well as entries that had a ride duration less then one minute or more then twenty-four hours from the dataset, therefore taking are data set from 1,585,555 rows to 1,157,585 entries.

## Combining Data
SQL Query: [Data Combining](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Combining.sql)
6 CSV files were uploaded as tables in the dataset "6_month_data" and combinied into table named "combined_tripdata" containing 1,585,555 rows of data for a six month time period.

## Data Exploration
SQL Query:[Data Exploration](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Exploration.sql)

Below is table showing the different column names and their datatypes
![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/4a5d0240-682b-49ed-8bc8-c8f8ca39428a)

The following table shows the number of null values contained in each column

![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/dc38c614-7775-43e7-8a66-45a8c8eb6891)
![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/874f5332-849f-44fc-9a03-d079119cb010)

Checking for duplicates using the primary key ride_id as there are no null values contained in this column
![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/cd880bbf-c26c-4eba-9100-7f35c201af81)

## Cleaning

1. All rows containing null values were removed from the dataset
2. Three new columns were added: ride_length to show the duration of the trip, day_of_week and month.
3. Trips that were less then a minute and longer then twenty-four hours were removed

## Analyze and Share
SQL Query:[Data Analysis](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)
Data Visualization:[Tableau](https://public.tableau.com/views/CyclisticCaseStudyGoogleDataAnalyticsCapstone/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)

First we take a look at the amount of member riders and casual riders
<img align="left" width="100" height="100" src="![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/6b191c78-ca23-42f8-a9b6-270920317a8b)">

Here we can see that memeber riders make a majority of the riders

Now we'll take a look at the number of trips users take on a monthly and daily basis

![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/023a26bc-eb41-40f2-a19e-b2bd0ed23200)

![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/57288884-ac76-4c26-9ab7-8554a024ee95)


We can see that both on daily and monthly basis that member riders are taking more rides then casual users

Here we can see the average ride duration

![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/039fd0f5-658c-478d-a0fc-55a7e8855d5b)

Although member riders may take more trips we can see the causal riders on average take longer trips

Here we take a long at the average ride duration per day and month
![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/a4fb1db0-77db-4285-b317-43807f462d3f)
![image](https://github.com/bmj3165/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/assets/77288897/6622a7d7-e2b4-4a31-85b8-9292cf2b7d11)













