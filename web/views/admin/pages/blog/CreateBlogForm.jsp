<%-- 
    Document   : CreateBlogForm
    Created on : Jun 20, 2024, 10:06:46 PM
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
        <link rel="stylesheet" href="../../../../public/admin/css/createEvent.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <title>Tạo bài viết mới</title>
    </head>
    <body>

        <c:if test="${sessionScope.error != null}">
            <div class="message info">
                <div class="alert alert-danger" show-alert data-time="4000"> ${sessionScope.error}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("error")}
        </c:if>
        <!---tab to print html code          -->


        <!---
        <c:set var="message" value="<h1>get code html hể</h1>" />
        <c:out value="${message}"  escapeXml="false"/>
        -->

        <c:if test="${sessionScope.success != null}">
            <div class="message info">
                <div class="alert alert-success" show-alert data-time="4000"> ${sessionScope.success}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("success")}
        </c:if>



        <c:if test="${fn:contains(permission, 'add_blog')}">
            <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
                <c:import url="/views/admin/component/NavBar.jsp" />
                <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                    <!-- Header -->
                    <header class="bg-surface-primary border-bottom pt-6">
                        <div class="container-fluid">
                            <div class="mb-npx">
                                <div class="row align-items-center">

                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                        <div class="mx-n1">


                                        </div>
                                    </div>
                                </div>

                                <main style="margin-left: 100px; width: 1800px">
                                    <div class="form-container">
                                        <h1 class="title"><span><h3>Điền thông tin bài viết mới</h3></span></h1>
                                        <form action="/admin/blog/create" method="post" formCreate autocomplete="on" enctype="multipart/form-data">

                                            <!---name event-->
                                            <label for="eventname"  style="margin-top: 30px"><b><h4>Tiêu đề bài viết</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tiều đề cho bài viết" name="title" value="" id="eventname" required="true" title="Vui lòng nhập tên sự kiện">
                                            </div>

                                            <!--desctiption-->
                                            <label for="content"  style="margin-top: 30px;" ><b><h4>Nội dung sự kiện</h4></b></label>
                                            <div class="row">
                                                <textarea  name="content" rows="5" class="default" id="content" cols="10" placeholder="Nội dung bài viết"></textarea>
                                            </div>


                                            <!--- organizer--> 
                                            <label for="author"  style="margin-top: 30px"><b><h4>Tác giả</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tên tác giả" name="author" value="" id="author" required="true">
                                            </div>







                                            <!--start date-->
                                            <label for="start_date"  style="margin-top: 30px"><b><h4>Ngày Đăng</h4></b></label>
                                            <div class="row">
                                                <input type="date" placeholder="dd/mm/yyyy" name="start_date"  value="" id="start_date" required="true">
                                            </div>



                                            <!---image demo event-->
                                            <label for="image_blog"  style="margin-top: 20px"><b><h4>Ảnh bài viết</h4></b></label>
                                            <div>
                                                <input type="file" required="true" name="image_blog" image_event value="" accept="image/*">
                                            </div>
                                            <div> <img preview-img class="image-preview" src="" alt="alt"/>
                                                <button type="button" class="close-btn" style="width: 20%" remove-preview >Xóa</button>
                                            </div>







                                            <!---status event-->

                                            <div class="main" style="margin-top: 20px">
                                                <div class="card">
                                                    <div class="title" ><b><h4>Trạng thái bài viết</h4></b></div>
                                                    <div class="form">  
                                                        <label><input type="radio" class="input-radio on" checked name="status" value="active"> ON</label>
                                                        <label><input type="radio" class="input-radio off" name="status" value="inactive"> OFF</label>

                                                    </div>
                                                </div>
                                            </div>




                                            <button type="submit" submitBtn class="btn btn-primary" style="margin-top: 10px">Tạo bài viết</button>
                                            <button type="button" cancelBtn class="btn btn-danger" style="margin-top: 10px">Hủy</button>
                                        </form>
                                    </div>

                                </main>
                            </div>
                        </div>


                </div>
            </div>
        </c:if>




        <!--- tiny mce-->

        <script src="../../../../tinymce/tinymce.min.js"></script>
        <script src="../../../../public/admin/js/tinyMceConfig.js"></script>
        <script src="../../../../public/admin/js/imagePreview.js"></script>
        <script src="../../../../public/admin/js/alert.js"></script>
        <script src="../../../../public/admin/js/CreateBlog.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>