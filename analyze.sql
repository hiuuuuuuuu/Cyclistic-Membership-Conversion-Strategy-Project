-- Analyze Data
use bike;

-- 1. Percentage of Casual Rides vs Annual Member
SELECT 
	member_casual AS membership_type,
    COUNT(*) AS total_ride,
    SUM(COUNT(*)) OVER() AS total_member_ship,
    ROUND( COUNT(*) * 100 /(SELECT COUNT(*) FROM analyze_annual_trip_data) , 2) AS membership_percentage
FROM 
	analyze_annual_trip_data
WHERE 
	member_casual IS NOT NULL
GROUP BY
	member_casual;
    
SELECT * FROM analyze_annual_trip_data;

-- 2. Propotion of rides by Bike Type (Tỷ lệ chuyến đi theo mỗi loại xe đạp)
SELECT
	rideable_type AS bike_type,
    member_casual AS membership_type,
    COUNT(rideable_type) AS total_membership_count,
    SUM(COUNT(rideable_type)) OVER (PARTITION BY rideable_type) total_membership,
    CONCAT( ROUND( COUNT(rideable_type)*100 / SUM(COUNT(rideable_type)) OVER(PARTITION BY rideable_type),2), '%') AS membership_percentage
FROM
	analyze_annual_trip_data
WHERE
	member_casual IS NOT NULL
GROUP BY
	rideable_type, member_casual
ORDER BY
	rideable_type;


-- 3.Tỷ lệ chuyến đi mỗi tháng?
select DISTINCT hours from analyze_annual_trip_data ORDER BY  hours DESC;

SELECT 
	member_casual as membership_type,
    months,
    COUNT(member_casual) AS membership_rides,
    SUM(COUNT(member_casual))  OVER(PARTITION BY months) AS total_rides_per_month,
    CONCAT( ROUND ( COUNT(member_casual)*100 / SUM(COUNT(member_casual)) OVER(PARTITION BY months) ,2) ,'%') AS membership_percentage_month
FROM analyze_annual_trip_data
GROUP BY
	member_casual, months
ORDER BY 
	CASE months
		WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
	END ASC, member_casual;

-- Số lượng người đi mỗi ngày ?
SELECT 
	member_casual AS membership_type,
    weekdays,
    COUNT(weekdays) AS rides_per_day
FROM 
	analyze_annual_trip_data
GROUP BY
	member_casual, weekdays
ORDER BY 
	CASE weekdays
     WHEN 'Sunday' THEN 7
	 WHEN 'Monday' THEN 1
	 WHEN 'Tuesday' THEN 2 
	 WHEN 'Wednesday' THEN 3
	 WHEN 'Thursday' THEN 4
	 WHEN 'Friday' THEN 5
	 WHEN 'Saturday' THEN 6
END ASC, member_casual;
    
SELECT *  FROM analyze_annual_trip_data;

-- Tần suất chuyến đi mỗi giờ?

SELECT member_casual AS membership_type, 
hours,
COUNT(hours) AS rides_per_hour
FROM analyze_annual_trip_data
WHERE member_casual IS NOT NULL 
GROUP BY member_casual, hours 
ORDER BY rides_per_hour DESC;


-- Thời gian đi xe trung bình theo ngày ( phút)?
SELECT 
	member_casual,
    weekdays,
    ROUND(AVG(ride_length_minutes),0) AS avg_ride_duration_minus
FROM
	analyze_annual_trip_data
GROUP BY 
	member_casual, weekdays
ORDER BY
	CASE weekdays
     WHEN 'Sunday' THEN 7
	 WHEN 'Monday' THEN 1
	 WHEN 'Tuesday' THEN 2 
	 WHEN 'Wednesday' THEN 3
	 WHEN 'Thursday' THEN 4
	 WHEN 'Friday' THEN 5
	 WHEN 'Saturday' THEN 6
	END ASC, member_casual;

--  Tỷ lệ chuyến đi mỗi mùa?
SELECT 
	member_casual,
    season,
    COUNT(member_casual) AS ride_per_season,
    SUM(COUNT(season)) OVER(PARTITION BY season) AS total_rides_per_season,
    CONCAT(ROUND(COUNT(member_casual)*100 /  SUM(COUNT(season)) OVER(PARTITION BY season),2),'%') AS percentage_per_season
FROM
	analyze_annual_trip_data
GROUP BY
	member_casual, season
ORDER BY
    CASE season 
		WHEN 'Spring' THEN 1
        WHEN 'Summer' THEN 2
        WHEN 'Autumn' THEN 3
        ELSE 4
	END ASC, member_casual;


-- Tỷ lệ chuyến đi trong mỗi múi giờ?
SELECT 
	member_casual,
    time_zone,
    COUNT(member_casual) AS rides_per_time_zone,
    CONCAT( ROUND( COUNT(member_casual)*100/SUM(COUNT(time_zone)) OVER(PARTITION BY time_zone),2),'%') AS percentage_of_rides
FROM
	analyze_annual_trip_data
GROUP BY
	member_casual, time_zone
ORDER BY
	CASE time_zone
		WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
        ELSE 4
	END ASC;




