

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <title>Cập nhật tài khoản</title>
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
                                    <h1 class="h2 mb-0 ls-tight">Cập nhật tài khoản </h1>
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


                                <div class="container" style="margin-bottom: 150px; margin-top: 100px; margin-left: 100px">
                                    <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12 edit_information">
                                        <c:if test="${infor == null}">
                                            <form action="/admin/profile/update"  method="POST">	

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Họ tên:</label>
                                                            <input type="text" name="name" class="form-control" value="" required >
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Số điện thoại:</label>
                                                            <input type="tel" name="phone" class="form-control" value="" required pattern=[0-9]{10}>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Địa chỉ:</label>
                                                            <input type="text" name="address" class="form-control" value="" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Ngày sinh:</label>
                                                            <input type="date" name="birthday" class="form-control" value="" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Đường dẫn ảnh đại diên:</label>
                                                            <input type="url" name="imgUrl" class="form-control" value="">
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 submit">
                                                        <div class="form-group">
                                                            <input type="submit" class="btn btn-success" value="Cập nhật">
                                                            <a href="/admin/profile" type="button" class="btn btn-dark">Quay lại</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </c:if>


                                        <c:if test="${infor != null}">
                                            <form action="/admin/profile/update"  method="POST">	

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Họ tên:</label>
                                                            <input type="text" name="name" class="form-control" value="${infor.fullName}" required >
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Số điện thoại:</label>
                                                            <input type="tel" name="phone" class="form-control" value="${infor.phone}" required pattern=[0-9]{10}>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Địa chỉ:</label>
                                                            <input type="text" name="address" class="form-control" value="${infor.address}" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Ngày sinh:</label>
                                                            <input type="date" name="birthday" class="form-control" value="${infor.dateOfBirth}" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="profile_details_text">Đường dẫn ảnh đại diên:</label>
                                                            <input type="url" name="imgUrl" class="form-control" value="">
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 submit">
                                                        <div class="form-group">
                                                            <input type="submit" class="btn btn-success" value="Cập nhật">
                                                            <a href="/admin/profile" type="button" class="btn btn-dark">Quay lại</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </form>
                                        </c:if>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
