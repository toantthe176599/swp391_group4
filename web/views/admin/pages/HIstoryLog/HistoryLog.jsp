<%-- 
    Document   : HistoryLog
    Created on : Jun 24, 2024, 7:52:51 AM
    Author     : LENOVO
--%>

<%-- 
    Document   : DashBoard
    Created on : May 30, 2024, 10:58:44 AM
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
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Lịch sử</title>

    </head>
    <body>







        <c:set var="account" scope="page" value="${requestScope.account}"/>  






        <c:set var="permission" value="${applicationScope.permission}"  />




        <!-- Banner -->

        <!--          div(class="alert alert-success" show-alert data-time=time  <span close-alert>x</span>-->

        <!-- Dashboard -->

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
                                        <h1 class="h2 mb-0 ls-tight">Danh sách tài khoản </h1>
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
                                    <h5 class="mb-0">Lịch sử chỉnh sửa</h5>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover table-nowrap">
                                        <thead class="thead-light">
                                            <tr>

                                                <th scope="col">Tài khoản chỉnh sửa</th>
                                                <th scope="col">Ngày chỉnh sửa</th>
                                                <th scope="col">Hành động</th>

                                            </tr>
                                        </thead>
                                        <tbody>


                                            <c:forEach var="item" items="${history}">  
                                                <tr>
                                                    <td>
                                                        <b>${item.email}</b>
                                                    </td>
                                                    <%-- Chuyển đổi chuỗi ngày thành đối tượng Date --%>
                                                    <fmt:parseDate value="${item.time}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss.SSS" />

                                                    <%-- Định dạng đối tượng Date thành chuỗi theo định dạng mong muốn --%>
                                                    <fmt:formatDate value="${parsedDate}" pattern="HH:mm   dd/MM/yyyy" var="formattedDate" />

                                                    <td>
                                                        <b>${formattedDate}</b>
                                                    </td>

                                                    <c:if test="${item.action == 'create'}">
                                                        <td>Tạo sự kiện</td>
                                                    </c:if>

                                                    <c:if test="${item.action == 'update'}">
                                                        <td>Chỉnh sửa thông tin sự kiện</td>
                                                    </c:if>
                                                    <c:if test="${item.action == 'cancel'}">
                                                        <td>Hủy sự kiện</td>
                                                    </c:if>

                                                </tr>

                                            </c:forEach>  



                                            <c:if test="${fn:length(history) == 0 }">    
                                                <tr>
                                                    <td> <b>Không có lịch sử thay đổi</b></td>
                                                </tr>
                                            </c:if>





                                        </tbody>

                                    </table>

                                </div>




                            </div>
                        </div>
                    </main>
                </div>
            </c:if>

            <c:if test="${!fn:contains(permission, 'view_ticket')}">
                <h1>Bạn không có quyền tại đây</h1>
            </c:if>


        </div>

    </body>




    <script src="../../../../public/admin/js/dashboard.js"></script>
    <script src="../../../../public/admin/js/changeStatus.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>

