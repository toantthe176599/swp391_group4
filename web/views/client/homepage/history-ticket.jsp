<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <jsp:useBean class="helper.TicketUltils" id="getTime" />
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Tooplate">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <style>
            .anh{
                margin-top: 50px;
                margin-bottom: 50px;
                display: flex;
                color: #28a745;
                letter-spacing: 2px;
                justify-content: center;
                font-family: "Courier New", Courier, monospace;
                font-weight: 700;
            }
            .blog-posts {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
                margin-top: 100px;
                margin-bottom: 100px;
            }

            .blog-post {
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 8px;
                background-color: #f9f9f9;
                display: flex;
                flex-direction: column;
                height: 100%;
            }

            .blog-post-content {
                flex: 1;
                overflow: hidden;
            }

            .blog-post h3 {
                margin-top: 0;
                font-size: 1.5rem;
                color: #6c757d;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                font-family: 'Arial', sans-serif;
                font-weight: 600;
            }

            .blog-post p {
                font-size: 1rem;
                line-height: 1.5;
                margin-bottom: 10px;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                white-space: normal;
            }

            .blog-post img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 8px;
            }
            .view-button {
                display: block;
                width: 100%;
                text-align: center;
                padding: 8px 12px;
                margin-top: 10px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 4px;
                text-decoration: none;
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
            }

            .view-button:hover {
                background-color: #218838;

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


    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <!-- ***** Header Area Start ***** -->
     <div class="header-wrapper">
            <jsp:include page="../component/Navbar.jsp" />
        </div>
        <!-- ***** Header Area End ***** -->

        <!-- ***** About Us Page ***** -->
       
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="anh">Lịch sử mua vé</h2>
                    <div class="blog-posts">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    
                                    <th>Quantity</th>
                                    <th>Event</th>
                                    <th>Image</th>
                                    <th>Area</th>
                                    <th>Total Amount</th>
                                    <th>Status ticket</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="book" items="${booking}">
                                    <tr>
                                        
                                        <td>${book.quantity}</td>
                                        <td>${book.ticket.event.name}</td>
                                        <td>
                                            <img src="${book.ticket.event.img_event}" width="100px" height="70px" alt="alt"/>
                                        </td>
                                        <td>${book.ticket.area.nameArea}</td>
                                        <td>
                                            <fmt:formatNumber value="${book.totalAmount}" type="currency" currencySymbol="₫" />
                                        </td>
                                        <td>
                                            <c:if test="${getTime.isExpired(book.ticket.event.startTime, book.ticket.event.startDate) == true}">
                                                <span class="badge badge-danger">
                                                    Hết Hạn
                                                </span>
                                            </c:if>
                                            <c:if test="${getTime.isExpired(book.ticket.event.startTime, book.ticket.event.startDate) == false}">
                                                <span class="badge badge-success">
                                                    Chưa hết hạn
                                                </span>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- *** Footer *** -->
        <jsp:include page="../component/Footer.jsp" />
        <!-- jQuery -->
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
