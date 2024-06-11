# Cyclistic-Bike-Share-Google-Data-Analytics-Capstone-Project
Kho lưu trữ này chứa dự án Google Data Analytics Capstone - Case Study 1, đây là giai đoạn cuối cùng của khóa học Google Data Analytics trên Coursera.
# Introduction and Scenerio
Google Data Analytics Capstone Project: 

How Does a Bike-Share Navigate Speedy Success?
Làm thế nào để dịch vụ chia sẻ xe đạp đạt được thành công nhanh chóng?

The Cyclistic case study là một phần của Google Professional Data Analytics Certification.. Trong nghiên cứu điển hình này, tôi đóng vai trò là nhà phân tích dữ liệu cấp dưới tại Cyclistic. Tôi sẽ làm theo các bước quy trình phân tích dữ liệu cơ bản để giải quyết các vấn đề kinh doanh cốt lõi. Tôi là nhà phân tích dữ liệu cấp dưới làm việc trong nhóm phân tích tiếp thị tại Cyclistic, một công ty chia sẻ xe đạp ở Chicago. Giám đốc tiếp thị tin rằng thành công trong tương lai của công ty sẽ phụ thuộc vào việc tối đa hóa số lượng thành viên hàng năm. Vì vậy, với tư cách là một nhóm tiếp thị, anh ấy muốn hiểu cách sử dụng xe đạp đi xe đạp theo những cách khác nhau tùy theo loại thành viên. Ở đây, nhiệm vụ của tôi sẽ là xem xét và phân tích dữ liệu trong 12 tháng, để có được những hiểu biết sâu sắc về dữ liệu này thông qua một số hình ảnh trực quan nhất định và trình bày nó với nhóm. Tôi đã phân tích dữ liệu rất cụ thể và cố gắng hỗ trợ những hiểu biết này bằng các biểu đồ rõ ràng để các đề xuất của tôi có thể được tính đến.

# About the Company
Vào năm 2016, Cyclistic đã triển khai thành công dịch vụ chia sẻ xe đạp. Kể từ đó, chương trình đã phát triển thành một đội gồm 5.824 chiếc xe đạp được định vị địa lý và khóa vào mạng lưới gồm 692 trạm trên khắp Chicago. Xe đạp có thể được mở khóa từ một trạm và quay trở lại bất kỳ trạm nào khác trong hệ thống bất cứ lúc nào. Cho đến nay, chiến lược tiếp thị của Cyclistic dựa vào việc xây dựng nhận thức chung và thu hút các phân khúc người tiêu dùng rộng rãi. Một cách tiếp cận đã giúp thực hiện được những điều này là tính linh hoạt trong các gói giá của nó: vé đi một lần, vé cả ngày và tư cách thành viên hàng năm. Những khách hàng mua vé đi một chuyến hoặc cả ngày được gọi là những người đi xe thông thường. Khách hàng mua tư cách thành viên hàng năm là thành viên Cyclistic. Các nhà phân tích tài chính của Cyclistic đã kết luận rằng các thành viên thường niên có lợi hơn nhiều so với những người đi xe đạp thông thường. Mặc dù tính linh hoạt về giá giúp Cyclistic thu hút nhiều khách hàng hơn nhưng Moreno tin rằng việc tối đa hóa số lượng thành viên hàng năm sẽ là chìa khóa cho sự phát triển trong tương lai. Thay vì tạo ra một chiến dịch tiếp thị nhắm đến khách hàng hoàn toàn mới, Moreno tin rằng có một cơ hội rất tốt để chuyển đổi những người đi xe bình thường thành thành viên. Cô lưu ý rằng những người đi xe đạp bình thường đã biết đến chương trình Xe đạp và đã chọn Xe đạp cho nhu cầu di chuyển của họ. Moreno đã đặt ra mục tiêu rõ ràng: Thiết kế các chiến lược tiếp thị nhằm chuyển đổi những người đi xe bình thường thành thành viên thường niên. Tuy nhiên, để làm được điều đó, nhóm phân tích tiếp thị cần hiểu rõ hơn sự khác nhau giữa thành viên thường niên và người đi xe thông thường, tại sao người đi xe bình thường lại mua tư cách thành viên và phương tiện truyền thông kỹ thuật số có thể ảnh hưởng đến chiến thuật tiếp thị của họ như thế nào. Moreno và nhóm của cô quan tâm đến việc phân tích dữ liệu lịch sử về chuyến đi bằng xe đạp để xác định xu hướng. Trong nghiên cứu điển hình này, tôi sẽ rút ra 6 giai đoạn của quá trình phân tích, đó là Ask, Prepare, Process, Analyze, Share and Act.

