<%-- 
    Document   : Edit
    Created on : Jun 20, 2024, 11:14:31 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/createUserFormCss.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/checkboxCss.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>Chỉnh sửa loại sự kiện</title>
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

        <p all-data="${requestScope.permission}"></p>

        <c:set var="permissionRole" value="${applicationScope.permission}"  />
        <c:if test="${fn:contains(permissionRole, 'edit_category')}">


            <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
                <c:import url="/views/admin/component/NavBar.jsp" />
                <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                    <!-- Header -->
                    <header class="bg-surface-primary border-bottom pt-6">
                        <div class="container-fluid">
                            <div class="mb-npx">
                                <div class="row align-items-center">
                                    <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                        <!-- Title -->
                                        <h1 class="h2 mb-0 ls-tight">Chỉnh sửa loại sự kiên ${category.description} </h1>
                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                        <div class="mx-n1">


                                        </div>
                                    </div>
                                </div>


                                <main style="margin-left: 200px; width: 1600px ">
                                    <div class="form-container">
                                        <h1 class="title"><span>Nhập thông tin bạn muốn thay đổi</span></h1>
                                        <form action="/admin/category/edit" method="post" form-permisson autocomplete="on">

                                            <input type="hidden"  name="categoryId" value="${category.id}">
                                            <label><b>Tên loại sự kiện</b></label>
                                            <div class="row">
                                                <input type="text" required=""  name="description" value="${category.description}" >
                                            </div>
                                        </form>
                                        <button  class="btn btn-primary" submit-btn type="submit" style="margin-top: 10px">Chỉnh sửa</button>
                                    </div>

                                </main>

                            </div>
                        </div>
                </div>
            </div>



            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <script src="../../../../public/admin/js/EditCategory.js"></script>
            <script src="../../../../public/admin/js/alert.js"></script>



        </c:if>


    </body>
</html>
