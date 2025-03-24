# CYCLISTIC MEMBERSHIP CONVERSION STRATEGY Project
Case study: How does a bike-share navigate speedy success?
![image](https://github.com/user-attachments/assets/01972782-4fdd-4815-998e-487fcc5a845b)


# LINK:
  ### Data Source: 
[The previous 12 months of Cyclistic trip data
](https://divvy-tripdata.s3.amazonaws.com/index.html) 

  ### SQL code:
  
  - [Merge_Manipulate_data](https://github.com/hiuuuuuuuu/Cyclistic-Bike-Share-Google-Data-Analytics-Capstone-Project/blob/main/merge_manipulate_data.sql) 

  - [Analyze data](https://github.com/hiuuuuuuuu/Cyclistic-Bike-Share-Google-Data-Analytics-Capstone-Project/blob/main/analyze.sql)

  ### Visualization:
  
  - Tableau: [Cyclistic Dashboard](https://public.tableau.com/views/cyclistic_Dashboard/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
    ![image](https://github.com/user-attachments/assets/d0be4e8d-2a6c-46e7-b604-653a169042cf)

# Introduce:
Nghiên cứu điển hình này trình bày một dự án phân tích dữ liệu được thực hiện như một phần của khóa học Chứng chỉ Chuyên nghiệp về Phân tích Dữ liệu của Google, Dự án Capstone, tập trung vào Cyclistic, một công ty cho thuê xe đạp

Với tư cách là nhà phân tích dữ liệu trong nhóm phân tích tiếp thị, mục tiêu là phát triển một chiến lược tiếp thị mới để chuyển đổi những người đi xe bình thường thành thành viên hàng năm.

Goal: khám phá những hiểu biết quan trọng có thể cung cấp thông tin cho các chiến thuật tiếp thị được nhắm mục tiêu và thúc đẩy chuyển đổi những người đi xe bình thường thành thành viên hàng năm.

# Tool:
- Data Cleaning: Excel
- Data Analysis: MYSQL Workbench
- Visualization: Tableau Public

## 1. ASK:
- Tỷ lệ người đi xe thông thường so với thành viên hàng năm?
- Tỷ lệ chuyến đi theo mỗi loại xe đạp?
- Tỷ lệ chuyến đi mỗi tháng?
- Số lượng người đi mỗi ngày ?
- Tỷ lệ chuyến đi mỗi mùa ?
- Thời gian đi xe trung bình theo ngày ( phút)?
- Tần suất chuyến đi mỗi giờ?
- Tỷ lệ chuyến đi trong mỗi múi giờ (sáng-trưa-chiều-tối)?

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
   - Tạo ra cột time_zone (múi giờ)
   - Tạo ra cột season(mùa)
   - Thêm cột ride_length_minutes(độ dài chuyến đi mỗi phút)
   
## 4. Analyze
- Trong giai đoạn này tìm hiểu sâu vào dữ liệu để tìm hiểu và khám phá giải quyết các vấn đề chính liên quan cách các thành viên hàng năm (member) và người sử dụng bình thường (casual) sử dụng xe đạp một cách khác nhau.Trọng tâm tìm hiểu hành vi , sở thích nhằm đưa ra các chiến lược nhằm chuyển đổi thành viên causual sang member. Để giải quyết vấn đề đó sử dụng SQL Workbench.
  
  ### Tỷ lệ người đi xe thông thường so với thành viên hàng năm?
  
  ![image](https://github.com/user-attachments/assets/bbf34986-3f82-4c7a-a687-48034efff68c)

  ### Tỷ lệ chuyến đi theo mỗi loại xe đạp?
  
  ![image](https://github.com/user-attachments/assets/f78b5591-a47c-42fb-9bc4-47537e2d1db3)

  ### Tỷ lệ chuyến đi mỗi tháng?
  
  ![image](https://github.com/user-attachments/assets/7af0ae16-a59d-43f1-b056-65dc79f77ca0)

  ### Số lượng người đi mỗi ngày?
  
  ![image](https://github.com/user-attachments/assets/718a7f60-3e67-47a0-adf3-73c7afda3fd1)

  ### Tần suất chuyến đi mỗi giờ?
  
  ![image](https://github.com/user-attachments/assets/8d4d1ddb-da30-4f95-99bf-2f67ad5a5c97)

  ### Thời gian đi xe trung bình theo ngày ( phút)?
  
  ![image](https://github.com/user-attachments/assets/54ea100e-3576-4f9d-bafd-a0d385749efd)

    
  ### Tỷ lệ chuyến đi mỗi mùa?
  
  ![image](https://github.com/user-attachments/assets/bb02bbdf-57f9-4997-82b3-1d86790f86f9)

  
  ### Tỷ lệ chuyến đi trong mỗi múi giờ? 

  ![image](https://github.com/user-attachments/assets/5a42aa1d-4e1b-406f-b21f-b3d2aa687a50)

# 5. Share

Giai đoạn chia sẻ những phân tích hiểu biết từ việc phân tích dữ liệu Cyclistic Bike Share thông qua Tableau Public.

  ### Tỷ lệ người đi xe thông thường so với thành viên hàng năm?
  
  ![image](https://github.com/user-attachments/assets/88246a59-5f23-4b16-af20-ad16102e804d)
- Trong năm 2022, thành viên (member) chiếm 69.41% trong tổng số 156.675 rides.
  
  ### Tỷ lệ chuyến đi theo mỗi loại xe đạp?
  ![image](https://github.com/user-attachments/assets/bc4cac29-8e2a-4c42-9cd9-b51953c1c3ce)

- member có sự ưu tiên sử dụng electric_bike, classic_bike. casual sữ dụng docked_bike nhiều nhất.
  
  ### Tỷ lệ chuyến đi mỗi tháng?
  ![image](https://github.com/user-attachments/assets/51409140-389a-48c3-b376-ac71cfe4e8d3)
- Qua ta thấy member sử dụng nhiều nhất vào tháng 2, casual dùng nhiều nhất rơi vào tháng 7.

  ### Số lượng người đi mỗi ngày?
  ![image](https://github.com/user-attachments/assets/07a6f040-45e1-4581-becd-49327fd693f5)
- Nhìn chung rides có xu huong sử dụng xe đạp trải đều có sự thấp vào ngày cuối tuần, giữa tuần.
  ### Tần suất chuyến đi mỗi giờ?
  ![image](https://github.com/user-attachments/assets/d1cc74d3-a2d1-4a87-968c-e5b481986da2)
- rides có xu hướng sử dụng xe đạp nhiều vào khoảng 7-8 h sáng và 6-8 h chiều rơi khoảng giờ đi làm và tan tầm.
  ### Thời gian đi xe trung bình theo ngày ( phút)?
  ![image](https://github.com/user-attachments/assets/598c8f82-2c18-41af-87e1-56a613888224)
- Nhìn chung casual sử dụng xe đạp lâu và dài hơn so với member.
  
  ### Tỷ lệ chuyến đi mỗi mùa?
  ![image](https://github.com/user-attachments/assets/07ca0877-8572-4847-b341-9a46c8c34cb8)
- member sử dụng nhiều vào mùa đông, casual nhỉnh vào mùa hè.

  ### Tỷ lệ chuyến đi trong mỗi múi giờ? 
  ![image](https://github.com/user-attachments/assets/dbf1894f-7e92-4647-af5e-f4917db57470)
- member có mức độ sử dụng nhiều trải dài vào ban ngày, casual có xu hướng thích sử dụng vào ban đêm.

# 6. ACT:
  ### Những điểm chính:
  Dựa vào quá trình phân tích tôi có vài điểm chính đưa ra:
  - Sở thích về loại xe: Các member có sự ưu tiên dùng dòng xe cơ bản và dòng xe điện , trong khi casual có sự ưu tiên sử dụng với dòng xe docked
  - Sự thay đổi theo tháng: Các member luôn có tỷ lệ sử dụng cao hơn casual. member sử dụng nhiều vào tháng 2 , casual dùng nhiều vào tháng 7.
  - Sự thay đổi theo ngày: Cả member và casual đều có mức độ sử dụng nhiều vào những ngày trong tuần, ít hơn trong ngày cuối tuần.
  - Thời lượng sữ dụng xe đạp: Khoảng thời gian sử dụng xe đạp của casual có mức độ dài hơn so với member.
  - Gio sử dụng cao điểm : member va casual đều có mức độ sử dụng cào vào 7-8 sáng, 6-7 h chiều.
  - Phân bố múi giờ: member xu hướng sử dụng nhiều vào buổi sáng, casual có mức độ sử dụng nhiều ở buổi đêm
    

  ### Những chiến lược chuyển đổi những người đi xe đạp không thường xuyên (casual) sang thành viên thường xuyên (member):
  
  - Các chương trình khuyến mãi: Cung cấp gói giảm giá 50% tháng đầu tiên khi đăng kí thành viên, đồng thời nêu vật lên những lợi ích khi sử dụng gói thành viên tiết kiệm chi phí, tiện lợi, linh động.
  - Có các chương trình trải nghiệm sử dụng miễn phí nâng cao cảm nhận người dùng tăng sự tin cậy.
  - Các chiến dịch quảng bá: nêu bật mối quan tâm người dùng hướng tới việc bảo vệ sức khỏe thông qua số giờ đạp xe giúp cải thiện thế nào về mặt tinh thần sức khỏe. Ngoài ra, nêu bật lên việc bảo vệ môi trường xanh, không khí        trong sách.
  - Cải thiện chất lượng thông qua việc tăng các bãi đỗ xe các dòng xe gần các trung tâm, tòa nhà lớn, nơi có nhiều người đi chuyển, gần các bến tàu, bến ga.
  - Có các chương trình tích điểm, lấy phần thưởng, các giải thưởng -> tăng sự phấn khích người dùng.
  - Có các chính sách bảo dưỡng xe định kì để khách hàng có được trải nhiệm ấn tượng tốt, thoải mái, dễ chịu.



  
  
