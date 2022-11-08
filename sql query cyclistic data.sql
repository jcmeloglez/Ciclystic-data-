--##This isthe sql query that i use to clean and prepare the cyclistic dataset for analysis#
--## creating the new table for our analysis
CREATE TABLE `case-study1-bikeshare.bikeshare.cyclistic_year0921-22` AS
 SELECT ride_id, rideable_type, member_casual,
  TIME_DIFF(ended_time,started_time,MINUTE) AS ride_legth_min,
  --##modifing the data that the query sould rutern, name of the weekday and name of the month 
  CASE
   WHEN day= 1 THEN "sunday"
   WHEN day= 2 THEN "monday"
   WHEN day= 3 THEN "tuesday"
   WHEN day= 4 THEN "wednesday"
   WHEN day= 5 THEN "thursday"
   WHEN day= 6 THEN "friday"
   WHEN day= 7 THEN "saturday"
  END AS day_of_week,
  CASE
   WHEN monthdate= 1 THEN "january"
   WHEN monthdate= 2 THEN "february"
   WHEN monthdate= 3 THEN "march"
   WHEN monthdate= 4 THEN "april"
   WHEN monthdate= 5 THEN "may"
   WHEN monthdate= 6 THEN "june"
   WHEN monthdate= 7 THEN "july"
   WHEN monthdate= 8 THEN "august"
   WHEN monthdate= 9 THEN "september"
   WHEN monthdate= 10 THEN "october"
   WHEN monthdate= 11 THEN "november"
   WHEN monthdate= 12 THEN "december"
   END AS month
 FROM
   (
    --## extracting adn creating column that we will need for analysis
    SELECT *,
     EXTRACT (dayofweek FROM started_at ) as day,
     EXTRACT (dayofyear FROM started_at) as day_of_year,
     EXTRACT (month FROM started_at) as monthdate,
     TIME(ended_at) AS ended_time, TIME(started_at) AS started_time
    FROM 
    (
     --##combining all the tables in one##
     SELECT ride_id,rideable_type,started_at,ended_at,member_casual,
       FROM `case-study1-bikeshare.bikeshare.Jan22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.feb22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.mar22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.apr22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.may22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.jun22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.jul22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.aug22`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.sept21`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
       FROM `case-study1-bikeshare.bikeshare.oct21`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
      FROM `case-study1-bikeshare.bikeshare.nov21`
      UNION ALL
      SELECT ride_id,rideable_type,started_at,ended_at,member_casual
      FROM `case-study1-bikeshare.bikeshare.dec21`
      AS cyclistic_fullyear ))
