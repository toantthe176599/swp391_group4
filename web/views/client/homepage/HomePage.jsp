<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Tooplate">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <title>Book Show Tickets</title>

        <script>
            window.addEventListener('load', function () {
                var eventItems = document.querySelectorAll('.event-item');
                var maxHeight = 0;

                eventItems.forEach(function (item) {
                    var itemHeight = item.offsetHeight;
                    if (itemHeight > maxHeight) {
                        maxHeight = itemHeight;
                    }
                });

                eventItems.forEach(function (item) {
                    item.style.height = maxHeight + 'px';
                });
            });
        </script>

        <style>

            /* Định dạng cho phân trang */
            .pagination-container {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }

            .pagination {
                display: flex;
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination a {
                color: #333;
                padding: 10px 15px;
                text-decoration: none;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .pagination li.active a {
                background-color: #333;
                color: #fff;
            }

            .pagination a:hover {
                background-color: #f1f1f1;
            }


            .subscribe {
                background-color: #f9f9f9;
                padding: 40px 0;
                margin-top: 40px;
            }

            .subscribe h4 {
                margin-bottom: 20px;
            }

            .subscribe form {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .subscribe input[type="text"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px 0 0 4px;
                outline: none;
                margin-right: -1px;
                width: 100%;
                box-sizing: border-box;
            }

            .subscribe button {
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-left: none;
                background-color: #333;
                color: #fff;
                border-radius: 0 4px 4px 0;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .subscribe button:hover {
                background-color: #555;
            }

            .subscribe .row {
                width: 100%;
                display: flex;
                justify-content: center;
            }
        </style>
        <style>

            .event-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .event-item {
                flex: 1 1 30%;
                margin-bottom: 30px;
                padding: 15px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                min-height: 400px; /* Chiều cao tối thiểu của mỗi sản phẩm */
            }

            .event-item:hover {
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                transform: translateY(-5px);
            }

            .event-item .thumb {
                overflow: hidden;
                height: 200px; /* Chiều cao ảnh */
                border-radius: 5px 5px 0 0;
            }

            .event-item .thumb img {
                width: 100%;
                height: auto;
                border-radius: 5px 5px 0 0;
            }

            .event-item .down-content {
                padding: 15px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: calc(100% - 215px); /* Đặt chiều cao cho nội dung còn lại */
            }

            .event-item .down-content h4 {
                font-size: 18px;
                margin-bottom: 10px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .event-item .down-content ul {
                padding: 0;
                margin: 0;
                list-style: none;
            }

            .event-item .down-content ul li {
                margin-bottom: 8px;
                font-size: 14px;
            }

            .event-item .main-dark-button {
                text-align: center;
            }

            .event-item .main-dark-button .purchase-button {

            .event-item {
                display: flex;
                flex-direction: column;
                height: 100%;
                border: 1px solid #ddd;
                border-radius: 8px; /* Ví dụ: sử dụng giá trị radius tùy chỉnh */
                overflow: hidden; /* Đảm bảo nội dung không bị tràn ra ngoài */

            }
            .thumb {
                width: 100%;
                height: 200px;
                overflow: hidden;
                border-bottom: 1px solid #ddd; /* Thêm đường viền phân cách giữa hình ảnh và nội dung */
            }

            .down-content {
                padding: 15px;
            }

            .ticket-item {
                display: flex;
                flex-direction: column;
                height: 100%;
            }

            .event-item:not(:last-child) {
                margin-bottom: 20px;
            }
            .event-item {
                margin-bottom: 30px; /* Khoảng cách giữa các sự kiện */
            }

            .event-list {
                padding-bottom: 30px; /* Khoảng cách phía dưới danh sách sự kiện */
            }

            .col-lg-4 {
                margin-bottom: 20px; /* Khoảng cách giữa các cột chứa sự kiện */
            }
        </style>

        <style>
            .thumb img {
                width: 100%;
                height: auto;
                object-fit: cover;
            }
        </style>
        <style>
            .purchase-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #333;
                color: #fff;

                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            .event-item .main-dark-button .purchase-button:hover {
                background-color: #555;
            }
        </style>

        <style>
            .thumb img {
                width: 100%;
                height: auto;
                object-fit: cover;
            }
        </style>
        <style>
    .filter-box {
        background-color: #f8f9fa; /* Màu nền đen */
        border: 1px solid #292b2c; /* Viền */
        border-radius: 8px; /* Độ cong viền */
        padding: 20px; /* Padding */
    }

    .filter-heading {
        margin-bottom: 20px;
        color: #6c757d; /* Màu chữ xám nhạt */
        font-size: 24px; /* Cỡ chữ */
        font-family: 'Poppins', sans-serif; /* Font-family */
    }

    .filter-select {
        width: 100%; /* Độ rộng 100% cho select box */
        padding: 10px; /* Padding */
        font-size: 16px; /* Cỡ chữ */
        border-radius: 5px; /* Độ cong viền */
        border: none; /* Loại bỏ viền */
        background-color: #f8f9fa; /* Màu nền trắng */
        color: #000; /* Màu chữ */
        font-family: 'Poppins', sans-serif; /* Font-family */
    }

    .filter-btn {
        padding: 10px 20px; /* Padding cho button */
        font-size: 16px; /* Cỡ chữ */
        border-radius: 5px; /* Độ cong viền */
        background-color: #28a745; /* Màu xanh lá cây */
        border: none; /* Loại bỏ viền */
        color: #fff; /* Màu chữ */
        cursor: pointer; /* Con trỏ chuột */
        font-family: 'Poppins', sans-serif; /* Font-family */
    }

    .filter-btn:hover {
        background-color: #218838; /* Màu nền hover */
    }

    .filter-btn:focus {
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5); /* Hiệu ứng focus */
    }
</style>



        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/font-awesome.css">

        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/owl-carousel.css">

        <!-- Tooplate ArtXibition CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/tooplate-artxibition.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/your-stylesheet.css">
        <!--
        
        Tooplate 2125 ArtXibition
        
        https://www.tooplate.com/view/2125-artxibition
        
        -->
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- ***** Pre HEader ***** -->
        <div class="header-wrapper">
            <jsp:include page="../component/Navbar.jsp" />
        </div>
        <div class="slideshow-wrapper">
            <jsp:include page="../component/slideshow.jsp"/>
        </div>



        <!-- ***** Header Area End ***** -->

        <!-- ***** About Us Page ***** -->


        <div class="tickets-page">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="filter-box text-center bg-dark p-4">
                            <div class="filter-heading mb-4">
                                <h4 class="text-white">Lọc sự kiện theo tháng, thể loại:</h4>
                            </div>
                            <form action="homepage" method="GET">
                                <div class="row">
                                    <div class="col-lg-4 mb-3">
                                        <select class="filter-select form-select" name="month">
                                            <option value="">Tháng</option>
                                            <c:forEach var="m" begin="1" end="12">
                                                <option value="${m}">${m}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-lg-4 mb-3">
                                        <select class="filter-select form-select" name="category_id">
                                            <option value="">Thể loại</option>
                                            <c:forEach items="${categories}" var="category">
                                                <option value="${category.category_id}">${category.category_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-lg-4 mb-3">
                                        <button type="submit" class="filter-btn btn btn-success w-100">Lọc</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="heading">
                        <h2>Sự kiện</h2>
                    </div>
                </div>
                <!--san pham-->

                <!-- Hiển thị danh sách sự kiện -->
                <div class="row event-list">
                    <c:forEach var="item" items="${events}">
                        <div class="col-lg-4 col-md-6">
                            <div class="event-item">
                                <div class="ticket-item">
                                    <div class="thumb">
                                        <img src="${pageContext.request.contextPath}${item.image_event}" alt="${item.title}">
                                        <div class="price">
                                            <span>1 vé từ <em>$25</em></span>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <span>Còn 150 vé cho buổi biểu diễn này</span>
                                        <h4>${item.name}</h4>
                                        <ul>
                                            <!-- Chuyển đổi chuỗi thành đối tượng Date -->
                                            <fmt:parseDate var="parsedDate" value="${item.start_date}" pattern="yyyy-MM-dd" />

                                            <!-- Định dạng đối tượng Date thành chuỗi mới -->
                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" var="formattedDate" />

                                            <fmt:parseDate var="parsedTime" value="${item.start_time}" pattern="HH:mm:ss" />

                                            <!-- Định dạng đối tượng Date thành chuỗi mới -->
                                            <fmt:formatDate value="${parsedTime}" pattern="HH:mm" var="formattedTime" />

                                            <li><i class="fa fa-clock-o"></i> ${formattedDate} lúc ${formattedTime}</li>
                                            <li><i class="fa fa-map-marker"></i> ${item.location}</li>
                                            <li><i class="fa fa-ticket"></i> ${item.title}</li>
                                        </ul>
                                        <div class="main-dark-button">
                                            <a href="${pageContext.request.contextPath}/eventDetailController?eventId=${item.event_id}" class="purchase-button">Mua vé</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Hiển thị phân trang -->
                <div class="col-lg-12">
                    <div class="pagination">
                        <ul>
                            <c:if test="${currentPage > 1}">
                                <li><a href="?page=${currentPage - 1}&month=${selectedMonth}&category_id=${selectedCategoryId}">Prev</a></li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                        <li class="active"><a href="?page=${i}&month=${selectedMonth}&category_id=${selectedCategoryId}">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li><a href="?page=${i}&month=${selectedMonth}&category_id=${selectedCategoryId}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${currentPage < totalPages}">
                                <li><a href="?page=${currentPage + 1}&month=${selectedMonth}&category_id=${selectedCategoryId}">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </div>


                <!-- *** Footer *** --> <jsp:include page="../component/Footer.jsp" />

                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/jquery-2.1.0.min.js"></script>

                <!-- Bootstrap JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/bootstrap.min.js"></script>

                <!-- ScrollReveal JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/scrollreveal.min.js"></script>

                <!-- Waypoints JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/waypoints.min.js"></script>

                <!-- CounterUp JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/jquery.counterup.min.js"></script>

                <!-- ImgFix JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/imgfix.min.js"></script>

                <!-- MixItUp JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/mixitup.js"></script>

                <!-- Accordions JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/accordions.js"></script>

                <!-- Owl Carousel JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/owl-carousel.js"></script>

                <!-- Custom JS -->
                <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/custom.js"></script>


                </body>
                </html>
