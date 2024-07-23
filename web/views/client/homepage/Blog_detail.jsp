<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Tooplate">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <title>Book Show Tickets</title>

        <style>
            .blog-detail {
                display: flex;
                flex-direction: column; /* Hiển thị các phần tử con theo chiều dọc */
                align-items: center; /* Căn giữa các phần tử ngang */
                margin-top: 50px;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

                margin: 50px auto;
                font-family: 'Poppins', sans-serif;
            }

            .blog-detail .title-and-image {
                width: 100%; /* Đảm bảo phần tiêu đề và ảnh chiếm toàn bộ chiều rộng */
                text-align: center; /* Căn giữa tiêu đề và ảnh */
            }

            .blog-detail .title-and-image h2 {
                font-size: 24px;
                color: #333;
                margin-bottom: 10px;
            }

            .blog-detail .title-and-image .blog-image {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .blog-detail .content {
                width: 100%; /* Đảm bảo phần nội dung chiếm toàn bộ chiều rộng */
                text-align: left; /* Căn lề trái cho phần nội dung */
                line-height: 1.6;
                font-size: 16px;
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

        <!-- ***** Preloader End ***** -->

        <!-- ***** Pre HEader ***** -->

        <!-- ***** Header Area Start ***** -->
        <jsp:include page="../component/Header.jsp" />

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
        <div class="blog-detail">
            <c:if test="${not empty blog}">
                <!-- Nội dung blog -->
                <div class="title-and-image">
                    <h2>${blog.title}</h2>
                    <img class="blog-image" src="${blog.image}" alt="Blog Image">
                </div>
                <div class="content">
                    <p>${blog.content}</p>
                    Ngày đăng: 
                    <fmt:formatDate value="${blog.publishDate}" pattern="dd/MM/yyyy" />
                    </p>
                    <p>Author: ${blog.author}</p>
                </div>
            </c:if>
            <c:if test="${empty blog}">
                <!-- Hiển thị thông báo lỗi -->
                <h2>Error</h2>
                <p>${errorMessage}</p>
            </c:if>
        </div>
        <!-- *** Footer *** -->
        <jsp:include page="../component/Footer.jsp" />
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
