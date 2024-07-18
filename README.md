# Cyclistic-Bike-Share-Google-Data-Analytics-Capstone-Project
Case study: How does a bike-share navigate speedy success?
![image](https://github.com/user-attachments/assets/01972782-4fdd-4815-998e-487fcc5a845b)


# LINK:
### Data Source: 
[The previous 12 months of Cyclistic trip data
](https://divvy-tripdata.s3.amazonaws.com/index.html) 

# Introduce:
Nghiên cứu điển hình này trình bày một dự án phân tích dữ liệu được thực hiện như một phần của khóa học Chứng chỉ Chuyên nghiệp về Phân tích Dữ liệu của Google, Dự án Capstone, tập trung vào Cyclistic, một công ty cho thuê xe đạp

Với tư cách là nhà phân tích dữ liệu trong nhóm phân tích tiếp thị, mục tiêu là phát triển một chiến lược tiếp thị mới để chuyển đổi những người đi xe bình thường thành thành viên hàng năm.

Goal: khám phá những hiểu biết quan trọng có thể cung cấp thông tin cho các chiến thuật tiếp thị được nhắm mục tiêu và thúc đẩy chuyển đổi những người đi xe bình thường thành thành viên hàng năm.

# Tool:
- Data Cleaning: Python
- Data Analysis: Microsft SQL Server
- Visualization: Tableau Public

## 1. ASK:
- Tỷ lệ người đi xe thông thường so với thành viên hàng năm?
- Tỷ lệ chuyến đi theo mỗi loại xe đạp?
- Tỷ lệ chuyến đi mỗi tháng?
- Tỷ lệ chuyến đi mỗi mùa?
- Thời gian đi xe trung bình theo ngày ( phút)?
- Tần suất chuyến đi mỗi giờ?
- Tỷ lệ chuyến đi mỗi mùa?
- Tỷ lệ chuyến đi trong mỗi múi giờ?

## 2. Prepare:
- Tập dữ liệu từ tháng 1 đến tháng 12 năm 2022
- Mỗi tệp trong tập dữ liệu chứa 13 cột liên quan đến việc đạp xe.
- Các cột này cung cấp thông tin chi tiết về từng chuyến đi, bao gồm ID chuyến đi (ride_id) , loại xe có thể đi được(rideable_type), ID trạm xuất phát và trạm kết thúc cũng như vị trí, tọa độ và loại thành viên.

## 3.Process:
Tool: Python
  ### Data Performance:
  - tiến hành nhập dữ liệu 12 tháng thành một view
  - thêm cột ride_length = end_at - start_at
  - Tạo ra các cột  day_of_week, month, year, time, hour, season.
  ### Data Cleaning:
  - Xóa các cột duplicate, Na.
  - Xóa các cột right_length = 0 và <0
  - Lấy ra các cột cần phân tích rideable_type,member_casual,	ride_length,	date,	day_of_week,	month,	day,	year,	hour,	season.




