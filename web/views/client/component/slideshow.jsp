<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Slideshow with Rounded Images</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }
            .owl-carousel {
                width: 80%; /* Chiều rộng của carousel */
                margin: 0 auto; /* Căn giữa carousel */
                max-width: 1200px; /* Giới hạn chiều rộng tối đa */
            }
            .owl-carousel .owl-item {
                padding: 0 10px; /* Khoảng cách giữa các ảnh */
            }
            .owl-carousel .owl-item img {
                display: block;
                width: 100%; /* Ảnh lấp đầy chiều rộng của item */
                height: auto; /* Đảm bảo tỉ lệ tự nhiên của ảnh */
                border-radius: 10px; /* Bo góc các ảnh */
            }
            .custom-nav {
                text-align: center;
                margin-top: 20px;
            }
            .custom-nav button {
                background-color: transparent;
                border: none;
                outline: none;
                cursor: pointer;
                margin: 0 5px;
                font-size: 16px;
                color: #999;
            }
            .custom-nav button.active {
                color: #333; /* Màu sắc hoạt động */
            }
        </style>

    </head>
    <body>
        <div class="owl-carousel owl-theme">
            <!-- Slides will be dynamically added via JavaScript -->
        </div>

        <!-- Custom Navigation -->
        <div class="custom-nav"></div> <!-- Dùng để chứa các chấm tròn -->

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <!-- Custom Script -->
        <script>
            $(document).ready(function () {
                var images = [
                    'https://vietnamteachingjobs.com/wp-content/uploads/2023/03/talkshow-la-gi.jpg',
                    'https://sukienvietsky.com/wp-content/uploads/2024/03/lE1BB8520hE1BB99i20C3A2m20nhE1BAA1c20sE1BB9120120thE1BABF20giE1BB9Bi202.jpg',
                    'https://media.baoquangninh.vn/upload/image/202307/medium/2108499_thong_quang_ha_3_10120126.jpg',
                    'https://gcs.tripi.vn/public-tripi/tripi-feed/img/472188CPO/chuong-trinh-sunset-show-phu-quoc-buoi-bieu-dien-thu-hut-tai-hon-dao-ngoc_6'
                ];

                var owl = $('.owl-carousel');
                images.forEach(function (imgUrl) {
                    var imgElement = '<div class="item"><img src="' + imgUrl + '" alt="Slide"></div>';
                    owl.append(imgElement);
                });

                owl.owlCarousel({
                    items: 2, /* Hiển thị 2 ảnh mỗi lần */
                    loop: true,
                    autoplay: true,
                    autoplayTimeout: 3000, /* Tự động chuyển sau 3 giây */
                    autoplayHoverPause: true,
                    nav: false, /* Ẩn nút điều hướng mặc định */
                    dots: true, /* Hiển thị các chấm tròn */
                    dotsEach: true, /* Hiển thị mỗi slide có 1 chấm tròn tương ứng */
                    dotClass: 'owl-dot', /* Lớp CSS của các chấm tròn */
                    dotsContainer: '.custom-nav' /* Sử dụng custom navigation */
                });

            });
        </script>
    </body>
</html>
