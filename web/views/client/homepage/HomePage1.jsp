<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Tooplate">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <title>Book Show Tickets</title>
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
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                min-width: 120px;
                min-height: 40px;
                line-height: 1;
                margin-top: 10px; /* Khoảng cách giữa nút mua vé và nội dung khác */
            }

            .purchase-button:hover {
                background-color: #555;
            }
        </style>
        <style>
            .purchase-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #333;
                color: #fff;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                min-width: 120px;
                min-height: 40px;
                line-height: 1;
            }
            .purchase-button:hover {
                background-color: #555;
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
        <div class="pre-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-6">
                        <span>Hey! The Show Is Starting In 5 Days.</span>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="text-button">
                            <a href="/logout">Log out <i class="fa fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="header-content">
                            <div class="logo-search">
                                <!-- Logo -->
                                <a href="index.html" class="logo">Book<em>Show</em></a>
                                <!-- Search Box -->
                                <div class="search-box">
                                    <form id="searchForm" action="${pageContext.request.contextPath}/search" method="get">
                                        <input type="text" name="searchTerm" placeholder="Search events..." required>
                                        <button type="submit">Search</button>
                                    </form>
                                </div>
                            </div>
                            <!-- Navigation -->
                            <nav class="main-nav">
                                <ul class="nav">
                                    <li><a href="/homepage" class="active">Home</a></li>
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="rent-venue.html">Rent Venue</a></li>
                                    <li><a href="shows-events.html">Shows & Events</a></li> 

                                </ul>
                                <a class='menu-trigger'>
                                    <span>Menu</span>
                                </a>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>




        <!-- ***** Header Area End ***** -->

        <!-- ***** About Us Page ***** -->
        <div class="page-heading-shows-events">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Chào mừng đến website Book Show</h2>

                    </div>
                </div>
            </div>
        </div>

        <div class="tickets-page">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="search-box">
                            <form id="subscribe" action="" method="get">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <div class="search-heading">
                                            <h4>Sort The Upcoming Shows & Events By:</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <form action="homepage" method="GET">
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <select name="month">
                                                        <option value="">Month</option>
                                                        <c:forEach var="m" begin="1" end="12">
                                                            <option value="${m}">${m}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-lg-3">
                                                    <select name="category_id">
                                                        <option value=""> Category </option>
                                                        <c:forEach items="${categories}" var="category">
                                                            <option value="${category.category_id}">${category.category_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                 <div class="col-lg-3">
                                                <select value="month">
                                                    <option value="month">Price</option>
                                                    <option name="min" id="min">$0 - $50</option>
                                                    <option name="standard" id="standard">$50 - $100</option>
                                                    <option name="hight" id="hight">$100 - $200</option>
                                                </select>
                                            </div>
                                                <div class="col-lg-3">
                                                    <fieldset>
                                                        <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                        </div>
                        </form>
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="heading">
                        <h2>Events</h2>
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
                                            <li><i class="fa fa-clock-o"></i> ${item.start_date} ${item.start_time}</li>
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


                <!-- *** Subscribe *** -->
                <div class="subscribe">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4">
                                <h4>Subscribe Our Newsletter:</h4>
                            </div>
                            <div class="col-lg-8">
                                <form id="subscribe" action="" method="get">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <fieldset>
                                                <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-3">
                                            <fieldset>
                                                <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- *** Footer *** -->
                <footer>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="address">
                                    <h4>Sunny Hill Festival Address</h4>
                                    <span>5 College St NW, <br>Norcross, GA 30071<br>United States</span>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="links">
                                    <h4>Useful Links</h4>
                                    <ul>
                                        <li><a href="#">Info</a></li>
                                        <li><a href="#">Venues</a></li>
                                        <li><a href="#">Guides</a></li>
                                        <li><a href="#">Videos</a></li>
                                        <li><a href="#">Outreach</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="hours">
                                    <h4>Open Hours</h4>
                                    <ul>
                                        <li>Mon to Fri: 10:00 AM to 8:00 PM</li>
                                        <li>Sat - Sun: 11:00 AM to 4:00 PM</li>
                                        <li>Holidays: Closed</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="under-footer">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <p>São Conrado, Rio de Janeiro</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <p class="copyright">Copyright 2021 ArtXibition Company 

                                                <br>Design: <a rel="nofollow" href="https://www.tooplate.com" target="_parent">Tooplate</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="sub-footer">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="logo"><span>Art<em>Xibition</em></span></div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="menu">
                                                <ul>
                                                    <li><a href="index.html" class="active">Home</a></li>
                                                    <li><a href="about.html">About Us</a></li>
                                                    <li><a href="rent-venue.html">Rent Venue</a></li>
                                                    <li><a href="shows-events.html">Shows & Events</a></li> 
                                                    <li><a href="tickets.html">Tickets</a></li> 
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="social-links">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>

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
