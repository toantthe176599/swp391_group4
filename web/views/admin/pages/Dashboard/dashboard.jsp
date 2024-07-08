<%-- 
    Document   : dashboard
    Created on : Jun 26, 2024, 10:21:34 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sự kiện</title>
        <link rel="stylesheet" href="../../../../public/admin/css/dashBoardCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <body>









        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <c:import url="/views/admin/component/NavBar.jsp" />
            <!-- Main content -->
            <c:if test="${fn:contains(permission, 'view_ticket')}">
                <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                    <!-- Header -->
                    <header class="bg-surface-primary border-bottom pt-6">
                        <div class="container-fluid">
                            <div class="mb-npx">
                                <div class="row align-items-center">
                                    <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                        <!-- Title -->
                                        <h1 class="h2 mb-0 ls-tight">Quản lý sự kiện</h1>
                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main -->





                    <main class="py-6 bg-surface-secondary">
                        <div class="container-fluid">
                            <!-- Card stats -->

                            <div class="card shadow border-0 mb-7">
                                <div class="card-header">

                                </div>
                                <div class="table-responsive">
                                    <section class="main-content"  >
                                        <div class="app">



                                            <section class="app-content">

                                                <header>
                                                    <div class="searchbox" style="border: solid 0.1px black; ">
                                                        <div class="icon"> <i class="fa fa-search" aria-hidden="true"></i> </div>
                                                        <input type="text" name="search" placeholder="Tìm sự kiện" class="search-text"> </input>
                                                    </div>

                                                    <div class="app-list-options">
                                                        <div > <b>Sắp xếp theo</b>
                                                            <select id="id">
                                                                <option value="first" > Tiến độ bán vé (tăng đần) </option>
                                                                <option value="first" > Tiến độ bán vé (giảm đần) </option>
                                                                <option value="second">Ngày diễn ra (tăng dần)</option>
                                                                <option value="third">Ngày diễn ra (giảm dần)</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </header>

                                                <ul class="projects">

                                                    <c:forEach var="item" items="${report}">
                                                        <li class="project-item">
                                                            <div> <img src="${item.img}" alt="Image 001" style="width: auto; height: auto; border-radius: 5%" />
                                                            </div>
                                                            <div class="title-row">
                                                                <h5> <b>${item.nameEvent} </b></h5>
                                                                <!--                                                            <div class="links"> <i class="fa fa-external-link icon" aria-hidden="true"></i> <a href="#">  </a> </div>
                                                                                                                        </div>-->

                                                                <div class="progress-row">

                                                                    <h6>Số vé đã bán: <b>${item.ticketSold}</b> </h6>
                                                                    <h6>Số vé còn lại: <b>${item.ticketLeft}</b></h6>
                                                                    <h6>Tổng số lượng vé: <b>${item.totalTicket}</b></h6>
                                                                    <h6>Tiến độ bán vé</h6>

                                                                    <p class="value-label" style="width:${item.percentSold}%" data-value="${item.percentSold}"></p>
                                                                    <progress max="${item.totalTicket}" value="${item.ticketSold}" data-value="${item.ticketSold}"> ${item.percentSold}% </progress>
                                                                </div>
                                                                <div class="footer-row">

                                                                    <c:if test="${item.status != 'cancel'}">
                                                                        <c:if test="${item.dayLeft < 0}">
                                                                            <div class="alert-dark"> <i class="fa fa-clock-o icon" aria-hidden="true"></i> Đã kết thúc ${item.dayLeft * -1} ngày trước </div>    
                                                                        </c:if>
                                                                        <c:if test="${item.dayLeft == 0}">
                                                                            <div class="alert-success"> <i class="fa fa-clock-o icon" aria-hidden="true"></i> Diễn ra trong ngày hôm nay  </div>    
                                                                        </c:if>
                                                                        <c:if test="${item.dayLeft > 0}">
                                                                            <div class="alert-success"> <i class="fa fa-clock-o icon" aria-hidden="true"></i> Diễn ra sau ${item.dayLeft} ngày </div>    
                                                                        </c:if>
                                                                    </c:if>
                                                                    <c:if test="${item.status == 'cancel'}">
                                                                        <div class="alert-danger">  Hủy </div>    
                                                                    </c:if> 


                                                                    <div class="users">
                                                                        <button type="button" class="btn btn-default btn-sm" idEvent="${item.idEvent}" detailBtn style="border: solid 1px black">
                                                                            <i class="bi bi-info-circle"></i> Chi tiết
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                        </li>

                                                    </c:forEach>



                                                </ul>
                                            </section>
                                        </div>
                                    </section>

                                </div>



                            </div>
                        </div>
                    </main>
                </div>
            </c:if>



        </div>




    </body>


    <script src="../../../../public/admin/js/reportDashboardJs.js"></script>
</html>
