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
- Data Cleaning: Excel
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
  
  ### Data Cleaning in Excel:
  - Kiểm tra các giá trị trùng lặp: Các giá trị trùng lặp được kiểm tra bằng tính năng “Xóa các giá trị trùng lặp” tích hợp trong Excel. Điều này giúp      đảm bảo tính toàn vẹn dữ liệu và loại bỏ mọi mục nhập trùng lặp.
  - Xác thực các giá trị cột: Các giá trị trong các cột cụ thể, chẳng hạn như Rideable_type và member_casual, đã được xác minh để đảm bảo tính nhất         quán và chính xác. Các giá trị hợp lệ duy nhất, bao gồm (classic_bike, docked_bike, electric_bike) cho Rideable_type và (normal, member) cho    
    member_casual, đều được giữ lại.
  - Xóa các giá trị trống: Data -> Filter. Tập dữ liệu đã được kiểm tra để tìm các giá trị trống hoặc không đầy đủ trên tất cả các cột. Các hàng thiếu      giá trị, đặc biệt là trong các cột như start_station_name, start_station_id, end_station_name và end_station_id, đã bị xóa để đảm bảo tính đầy đủ   
    của dữ liệu.
  - Xóa các cột không cần thiết start_lat, start_lng, end_lat, and end_lng
  - Thêm Cột Độ dài Chuyến đi: Một cột mới có tên “ride_length” đã được thêm vào để tính thời lượng của mỗi chuyến đi. Giá trị trong cột Ride_length có     được bằng cách trừ dấu thời gian started_at khỏi dấu thời gian kết thúc_at. Đặt Định dạng Thời gian: Cột Ride_length được định dạng là “HH:MM:SS”       bằng cách sử dụng tùy chọn “Format > Cells > Time > 37:30:55”  trong Excel. Điều này đảm bảo rằng thời lượng chuyến đi được trình bày ở định dạng       thời gian tiêu chuẩn hóa.
 - Sắp xếp bảng: Bảng được sắp xếp theo thứ tự tăng dần dựa trên cột started_at để đảm bảo tính nhất quán của dữ liệu.
 - Bằng cách làm sạch dữ liệu trong Excel, tập dữ liệu đã được tinh chỉnh, giải quyết các vấn đề không nhất quán và thông tin về độ dài chuyến đi 
   được định dạng phù hợp cho phân tích tiếp theo.
   
 ### Data Transformation in SQL:
 - Importing Data: nhập dữ liệu chuyến đi hàng tháng vào MySQL
 - Merging Data: Hợp nhất dữ liệu 12 tháng thành một bảng “Annual_trip_data_2022” bằng cách sử dụng UNION ALL
 - Manipulate Data: Sau khi hợp nhất dữ liệu , tạo một bảng mới 'analyze_annual_trip_data', tạo thêm các cột  “month,” “day,” “hour,” và   
   “duration_minutes” cho việc dễ dàng so sánh tần suất đi xe.
   
## 4. Analyze
- Trong giai đoạn này tìm hiểu sâu vào dữ liệu để tìm hiểu và khám phá giải quyết các vấn đề chính liên quan cách các thành viên hàng năm (member) và người sử dụng bình thường (casual) sử dụng xe đạp một cách khác nhau.Trọng tâm tìm hiểu hành vi , sở thích nhằm đưa ra các chiến lược nhằm chuyển đổi thành viên causual sang member. Để giải quyết vấn đề đó sử dụng SQL Workbench.
  ### Tỷ lệ người đi xe thông thường so với thành viên hàng năm?
  ![image](https://github.com/user-attachments/assets/bbf34986-3f82-4c7a-a687-48034efff68c)

  ### Tỷ lệ chuyến đi theo mỗi loại xe đạp?
  ![image](https://github.com/user-attachments/assets/5edec1f4-cfc3-4e23-8246-eff714679d41)

  ### Tỷ lệ chuyến đi mỗi tháng?
  ![image](https://github.com/user-attachments/assets/594561c6-08a8-4f0d-8451-e9ad4d05c22b)

  ### Số lượng người đi mỗi ngày?
  

  ### Thời gian đi xe trung bình theo ngày ( phút)?

  
Tần suất chuyến đi mỗi giờ?
Tỷ lệ chuyến đi mỗi mùa?
Tỷ lệ chuyến đi trong mỗi múi giờ? 



