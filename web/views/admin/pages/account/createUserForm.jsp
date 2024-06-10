<%-- 
    Document   : createUserForm
    Created on : May 31, 2024, 10:31:00 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/createUserFormCss.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <title>Tạo người dùng mới</title>
    </head>
    <body>

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
                                    <h1 class="h2 mb-0 ls-tight">Danh sách tài khoản </h1>
                                </div>
                                <!-- Actions -->
                                <div class="col-sm-6 col-12 text-sm-end">
                                    <div class="mx-n1">

                                        <a href="/admin/account/create/form" class="btn d-inline-flex btn-sm btn-primary mx-1">
                                            <span class=" pe-2">
                                                <i class="bi bi-plus"></i>
                                            </span>
                                            <span>Tạo tài khoản</span>
                                        </a>
                                    </div>
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
                                <h5 class="mb-0">Nhân viên</h5>
                            </div>


                            <h1 class="title"><span>Nhập thông tin tài khoản</span></h1>
                            <form action="/admin/createAccount" method="post" autocomplete="off" style="width: 1400px; margin-left: 50px">

                                <label for="userName">Tên tài khoản</label>
                                <div class="row">
                                    <input type="text" placeholder="Tên tài khoản" name="userName" id="userName">
                                </div>
                                <label for="password">Mật khẩu</label>
                                <div class="row">
                                    <input type="password" placeholder="Mật khẩu" name="password" >
                                </div>
                                <label for="rePassword">Nhập lại mật khẩu</label>
                                <div class="row">
                                    <input type="password" placeholder="Nhập lại mật khẩu" name="rePassword" >
                                </div>

                                <!--                    <label for="dateofbirth">Ngày sinh</label>
                                                    <input type="date" value="dateOfBirth" id="dateofbirth">-->

                                <label for="email">Email</label>
                                <div class="row">
                                    <input type="email" value="" placeholder="Email" name="email" id="email"> 
                                </div>
                                <label for="role">Cấp quyền</label>
                                <div class="row">
                                    <select name="role" >
                                        <c:forEach var="item" items="${requestScope.role}">
                                            <option value="${item.role}">${item.role}</option>
                                        </c:forEach>


                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary" style="margin-top: 10px">Tạo tài khoản</button>
                            </form>




                            <div class="card-footer border-0 py-5">

                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>





        <script src="../../../../public/admin/js/createAccount.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
