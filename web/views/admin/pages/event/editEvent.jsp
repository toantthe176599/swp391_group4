
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/createUserFormCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/createEvent.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <title>Chỉnh sửa thông tin sự kiện</title>
    </head>
    <body>

        <c:if test="${sessionScope.error != null}">
            <div class="message info">
                <div class="alert alert-danger" show-alert data-time="3000"> ${sessionScope.error}  <span close-alert><b>X</b></span> </div>
            </div>
            ${sessionScope.remove("error")}
        </c:if>
        <!---tab to print html code   <c:out value="${message}"  escapeXml="false"/>        -->

        <c:set var="message" value="<h1>get code html hể</h1>" />


        <!----->

        <c:if test="${sessionScope.success != null}">
            <div class="message info">
                <div class="alert alert-success" show-alert data-time="3000"> ${sessionScope.success}  <span close-alert><b>X</b></span> </div>
            </div>
            ${sessionScope.remove("success")}
        </c:if>



        <c:if test="${fn:contains(permission, 'edit_ticket')}">
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
                                        <h1 class="h2 mb-0 ls-tight">Chỉnh sửa thông tin sự kiện</h1>

                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                        <div class="mx-n1">


                                        </div>
                                    </div>
                                </div>

                                <main style="margin-left: 100px; width: 1600px">
                                    <div class="form-container" >
                                        <h1 class="title"><span><h3>Điền thông tin sự kiện</h3></span></h1>
                                        <form action="/admin/event/edit" method="post" formEdit autocomplete="on" enctype="multipart/form-data">

                                            <input type="hidden" name="id" value="${event.id}">

                                            <!---name event-->
                                            <label for="eventname"  style="margin-top: 30px"><b><h4>Tên sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tên cho sự kiện" name="eventname" value="${event.name}" id="eventname" required="true" title="Vui lòng nhập tên sự kiện">
                                            </div>

                                            <!---titile-->
                                            <label for="title"  style="margin-top: 30px"><b><h4>Tên tiêu đề cho sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tiều đề" name="title" value="${event.title}" id="title" required="true" title="Vui lòng nhập tiêu đề">
                                            </div>

                                            <!--- artist-->
                                            <label for="artist"  style="margin-top: 30px"><b><h4>Nghệ sĩ tham gia</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Nhập tên nghệ sĩ" name="artist" value="${event.artist}" id="artist" required="true">
                                            </div>

                                            <!---money for artist-->
                                            <c:if test="${event.status == 'inactive'}">  
                                                <label for="money"  style="margin-top: 30px"><b><h4>Số tiền trả cho nghệ sĩ</h4></b></label>
                                                <div class="row">
                                                    <input type="text" placeholder="Nhập số tiền trả cho nghệ sĩ" name="money" value=<fmt:formatNumber value="${money}" pattern="########" /> id="money" required="true">

                                                </div>

                                            </c:if>

                                            <c:if test="${event.status != 'inactive'}">  
                                                <input type="hidden"  name="money" value=<fmt:formatNumber value="${money}" pattern="########" /> id="money" required="true">

                                            </c:if>

                                            <!--- organizer--> 
                                            <label for="organizer"  style="margin-top: 30px"><b><h4>Người đứng ra tổ chức(cá nhân hoặc 1 tổ chức)</h4></b></label>
                                            <div class="row">
                                                <input type="text" placeholder="Người đứng ra tổ chức" name="organizer" value="${event.organizer}" id="organizer" required="true">
                                            </div>


                                            <!--desctiption-->
                                            <label for="description"  style="margin-top: 30px"><b><h4>Mô tả sự kiện</h4></b></label>
                                            <div class="row">
                                                <textarea id="id" name="description" rows="5" class="default" cols="10" placeholder="Mô tả sự kiện">
                                                    <c:out value="${event.description}"  escapeXml="false"/>
                                                </textarea>
                                            </div>


                                            <!--start time-->
                                            <c:if test="${event.status == 'inactive'}">   
                                                <c:set var="formattedTime" value="${fn:substring(event.startTime, 0, 5)}" />
                                                <label for="start_time"  style="margin-top: 30px"><b><h4>Thời gian diễn ra sự kiện</h4></b></label>
                                                <div class="row">
                                                    <input type="time" placeholder="Nhập thời gian diễn ra sự kiện" name="start_time" value="${formattedTime}" id="start_time" required="true">
                                                </div>
                                            </c:if>


                                            <c:if test="${event.status != 'inactive'}">   
                                                <c:set var="formattedTime" value="${fn:substring(event.startTime, 0, 5)}" />

                                                <div class="row">
                                                    <input type="hidden" placeholder="Nhập thời gian diễn ra sự kiện" name="start_time" value="${formattedTime}" id="start_time" required="true">
                                                </div>
                                            </c:if>



                                            <!--start date-->
                                            <c:if test="${event.status == 'inactive'}">   
                                                <label for="start_date"  style="margin-top: 30px"><b><h4>Ngày diễn ra sự kiện</h4></b></label>
                                                <div class="row">
                                                    <input type="date" placeholder="Nhập ngày bắt đầu sự kiện " name="start_date" value="${event.startDate}" id="start_date" required="true">
                                                </div>   
                                            </c:if>

                                            <c:if test="${event.status != 'inactive'}">   
                                                <div class="row">
                                                    <input type="hidden" placeholder="Nhập ngày bắt đầu sự kiện " name="start_date" value="${event.startDate}" id="start_date" required="true">
                                                </div>   
                                            </c:if>



                                            <!--destination-->

                                            <label for="destination" style="margin-top: 30px"><b><h4>Địa điểm diễn ra sự kiện</h4></b></label>
                                            <div class="row">
                                                <input type="text"  name="destination" id="destination" class="default" rows="5" value='${event.destination}' placeholder="Nhập địa điểm" cols="10" >

                                            </div>




                                            <!-- Loại sự kiện-->
                                            <label for="category" style="margin-top: 30px"><b><h4>Loại sự kiện</h4></b></label>
                                            <div class="row">
                                                <select name="category" >
                                                    <c:forEach var="cat" items="${category}">
                                                        <h2>${item.description}</h2>
                                                        <option value="${cat.id}" ${cat.description == event.category ? 'selected' : ''} >${cat.description}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>




                                            <!---image demo event-->
                                            <label for="image_event"  style="margin-top: 20px"><b><h4>Ảnh sự kiện</h4></b></label>
                                            <div>
                                                <input type="file"  name="image_event" image_event value="" accept="image/*">
                                                <input type="hidden" name="image_event_change" value="false">
                                            </div>
                                            <div  > <img preview-img class="image-preview" src="${event.img_event}" alt="alt"/>
                                                <button type="button" class="close-btn" style="width: 20%" remove-preview >Xóa</button>

                                            </div>


                                            <!---image demo event-->
                                            <label for="image_position"  style="margin-top: 20px"><b><h4>Ảnh vị trị khán đài</h4></b></label>
                                            <div>
                                                <input type="file"  name="image_position" image_position value="" accept="image/*">
                                                <input type="hidden" name="image_potition_change" value="false">
                                            </div>
                                            <div style="display: block"> <img preview-img class="image-preview" src="${event.img_position}" alt="alt"/>
                                                <button type="button" class="close-btn" style="width: 20%" remove-preview >Xóa </button>
                                            </div>

                                            <!---Type of ticket-->
                                            <c:if test="${event.status == 'inactive'}">
                                                <input type="hidden" name="originLength" value="${fn:length(area)}">
                                                <label for="number-area"   style="margin-top: 20px"><b><h4>Số khu vực</h4></b></label>
                                                <div class="row">
                                                    <input type="number" number-area min="1"  max="100" name="area_quantity" value="${fn:length(area)}" placeholder="Nhập số khu"required="true">
                                                </div>
                                                <table id="table" style="width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th class="area">Tên khu vực</th>
                                                            <th class="area">Giá vé tại khu vực</th>
                                                            <th class="area">Số lượng vé</th>
                                                        </tr>
                                                    </thead>

                                                    <c:forEach var="item" items="${area}" varStatus="status">
                                                        <tr index="${status.index + 1}">
                                                            <td> <input type="text" value="${item.nameArea}" name="name_area_${status.index + 1}"></td>
                                                            <td><input type="number" value="${item.price}" name="price_${status.index + 1}"></td>
                                                            <td><input type="number" value="${item.quantityTicketOrigin}" name="quantity_${status.index + 1}"></td>
                                                            <td> <button deleteButton="${status.index + 1}" class="btn-danger" type="button">Xóa</button></td>
                                                        </tr>
                                                    </c:forEach>




                                                </table>
                                                <a class="btn btn-success" addAnewArea style="text-align: center" >thêm 1 khu vực mới</a>

                                            </c:if>


                                            <c:if test="${event.status != 'inactive'}">
                                                <input type="hidden" name="originLength" value="${fn:length(area)}">

                                                <div class="row">
                                                    <input type="hidden" number-area min="1"  max="100" name="area_quantity" value="${fn:length(area)}" placeholder="Nhập số khu"required="true">
                                                </div>
                                                <table id="table" style="display: none">
                                                    <thead>
                                                        <tr>
                                                            <th class="area">Tên khu vực</th>
                                                            <th class="area">Giá vé tại khu vực</th>
                                                            <th class="area">Số lượng vé</th>
                                                        </tr>
                                                    </thead>

                                                    <c:forEach var="item" items="${area}" varStatus="status">
                                                        <tr index="${status.index + 1}">
                                                            <td> <input type="text" value="${item.nameArea}" name="name_area_${status.index + 1}"></td>
                                                            <td><input type="number" value="${item.price}" name="price_${status.index + 1}"></td>
                                                            <td><input type="number" value="${item.quantityTicketOrigin}" name="quantity_${status.index + 1}"></td>

                                                        </tr>
                                                    </c:forEach>






                                                </c:if>



                                                <!---status event-->
                                                <c:if test="${event.status == 'inactive'}">
                                                    <div class="main" style="margin-top: 20px">
                                                        <div class="card">
                                                            <div class="title" ><b><h4>Trạng thái sự kiện</h4></b></div>
                                                            <div class="form">  
                                                                <label><input type="radio" class="input-radio on"  onButton name="status" value="active" ${event.status == "active" ? 'checked' : ""} > Hoạt động</label>
                                                                <label><input type="radio" class="input-radio off" offButton name="status" value="inactive" ${event.status == "inactive" ? 'checked' : ""}> Chờ </label>

                                                            </div>
                                                        </div>
                                                    </div>  
                                                </c:if>

                                                <c:if test="${event.status != 'inactive'}">
                                                    <div class="main" style="margin-top: 20px; display: none">
                                                        <input type="hidden" name='status' value='${event.status}'>
                                                    </div>  
                                                </c:if>



                                                <button type="button" submitBtn class="btn btn-primary" style="margin-top: 10px">Cập nhật</button>
                                                <button type="button" cancelBtn idEvent="${event.id}" class="btn btn-danger" style="margin-top: 10px">Hủy</button>
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
        <script src="../../../../public/admin/js/alert.js"></script>
        <script src="../../../../public/admin/js/imageForEdit.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
