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
    <title>Booking Failure</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/tooplate-artxibition.css">
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
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header-content">
                        <div class="logo-search">
                            <a href="index.html" class="logo">Book<em>Show</em></a>
                        </div>
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

    <div class="page-heading-shows-events">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Booking Failed</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="message-container">
        <h2>Unfortunately, your booking could not be completed.</h2>
        <p>There was an issue with your booking. Please try again or contact support.</p>
        <a href="/homepage" class="btn btn-primary">Back to Home</a>
        <a href="/shows-events" class="btn btn-secondary">Try Again</a>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sub-footer">
                        <p>&copy; 2024 Book Show Tickets. All Rights Reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/views/client/homepage/assets/js/bootstrap.min.js"></script>

</body>

</html>
