-- Checking the data types of all columns

select column_name, data_type
from `tripdata_2022`.INFORMATION_SCHEMA.COLUMNS
where table_name = 'tripdata_2022';

-- Checking the count of null values (if any) in each column

select count(*) - count(ride_id) as ride_id,
 count(*) - count(rideable_type) as rideable_type,
 count(*) - count(started_at) as started_at,
 count(*) - count(ended_at) as ended_at,
 count(*) - count(start_station_name) as start_station_name,
 count(*) - count(start_station_id) as start_station_id,
 count(*) - count(end_station_name) as end_station_name,
 count(*) - count(end_station_id) as end_station_id,
 count(*) - count(start_lat) as start_lat,
 count(*) - count(start_lng) as start_lng,
 count(*) - count(end_lat) as end_lat,
 count(*) - count(end_lng) as end_lng,
 count(*) - count(member_casual) as member_casual
from `tripdata_2022.tripdata_2022`;

-- Checking the count of duplicate values (if any)in the table

select count(ride_id) - count(distinct ride_id) as no_of_duplicates
from `tripdata_2022.tripdata_2022`;

-- Checking the data consistency for column "ride_id"

select length(ride_id) as length, count(ride_id) as no_of_rides
from `tripdata_2022.tripdata_2022`
group by length;

-- Checking the data consistency for column "rideable_type"

select distinct rideable_type, count(rideable_type) as no_of_trips
from `tripdata_2022.tripdata_2022`
group by rideable_type;

-- Count of invalid trips (trip time greater than a day [5360] or less than a minute [122283]) = 127643 invalid trips

select count(*) as invalid_trip
from `tripdata_2022.tripdata_2022`
where 
( extract(hour from (ended_at - started_at)) + extract(minute from (ended_at - started_at))/60 + extract(second from (ended_at - started_at))/3600)>=24
or
(extract(hour from (ended_at - started_at))*60 + extract(minute from (ended_at - started_at)) + extract(second from (ended_at - started_at))/60)<=1;

-- Checking the distinct values in column member_casual to identify any invalid values

select member_casual as membership_type, count(member_casual)
from `tripdata_2022.tripdata_2022`
group by member_casual;
