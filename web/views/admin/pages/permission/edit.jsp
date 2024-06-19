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
        <link rel="stylesheet" href="../../../../public/admin/css/checkboxCss.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>Chỉnh sửa thông tin người dùng</title>
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
                                    <h1 class="h2 mb-0 ls-tight">Chỉnh sửa thông tin nhóm quyền ${role.role} </h1>
                                </div>
                                <!-- Actions -->
                                <div class="col-sm-6 col-12 text-sm-end">
                                    <div class="mx-n1">


                                    </div>
                                </div>
                            </div>


                            <main style="margin-left: 200px; ">
                                <div class="form-container">
                                    <h1 class="title"><span>Nhập thông tin bạn muốn thay đổi</span></h1>
                                    <form action="/admin/role/edit" method="post" form-permisson autocomplete="on">
                                        <input type="hidden" value="" name="permissionlist" >
                                        <input type="hidden"  name="oldrole" value="${role.role}">
                                        <label><b>Tên nhóm quyền</b></label>
                                        <div class="row">

                                            <input type="text"  id="userName" name="namerole"  value="${role.role}" >
                                        </div>
                                        <label ><b>Miêu tả</b></label>
                                        <div class="row">
                                            <input type="text"  name="description" value="${role.description}" >
                                        </div>


                                        <label ><b>Cấp quyền</b></label>

                                        <table class="table" table-permission>
                                            <thead>

                                            <th>
                                                <input type="checkbox" class="checkAll" name="checkAll" />
                                            </th>
                                            <th><b>Các quyền</b></th>


                                            </thead>
                                            <tbody>
                                                <tr>

                                                    <td colspan="2" style="text-align: center"><h5>Tài khoản</h5></td>

                                                </tr>
                                                <tr data-name="view_account">
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Xem tài khoản</td>

                                                </tr >

                                                <tr data-name="add_account" add_account>
                                                    <td><input type="checkbox" name="item[]"></td>
                                                    <td>Thêm tài khoản</td>

                                                </tr>

                                                <tr data-name="edit_account" edit_account>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Sửa tài khoản</td>

                                                </tr>
                                                <tr data-name="delete_account" delete_account>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Xóa tài khoản</td>
                                                </tr>
                                                <tr>

                                                    <td colspan="2" style="text-align: center"><h5>Vé sự kiện</h5></td>

                                                </tr>

                                                <tr data-name="view_ticket" view_ticket>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Xem vé sự kiện</td>

                                                </tr>

                                                <tr data-name="add_ticket" add_ticket>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Thêm vé sự kiện</td>

                                                </tr>

                                                <tr data-name="edit_ticket" edit_ticket>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Sửa vé sự kiện</td>

                                                </tr>

                                                <tr data-name="delete_ticket" delete_ticket>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Xóa vé sự kiện</td>

                                                </tr>

                                                <tr>

                                                    <td colspan="2" style="text-align: center"><h5>Phân quyền</h5></td>

                                                </tr>

                                                <tr data-name="view_role" view_role>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Xem nhóm quyền</td>

                                                </tr>

                                                <tr data-name="add_role" add_role>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Thêm nhóm quyền</td>

                                                </tr>

                                                <tr data-name="edit_role" edit_role>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Sửa nhóm quyền</td>

                                                </tr>

                                                <tr data-name="delete_role" delete_role>
                                                    <td><input type="checkbox" name="item[]" ></td>
                                                    <td>Xóa nhóm quyền</td>

                                                </tr>

                                            </tbody>
                                        </table>





                                    </form>
                                    <button  class="btn btn-primary" submit-btn style="margin-top: 10px">Chỉnh sửa</button>
                                </div>

                            </main>

                        </div>
                    </div>




                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
                    <script src="../../../../public/admin/js/checkBoxJS.js"></script>
                    <script src="../../../../public/admin/js/alert.js"></script>
                    </body>
                    </html>
