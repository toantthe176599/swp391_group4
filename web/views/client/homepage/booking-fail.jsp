<%-- 
    Document   : booking-success
    Created on : Jul 3, 2024, 4:01:22 AM
    Author     : HP
--%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đặt vé không thành công</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/font-awesome.css">

        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/owl-carousel.css">

        <!-- Tooplate ArtXibition CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/tooplate-artxibition.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/your-stylesheet.css">


        <style>
            .message-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 60vh;
                text-align: center;
            }

            .message-container h2 {
                margin-bottom: 20px;
            }

            .message-container .btn {
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <!-- Header -->
        <header class="header-area header-sticky">
            <jsp:include page="../component/Navbar.jsp" />
        </header>

        <div class="page-heading-shows-events">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Đặt vé không thành công</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="message-container">
            <h2>Xin lỗi về sự bất tiện này</h2>
            <p>Đã có vấn để xảy ra với việc đặt vé vui lòng thử lại sau</p>
            <a href="/homepage" class="btn btn-primary">Quay lại trang chủ</a>

        </div>

        <footer>
            <jsp:include page="../component/Footer.jsp" />
        </footer>

        <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/bootstrap.min.js"></script>

    </body>

</html>
