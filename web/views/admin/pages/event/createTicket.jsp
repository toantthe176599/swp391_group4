
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
        <title>Tạo sự kiện mới </title>
    </head>
    <body>

        <c:if test="${sessionScope.error != null}">
            <div class="message info">
                <div class="alert alert-danger" show-alert data-time="4000"> ${sessionScope.error}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("error")}
        </c:if>
        <!---tab to print html code          -->


        <!----->

        <c:if test="${sessionScope.success != null}">
            <div class="message info">
                <div class="alert alert-success" show-alert data-time="4000"> ${sessionScope.success}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("success")}
        </c:if>


        <c:if test="${fn:contains(permission, 'add_ticket')}">
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
                                        <h1 class="h2 mb-0 ls-tight" >Tạo sự kiện mới</h1>

                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                        <div class="mx-n1">


                                        </div>
                                    </div>
                                </div>

                                <main style="margin-left: 100px; width: 1600px">
                                    <div class="form-container">
                                        <h1 class="title"><span><h3>Điền thông tin sự kiện mới</h3></span></h1>
                                        <form action="/admin/event/create" method="post" formCreate autocomplete="on" enctype="multipart/form-data">

                                            <!---name event-->
                                            <label for="eventname"  style="margin-top: 30px"><b><h4>Tên sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tên cho sự kiện" name="eventname" value="" id="eventname" required="true" title="Vui lòng nhập tên sự kiện">
                                            </div>

                                            <!---titile-->
                                            <label for="title"  style="margin-top: 30px"><b><h4>Tên tiêu đề cho sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tiều đề" name="title" value="" id="title" required="true" title="Vui lòng nhập tiêu đề">
                                            </div>

                                            <!--- artist-->
                                            <label for="artist"  style="margin-top: 30px"><b><h4>Nghệ sĩ tham gia</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tên nghệ sĩ" name="artist" value="" id="artist" required="true">
                                            </div>

                                            <!--- artist-->
                                            <label for="money"  style="margin-top: 30px"><b><h4>Số tiền trả cho nghệ sĩ</h4></b></label>
                                            <div class="row">
                                                <input type="number" placeholder="Số tiền trả cho nghệ sĩ" name="money" min="1"  value="" id="money" required="true">
                                            </div>

                                            <!--- organizer--> 
                                            <label for="organizer"  style="margin-top: 30px"><b><h4>Người đứng ra tổ chức(cá nhân hoặc 1 tổ chức)</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Người đứng ra tổ chức" name="organizer" value="" id="organizer" required="true">
                                            </div>


                                            <!--desctiption-->
                                            <label for="description"  style="margin-top: 30px"><b><h4>Mô tả sự kiện</h4></b></label>
                                            <div class="row">
                                                <textarea id="id" name="description" rows="5" class="default" cols="10" placeholder="Mô tả sự kiện"></textarea>
                                            </div>


                                            <!--start time-->
                                            <label for="start_time"  style="margin-top: 30px"><b><h4>Thời gian diễn ra sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="time" placeholder="Nhập thời gian diễn ra sự kiện" name="start_time" value="10:00" id="start_time" required="true">
                                            </div>

                                            <!--start date-->
                                            <label for="start_date"  style="margin-top: 30px"><b><h4>Ngày diễn ra sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="date" placeholder="Nhập ngày bắt đầu sự kiện" name="start_date" value="" id="start_date" required="true">
                                            </div>


                                            <!--destination-->
                                            <label for="destination" style="margin-top: 30px"><b><h4>Địa điểm diễn ra sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="text"  name="destination" id="destination" class="default" rows="5" placeholder="Nhập địa điểm" cols="10">
                                            </div>


                                            <!-- Loại sự kiện-->
                                            <label for="category" style="margin-top: 30px"><b><h4>Loại sự kiện</h4></b></label>
                                            <div class="row">
                                                <select name="category" >
                                                    <c:forEach var="item" items="${category}">
                                                        <option value="${item.id}">${item.description}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>




                                            <!---image demo event-->
                                            <label for="image_event"  style="margin-top: 20px"><b><h4>Ảnh sự kiện</h4></b></label>
                                            <div>
                                                <input type="file" required="true" name="image_event" image_event value="" accept="image/*">
                                            </div>
                                            <div  > <img preview-img class="image-preview" src="" alt="alt"/>
                                                <button type="button" class="close-btn" style="width: 20%" remove-preview >Xóa</button>
                                            </div>


                                            <!---image demo event-->
                                            <label for="image_event"  style="margin-top: 20px"><b><h4>Ảnh vị trị khán đài</h4></b></label>
                                            <div>
                                                <input type="file" required="true" name="image_position" image_event value="" accept="image/*">
                                            </div>
                                            <div> <img preview-img class="image-preview" src="" alt="alt"/>
                                                <button type="button" class="close-btn" style="width: 20%" remove-preview >Xóa </button>
                                            </div>

                                            <!---Type of ticket-->
                                            <label for="number-area"   style="margin-top: 20px"><b><h4>Số khu vực</h4></b></label>
                                            <div class="row">
                                                <input type="number" number-area min="1"  max="100" name="area_quantity" value="1" placeholder="Nhập số khu"required="true">
                                            </div>
                                            <table id="table" style="width: 100%">

                                            </table>




                                            <!---status event-->

                                            <div class="main" style="margin-top: 20px">
                                                <div class="card">
                                                    <div class="title" ><b><h4>Trạng thái sự kiện</h4></b></div>
                                                    <div class="form">  
                                                        <label><input type="radio" class="input-radio on"  onButton name="status" value="active"> Bắt đầu</label>
                                                        <label><input type="radio" class="input-radio off" checked name="status" offButton value="inactive"> Chờ </label>

                                                    </div>
                                                </div>
                                            </div>




                                            <button type="submit" submitBtn  class="btn btn-primary" style="margin-top: 10px">Tạo sự kiện</button>
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

        <!----->
        <script src="../../../../public/admin/js/createAccount.js"></script>
        <script src="../../../../public/admin/js/imagePreview.js"></script>
        <script src="../../../../public/admin/js/areaPosition.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
