-- Creating a new table with cleaned data

create table if not exists `tripdata_2022.cleaned_tripdata_2022` as
(
  select a.ride_id, rideable_type, started_at, ended_at, ride_length_mins,
  case extract(dayofweek from started_at) 
      when 1 then 'Sunday'
      when 2 then 'Monday'
      when 3 then 'Tuesday'
      when 4 then 'Wednesday'
      when 5 then 'Thursday'
      when 6 then 'Friday'
      when 7 then 'Saturday'    
    end as weekday,
    case extract(month from started_at)
      when 1 then 'January'
      when 2 then 'February'
      when 3 then 'March'
      when 4 then 'April'
      when 5 then 'May'
      when 6 then 'June'
      when 7 then 'July'
      when 8 then 'August'
      when 9 then 'September'
      when 10 then 'October'
      when 11 then 'November'
      when 12 then 'December'
    end as month, 
    start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual
  from `tripdata_2022.tripdata_2022` a
  join (
    select ride_id,
    (extract(hour from (ended_at - started_at)) * 60 +
    extract(minute from (ended_at - started_at)) +
    extract(second from (ended_at - started_at)) / 60) as ride_length_mins
   from `tripdata_2022.tripdata_2022`
  ) b
  on a.ride_id=b.ride_id
  where
  start_station_name is not null and
  end_station_name is not null and
  end_lat is not null and
  end_lng is not null and
  ride_length_mins > 1 and ride_length_mins < 1440
);

-- Making the column ride_id as the primary key of table cleaned_tripdata_2022

alter table `tripdata_2022.cleaned_tripdata_2022`
add primary key(ride_id) not enforced;

-- Checking the number of records after cleaning the data

select count(ride_id) as no_of_rows
from `tripdata_2022.cleaned_tripdata_2022`;