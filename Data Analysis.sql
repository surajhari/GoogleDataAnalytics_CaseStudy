-- Count of trips based on the available bike types and their respective membership type

select rideable_type, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by rideable_type
order by no_of_trips desc;

select rideable_type, member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by rideable_type, member_casual
order by no_of_trips desc;

-- Count of trips based on the days of a week and their respective membership type

select weekday, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by weekday
order by no_of_trips desc;

select weekday, member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by weekday, member_casual
order by no_of_trips desc;

-- Count of trips based on the month and their respective membership type

select month, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by month
order by no_of_trips desc;

select month, member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by month, member_casual
order by no_of_trips desc;

-- Count of trips based on the membership type

select member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group  by member_casual
order by no_of_trips desc;

-- Count of trips based on hour of the day and their respective membership type

select extract(hour from started_at) as hour_of_day, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by hour_of_day
order by no_of_trips desc;

select extract(hour from started_at) as hour_of_day, member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by hour_of_day, member_casual
order by no_of_trips desc;

-- Average trip duration based on the types of bike and their respective membership type

select rideable_type, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group by rideable_type
order by avg_trip_duration_in_mins desc;

select rideable_type, member_casual, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group by rideable_type, member_casual
order by avg_trip_duration_in_mins desc;

-- Average trip duration based on the membership type

select member_casual, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group by member_casual
order by avg_trip_duration_in_mins desc;

-- Average trip duration based on the days of a week and their respective membership type

select weekday, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group  by weekday
order by avg_trip_duration_in_mins desc;

select weekday, member_casual, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group  by weekday, member_casual
order by avg_trip_duration_in_mins desc;

-- Average trip duration based on the month and their respective membership type

select month, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group  by month
order by avg_trip_duration_in_mins desc;

select month, member_casual, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group  by month, member_casual
order by avg_trip_duration_in_mins desc;

-- Average trip duration based on the hour of the day and their respective membership type

select extract(hour from started_at) as hour_of_day, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group by hour_of_day
order by avg_trip_duration_in_mins desc;

select extract(hour from started_at) as hour_of_day, member_casual, avg(ride_length_mins) as avg_trip_duration_in_mins
from `tripdata_2022.cleaned_tripdata_2022`
group by hour_of_day, member_casual
order by avg_trip_duration_in_mins desc;

-- Count of trips based on the ride start location and their respective membership type

select start_station_name, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by start_station_name
order by no_of_trips desc;

select start_station_name, member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by start_station_name, member_casual
order by no_of_trips desc;

-- Count of trips based on the ride end location and their respective membership type

select end_station_name, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by end_station_name
order by no_of_trips desc;

select end_station_name, member_casual, count(*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by end_station_name, member_casual
order by no_of_trips desc;

-- Analysing the popularity of ride types over month, weekdays and hours of the day

select month,rideable_type, count (*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by month, rideable_type
order by no_of_trips desc;

select weekday,rideable_type, count (*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by weekday, rideable_type
order by no_of_trips desc;

select extract(hour from (started_at)) as hour,rideable_type, count (*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by hour, rideable_type
order by no_of_trips desc;

-- Most popular start stations and end stations (Top 10 here)

select start_station_name, count (*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by start_station_name, end_station_name
order by no_of_trips desc
limit 10;

select end_station_name, count (*) as no_of_trips
from `tripdata_2022.cleaned_tripdata_2022`
group by start_station_name, end_station_name
order by no_of_trips desc
limit 10;