Tôi đã tải xuống các bộ dữ liệu từ liên kết dưới đây.

[The previous 12 months of Cyclistic trip data
](https://divvy-tripdata.s3.amazonaws.com/index.html) 

# Phase 1: ASK
Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
## 1.1 Bussiness Task : Nhiệm vụ kinh doanh
Phân tích dữ liệu để hiểu rõ hơn về cách người dùng sử dụng xe đạp của Cyclistic theo loại thành viên và xác định xu hướng dựa trên chiến lược tiếp thị của Cyclistic.
## 1.2 Key Stakehoders:
• Cyclistic: Chương trình chia sẻ xe đạp có hơn 5.800 xe đạp và 600 trạm nối. Xe đạp tạo nên sự khác biệt bằng cách cung cấp xe đạp ngả lưng, xe ba bánh tay và xe đạp chở hàng, giúp dịch vụ chia sẻ xe đạp trở nên phù hợp hơn với người khuyết tật và những người lái xe không thể sử dụng xe đạp hai bánh tiêu chuẩn. Phần lớn người đi xe lựa chọn xe đạp truyền thống; khoảng 8% người lái sử dụng các tùy chọn hỗ trợ. Người dùng xe đạp có xu hướng đạp xe để giải trí nhiều hơn, nhưng khoảng 30% sử dụng chúng để đi làm mỗi ngày.

• Lily Moreno: Giám đốc tiếp thị và người quản lý của bạn. Moreno chịu trách nhiệm phát triển các chiến dịch và sáng kiến ​​nhằm thúc đẩy chương trình chia sẻ xe đạp. Chúng có thể bao gồm email, phương tiện truyền thông xã hội và các kênh khác.

• Cyclistic marketing analytics team: Một nhóm các nhà phân tích dữ liệu chịu trách nhiệm thu thập, phân tích và báo cáo dữ liệu giúp hướng dẫn chiến lược tiếp thị theo chu kỳ. Bạn đã gia nhập nhóm này sáu tháng trước và đang bận rộn tìm hiểu về sứ mệnh và mục tiêu kinh doanh của Cyclistic - cũng như cách bạn, với tư cách là nhà phân tích dữ liệu cấp dưới, có thể giúp Cyclistic đạt được chúng.

• Cyclistic executive team: Đội ngũ điều hành nổi tiếng là chú trọng đến chi tiết sẽ quyết định xem có nên phê duyệt chương trình tiếp thị được đề xuất hay không.

## 1.3 A clear statement of the business task :
Mục đích chính của vai trò công việc này là phân tích dữ liệu Chu kỳ và hiểu biết sâu sắc về các xu hướng tiếp thị dựa trên dữ liệu định hướng và thúc đẩy người dùng, đồng thời chia sẻ chúng với các bên liên quan chính. Hình ảnh trực quan cụ thể và rõ ràng phải được thực hiện và sẵn sàng chia sẻ để tất cả các bên liên quan có thể hiểu được dữ liệu.

## Pharse 2: PREPARE
Guiding Questions

Q1: Where is your data located?

Dữ liệu có sẵn tại địa chỉ tôi đã cung cấp liên kết ở trên. Dữ liệu tôi tải xuống từ địa chỉ này đã được xử lý theo cách bao gồm 12 tháng, tháng 1 năm 2022 và tháng 12 năm 2022.
https://www.kaggle.com/datasets/phuongthao28/cyclistic-bike-share-capstone-project?select=cyclistic_data.csv





