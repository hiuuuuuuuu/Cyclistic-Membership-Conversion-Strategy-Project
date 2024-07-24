Create schema bike;

use bike;

-- Merging Data: Hợp nhất dữ liệu 12 tháng thành một bảng “Annual_trip_data_2022” bằng cách sử dụng UNION ALL
DROP TABLE IF exists Annual_trip_data_2022;
CREATE TABLE  Annual_trip_data_2022 AS (
SELECT * FROM Trip_data_2022_01
UNION ALL
SELECT * FROM Trip_data_2022_02
UNION ALL
SELECT * FROM Trip_data_2022_03
UNION ALL
SELECT * FROM Trip_data_2022_04
UNION ALL
SELECT * FROM Trip_data_2022_05
UNION ALL
SELECT * FROM Trip_data_2022_06
UNION ALL
SELECT * FROM Trip_data_2022_07
UNION ALL
SELECT * FROM Trip_data_2022_08
UNION ALL
SELECT * FROM Trip_data_2022_09
UNION ALL
SELECT * FROM Trip_data_2022_10
UNION ALL
SELECT * FROM Trip_data_2022_11
UNION ALL
SELECT * FROM Trip_data_2022_12
);
  
SELECT * FROM Annual_trip_data_2022;

SET SQL_SAFE_UPDATES = 0;

-- chỉnh kiểu dữ liệu started_at và ended_at thành '%m/%d/%Y %H:%i'
UPDATE Annual_trip_data_2022
SET started_at = STR_TO_DATE(started_at, '%m/%d/%Y %H:%i')
WHERE started_at REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4} [0-9]{1,2}:[0-9]{2}$';

UPDATE Annual_trip_data_2022
SET ended_at = STR_TO_DATE(ended_at, '%m/%d/%Y %H:%i')
WHERE ended_at REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4} [0-9]{1,2}:[0-9]{2}$';

SET SQL_SAFE_UPDATES = 1;

-- chỉnh kiểu dữ liệu annual_trip_data
ALTER TABLE Annual_trip_data_2022
MODIFY COLUMN ride_id VARCHAR(255),
MODIFY COLUMN rideable_type VARCHAR(255),
MODIFY COLUMN started_at DATETIME,
MODIFY COLUMN ended_at DATETIME,
MODIFY COLUMN member_casual VARCHAR(255),
MODIFY COLUMN ride_length TIME(0);

-- Manipulate Data:

DROP TABLE IF EXISTS analyze_anuual_trip_data;

-- tạo một bảng mới 'analyze_annual_trip_data', tạo thêm các cột “month,” “day,” “hour,” và
-- “duration_minutes” cho việc dễ dàng so sánh tần suất đi xe.

CREATE TABLE analyze_annual_trip_data (
  ride_id VARCHAR(255),
  rideable_type VARCHAR(255),
  started_at DATETIME,
  ended_at DATETIME,
  member_casual VARCHAR(255),
  ride_length TIME,
  months VARCHAR(255),
  weekdays VARCHAR(255),
  hours INT,
  duration_minutes INT
);

-- nhập dữ liệu từ annual_trip_data_2022 vào analyze_annual_trip_data 
INSERT INTO analyze_annual_trip_data 
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  member_casual,
  ride_length,
  MONTHNAME(started_at) AS months,
  DAYNAME(started_at) AS weekdays,
  HOUR(started_at) AS hours
FROM annual_trip_data_2022;


SELECT * FROM analyze_annual_trip_data;


/* UPDATE*/

-- thêm cột ride_length_minutes(độ dài chuyến đi mỗi phút)
ALTER TABLE analyze_annual_trip_data
ADD COLUMN ride_length_minutes  FLOAT;

UPDATE analyze_annual_trip_data
SET ride_length_minutes = ROUND(ride_length/60,2);

-- Tạo ra cột time_zone (múi giờ)
ALTER TABLE analyze_annual_trip_data
ADD COLUMN time_zone VARCHAR(20);

UPDATE analyze_annual_trip_data
SET time_zone = CASE
    WHEN hours >= 0 AND hours < 6 THEN 'Night'
    WHEN hours >= 6 AND hours < 12 THEN 'Morning'
    WHEN hours >= 12 AND hours < 18 THEN 'Afternoon'
    WHEN hours >= 18 THEN 'Evening'
END;

-- Tạo ra cột season(mùa)
ALTER TABLE analyze_annual_trip_data
ADD COLUMN season VARCHAR(20);

UPDATE analyze_annual_trip_data
SET season = CASE
    WHEN months IN ('December', 'January', 'February') THEN 'Winter'
    WHEN months IN ('March', 'April', 'May') THEN 'Spring'
    WHEN months IN ('June', 'July', 'August') THEN 'Summer'
    WHEN months IN ('September', 'October', 'November') THEN 'Autumn'
END;

