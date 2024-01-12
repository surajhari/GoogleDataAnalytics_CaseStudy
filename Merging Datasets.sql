-- Creating a table tripdata_2022 combining the datasets for the entire year 2022

create table if not exists `tripdata_2022.tripdata_2022` as (
  select * from `tripdata_2022.tripdata_202201`
  union all
  select * from `tripdata_2022.tripdata_202202`
  union all
  select * from `tripdata_2022.tripdata_202203`
  union all
  select * from `tripdata_2022.tripdata_202204`
  union all
  select * from `tripdata_2022.tripdata_202205`
  union all
  select * from `tripdata_2022.tripdata_202206`
  union all
  select * from `tripdata_2022.tripdata_202207`
  union all
  select * from `tripdata_2022.tripdata_202208`
  union all
  select * from `tripdata_2022.tripdata_202209`
  union all
  select * from `tripdata_2022.tripdata_202210`
  union all
  select * from `tripdata_2022.tripdata_202211`
  union all
  select * from `tripdata_2022.tripdata_202212`
);

--Checking the number of rows in the combined table

select count(*) from `tripdata_2022.tripdata_2022`;
