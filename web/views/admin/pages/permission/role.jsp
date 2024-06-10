<%-- 
    Document   : permission
    Created on : Jun 3, 2024, 9:13:30 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../public/admin/css/alert.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <title>Phân quyền</title>
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
            <c:if test="${fn:contains(permission, 'view_role')}">
                <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                    <!-- Header -->
                    <header class="bg-surface-primary border-bottom pt-6">
                        <div class="container-fluid">
                            <div class="mb-npx">
                                <div class="row align-items-center">
                                    <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                        <!-- Title -->
                                        <h1 class="h2 mb-0 ls-tight">Danh sách nhóm quyền </h1>
                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                        <c:if test="${fn:contains(permission, 'add_role')}">
                                            <div class="mx-n1">

                                                <a href="/admin/role/create/form" class="btn d-inline-flex btn-sm btn-primary mx-1">
                                                    <span class=" pe-2">
                                                        <i class="bi bi-plus"></i>
                                                    </span>
                                                    <span>Tạo nhóm quyền mới</span>
                                                </a>
                                            </div>
                                        </c:if>

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
                                    <h5 class="mb-0">Nhóm quyền</h5>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover table-nowrap">

                                        <thead class="thead-light">
                                            <tr>

                                                <th scope="col">Vai trò</th>
                                                <th scope="col">Miêu tả</th>
                                                <th scope="col"> </th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item.role != 'customer'}">
                                                    <tr>
                                                        <td>${item.role}</td>
                                                        <td>${item.description}</td>
                                                        <td class="text-end">
                                                            <c:if test="${fn:contains(permission, 'edit_role')}">
                                                                <a href="/admin/role/edit/form/${item.role}"  class="btn d-inline-flex btn-sm btn-neutral border-base mx-1">
                                                                    <span class=" pe-2">
                                                                        <i class="bi bi-pencil"></i>
                                                                    </span>
                                                                    <span>Chỉnh sửa</span>
                                                                </a>
                                                            </c:if>

                                                            <c:if test="${fn:contains(permission, 'delete_role')}">
                                                                <button type="button" remove-button role="${item.role}" delete-btn-role   class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                                    <i class="bi bi-trash" > </i>
                                                                </button> 

                                                            </c:if>


                                                        </td> 
                                                    </tr>
                                                </c:if>

                                            </c:forEach>







                                        </tbody>

                                    </table>

                                </div>



                            </div>
                        </div>
                    </main>
                </div>
            </c:if>


        </div>


    </body>
    <script src="../../../../public/admin/js/dashboard.js"></script>
    <script src="../../../../public/admin/js/alert.js"></script>
    <script src="../../../../public/admin/js/permission.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
