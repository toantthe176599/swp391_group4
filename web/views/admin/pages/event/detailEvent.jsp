
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/createUserFormCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/createEvent.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <title>Chi tiết sự kiện</title>
    </head>
    <body>


        <!---tab to print html code          -->


        <!----->
        <c:set var="event" value="${requestScope.event}" />
        <c:set var="area" value="${requestScope.area}" />
        <c:if test="${fn:contains(permission, 'view_ticket')}">
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
                                        <h1 class="h2 mb-0 ls-tight">Thông tin chi tiết </h1>

                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
                                        <div class="mx-n1">


                                        </div>
                                    </div>
                                </div>

                                <main style="margin-left: 200px; width: 1600px" >
                                    <div class="form-container">



                                        <!---name event-->
                                        <label for="eventname"  style="margin-top: 30px"><b><h4>Tên sự kiện: ${event.name}</h4></b></label>

                                        <br/>
                                        <!---titile-->
                                        <label for="title"  style="margin-top: 30px"><b><h4>Tiêu đề sự kiện: ${event.title}</h4></b></label>

                                        <br/>
                                        <!--- artist-->
                                        <label for="artist"  style="margin-top: 30px"><b><h4>Nghệ sĩ tham gia: ${event.artist}</h4></b></label>

                                        <br/>
                                        <!--- organizer--> 
                                        <label for="organizer"  style="margin-top: 30px"><b><h4>Người đứng ra tổ chức(cá nhân hoặc 1 tổ chức): ${event.organizer}</h4></b></label>


                                        <br/>
                                        <!--desctiption-->
                                        <label for="description"  style="margin-top: 30px"><b><h4>Mô tả sự kiện</h4></b></label>
                                        <div class="row">
                                            <c:out value="${event.description}"  escapeXml="false"/>
                                        </div>
                                        <br/>
                                        <c:set var="formattedTime" value="${fn:substring(event.startTime, 0, 5)}" />
                                        <!--start time-->
                                        <label for="start_time"  style="margin-top: 30px"><b><h4>Thời gian diễn ra sự kiện: ${formattedTime}</h4></b></label>

                                        <br/>

                                        <!--- format date-->
                                        <c:set var="originalDateString" value="${event.startDate}" />

                                        <fmt:parseDate value="${originalDateString}" pattern="yyyy-MM-dd" var="dateObject" />

                                        <fmt:formatDate value="${dateObject}" pattern="dd/MM/yyyy" var="formattedDate" />

                                        <!----->
                                        <label for="start_date"  style="margin-top: 30px"><b><h4>Ngày diễn ra sự kiện: ${formattedDate}</h4></b></label>


                                        <br/>
                                        <!--start date-->
                                        <label for="destination" style="margin-top: 30px"><b><h4>Địa điểm diễn ra sự kiện: <b>${event.destination}</b></h4></b></label>



                                        <br/>


                                        <!-- Loại sự kiện-->
                                        <label for="category" style="margin-top: 30px"><b><h4>Loại sự kiện: ${event.category} </h4></b></label>

                                        <br/>



                                        <!---image demo event-->
                                        <label   style="margin-top: 20px"><b><h4>Ảnh sự kiện</h4></b></label>

                                        <div > 
                                            <img  class="image-preview" src="${event.img_event}" alt="alt"/>
                                        </div>


                                        <!---image demo event-->
                                        <label style="margin-top: 20px"><b><h4>Ảnh vị trị khán đài</h4></b></label>

                                        <div> <img  class="image-preview" src="${event.img_position}"  alt="alt"/>
                                        </div>

                                        <!---Type of ticket-->
                                        <label for="number-area"   style="margin-top: 20px"><b><h4>Số khu vực: ${fn:length(area)}</h4></b></label>

                                        <div class="row">
                                            <b> <h5> ${event.area_quantity}</h5> </b> 
                                        </div>


                                        <div class="row">
                                            <table border="5" cellpadding="5" id="table">
                                                <thead>
                                                    <tr>
                                                        <th>Tên khu vực</th>
                                                        <th>Giá vé tại khu vực</th>
                                                        <th>Số lượng vé</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="item" items="${area}">
                                                        <tr>
                                                            <td>${item.nameArea}</td>
                                                            <td>${item.price}</td>
                                                            <td>${item.quantityTicketOrigin}</td>
                                                        </tr>
                                                    </c:forEach>



                                                </tbody>
                                            </table>
                                        </div>




                                        <!---status event-->
                                        <div class="title" style="margin-top: 30px" ><b><h4>Trạng thái sự kiện: ${event.status == "active" ? "Hoạt động" : "Không hoạt động"}</h4></b></div>


                                        <a href="/admin/event" class="btn btn-primary">Quay lại</a>

                                        <c:if test="${fn:contains(permission, 'edit_ticket')}">
                                            <a href="/admin/event/edit/form/${event.id}" class="btn btn-success">Chỉnh sửa</a>

                                        </c:if>
                                        <a href="/admin/event/history/${event.id}" class="btn btn-dark">Lịch sử thay đổi</a>

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

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
