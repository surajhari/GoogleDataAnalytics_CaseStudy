-- Creating a table tripdata_2022 combining the datasets for the entire year 2022

CREATE TABLE IF NOT EXISTS `tripdata_2022.tripdata_2022` AS (
  SELECT * FROM `tripdata_2022.tripdata_202201`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202202`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202203`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202204`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202205`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202206`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202207`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202208`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202209`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202210`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202211`
  UNION ALL
  SELECT * FROM `tripdata_2022.tripdata_202212`
);

--Checking the number of rows in the combined table

SELECT COUNT(*) FROM `tripdata_2022.tripdata_2022`;
