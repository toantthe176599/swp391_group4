<%-- 
    Document   : DashBoard
    Created on : May 30, 2024, 10:58:44 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <title>Tạo nhóm quyền mới</title>

    </head>
    <body>







        <c:set var="account" scope="page" value="${requestScope.account}"/>  


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


        <!-- Banner -->

        <!--          div(class="alert alert-success" show-alert data-time=time  <span close-alert>x</span>-->

        <!-- Dashboard -->

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
                                    <h1 class="h2 mb-0 ls-tight">Tạo 1 nhóm quyền mới </h1>
                                </div>
                                <!-- Actions -->
                                <div class="col-sm-6 col-12 text-sm-end">
                                    <div class="mx-n1">


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

                            </div>
                            <div class="table-responsive">
                                <form action="/admin/role/create" method="POST">
                                    <div class="input-group flex-nowrap">
                                        <span class="input-group-text" id="addon-wrapping" > <b>Tên nhóm quyền</b></span>
                                        <input type="text" class="form-control" pattern="[^\s]*"  title="Tên quyền không được có dấu cách"  name="namerole" aria-describedby="addon-wrapping">

                                        <span class="input-group-text" id="addon-wrapping"> <b>Mô tả</b> </span>
                                        <input type="text" class="form-control" name="description" aria-describedby="addon-wrapping">
                                        <button type="submit" class="btn btn-primary" style="height: auto">Tạo mới</button>

                                    </div>

                                </form>

                            </div>

                            <div class="card-footer border-0 py-5">

                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

    </body>




    <script src="../../../../public/admin/js/dashboard.js"></script>
    <script src="../../../../public/admin/js/changeStatus.js"></script>
    <script src="../../../../public/admin/js/alert.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
