

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/profileCss.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <title>Thông tin tài khoản</title>
    </head>
    <body>
        <!--alert messsage-->

        <!-- get all role-->
        <c:set var="role" value="${requestScope.role}"/>  
        <!-- end-->

        <c:set var="permission" value="${applicationScope.permission}"  />


        <c:if test="${sessionScope.error != null}">
            <div class="message info">
                <div class="alert alert-danger" show-alert data-time="3000"> ${sessionScope.error}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("error")}
        </c:if>


        <c:if test="${sessionScope.success != null}">
            <div class="message info">
                <div class="alert alert-success" show-alert data-time="3000"> ${sessionScope.success}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("success")}
        </c:if>

        <!--End alert message-->




        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <c:import url="/views/admin/component/NavBar.jsp" />
            <!-- Main content -->

            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <!-- Header -->
                <header class="bg-surface-primary border-bottom pt-6">
                    <div class="container-fluid">
                        <div class="mb-npx">
                            <div class="row align-items-center">
                                <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                    <!-- Title -->
                                    <h1 class="h2 mb-0 ls-tight">Thông tin tài khoản </h1>
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



                            <div class="table-responsive">



                                <div class="wrapper" style="height: 700px; margin-bottom: 100px">
                                    <div class="user-card">
                                        <c:if test="${infor.accountImg == null}">
                                            <div class="user-card-img">
                                                <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjxivAs4UknzmDfLBXGMxQkayiZDhR2ftB4jcIV7LEnIEStiUyMygioZnbLXCAND-I_xWQpVp0jv-dv9NVNbuKn4sNpXYtLIJk2-IOdWQNpC2Ldapnljifu0pnQqAWU848Ja4lT9ugQex-nwECEh3a96GXwiRXlnGEE6FFF_tKm66IGe3fzmLaVIoNL/s1600/img_avatar.png" alt="">
                                            </div>
                                        </c:if>

                                        <c:if test="${infor.accountImg != null}">
                                            <div class="user-card-img">
                                                <img src="${infor.accountImg}" alt="">
                                            </div>
                                        </c:if>

                                        <div class="user-card-info">

                                            <c:if test="${infor == null}">
                                                <h5>Thông tin của bạn chưa được cập nhật vui lòng cập nhật thông tin</h5>    
                                            </c:if>

                                            <c:if test="${infor != null}">
                                                <!--- convert date-->
                                                <c:set var="originalDateString" value="${infor.dateOfBirth}" />


                                                <fmt:parseDate value="${originalDateString}" pattern="yyyy-MM-dd" var="dateObject" />


                                                <fmt:formatDate value="${dateObject}" pattern="dd/MM/yyyy" var="formattedDate" />
                                                <!----->
                                                <p><span>Họ tên: </span> ${infor.fullName} </p>
                                                <p><span>Ngày sinh</span> ${formattedDate}</p>
                                                <p><span>Địa chỉ:</span> ${infor.address}</p>
                                                <p><span>Số điện thoại:</span> ${infor.phone}</p>
                                            </c:if>
                                            <button type="button" updateBtn class="btn btn-success">Cập nhật</button>
                                        </div>
                                    </div>
                                </div>







                            </div>

                        </div>
                    </div>
                </main>
            </div>



        </div>




    </body>
    <script src="../../../../public/admin/js/dashboard.js"></script>
    <script src="../../../../public/admin/js/alert.js"></script>
    <script src="../../../../public/admin/js/profileJs.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
