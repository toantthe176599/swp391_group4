<%-- 
    Document   : user-information
    Created on : Jul 10, 2024, 5:05:57 PM
    Author     : linhl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/tooplate-artxibition.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/your-stylesheet.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/font-awesome.css">
      
        <title>Cập nhật tài khoản</title>
        <style>
            h1{
                text-align: center;
                color: white;
                margin-bottom: -25px;

            }
            .h2, h2 {
                font-size: 2.5rem;
                color: white
            }
            .header-wrapper{
                background-color: white;
            }



            .col-12{
                background-color: white;
            }

            .kcPChZ {
                position: relative;
                max-width: 360px;
                margin: 25px auto auto;
                border: 1px solid rgb(230, 235, 245);
                box-sizing: border-box;
                border-radius: 8px;
                padding: 16px;
                background-color: white;
            }
            .h5, h5 {
                font-size: 1.2rem;
            }
            .gAJIxi {
                position: absolute;
                cursor: pointer;
                z-index: 1;
            }
            .hygtnX {
                text-align: center;
                position: relative;
                margin-bottom: 16px;
            }
            .QQwSN {
                border-radius: 50%;
                width: 128px;
                height: 128px;
                object-fit: cover;
            }
            .hygtnX svg {
                position: absolute;
                bottom: -10px;
                right: 90px;
            }
            .EqykT {
                margin-top: 8px;
                min-height: 84px;
                height: auto;
                width: 100%;
            }
            .gaxsRf {
                font-weight: bold;
                font-size: 14px;
                line-height: 16px;
                color: rgb(42, 45, 52);
            }
            .doWiTg {
                position: relative;
                margin-top: 4px;
            }
            .gsOHJo {
                border: 1px solid transparent;
                color: rgb(42, 45, 52);
                cursor: text;
                box-sizing: border-box;
                background-color: rgb(245, 247, 252);
                border-radius: 4px;
                width: 100%;
                height: 44px;
                padding: 12px;
                outline: none;
                font-weight: normal;
                font-size: 14px;
                line-height: 20px;
            }
            .jBDQfO {
                margin-top: 10px;
            }
            .dsoGkb {
                display: flex;
            }
            .gender-label {
                position: relative;
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .gender-input {
                position: absolute;
                opacity: 0;
                width: 0;
                height: 0;
            }

            .gender-button {
                display: inline-block;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
                position: relative;
                padding-left: 30px;
            }

            .gender-button::before {
                content: "";
                position: absolute;
                left: 10px;
                top: 50%;
                transform: translateY(-50%);
                width: 18px;
                height: 18px;
                border-radius: 50%;
                border: 1px solid rgb(45, 194, 117);
                background-color: white;
                transition: background-color 0.3s, border-color 0.3s;
            }

            .gender-input:checked + .gender-button::before {
                background-color: rgb(45, 194, 117);
                border-color: rgb(45, 194, 117);
            }
            .joLRer {
                cursor: pointer;
                background: rgb(45, 194, 117);
                border-radius: 20px;
                height: 40px;
                font-weight: bold;
                font-size: 16px;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                border: none;
                color: rgb(255, 255, 255);
                width: 100%;
                outline: none;
            }
            .fUKkhX input {
                border: 1px solid transparent;
                color: rgb(42, 45, 52);
                cursor: text;
                box-sizing: border-box;
                background-color: rgb(245, 247, 252);
                border-radius: 4px;
                width: 100%;
                height: 44px;
                padding: 12px;
                outline: none;
                font-weight: normal;
                font-size: 14px;
                line-height: 20px;
            }
            .doWiTg svg {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                right: 10px;
            }
            .qDHHO {
                margin-top: 42px;
                height: 35px;
            }
            .fUKkhX input {
                border: 1px solid transparent;
                color: rgb(42, 45, 52);
                cursor: text;
                box-sizing: border-box;
                background-color: rgb(245, 247, 252);
                border-radius: 4px;
                width: 100%;
                height: 44px;
                padding: 12px;
                outline: none;
                font-weight: normal;
                font-size: 14px;
                line-height: 20px;
                margin-top: 5px;
            }
            .btn-dark {
                color: black;
                background-color: white;
                border: none;
                border-radius: 20px;


            }
            .alert {
                position: relative;
                padding: -0.25rem 0.25rem;
                margin-bottom: 1rem;
                margin-top: 1rem;
                border: 1px solid transparent;
                border-radius: 1.25rem;

                .form{
                    background-color: black;
                }
            </style>

        </head>


        <body>
            <div class="header-wrapper">
                <jsp:include page="../component/Navbar.jsp" />
            </div>


            <div class="container">
                <!-- Header -->
                <header class="header border-bottom pt-6">
                    <div class="container-fluid">
                        <div class="mb-npx">
                            <h1 class="h2 mb-0 ls-tight">Cập nhật tài khoản </h1>
                        </div>
                    </div>
                </header>
                <!--End alert message-->




                <c:if test="${sessionScope.error != null}">
                    <div class="message info">
                        <div class="alert alert-danger" show-alert data-time="3000"> ${sessionScope.error}  <span close-alert>x</span> </div>
                    </div>
                    ${sessionScope.remove("error")}
                </c:if>


                <c:if test="${sessionScope.success != null}">
                    <div class="message info">
                        <div class="alert alert-success" show-alert data-time="3000" style="display: inline-block;
                             float: right;"> ${sessionScope.success}  </div>
                    </div>
                    ${sessionScope.remove("success")}
                </c:if>
                <div class="Profile__Container-sc-1mtm53v-0 kcPChZ">
                    <div class="profile">

                        <c:if test="${infor == null}">

                            <form action="/client/homepage/updateProfileClient"  method="POST">
                                <div class="Avatar__Container-sc-hrmnxt-0 hygtnX">
                                    <img alt="avatar" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png" class="Avatar__AvatarImg-sc-hrmnxt-1 QQwSN">

                                    <input type="file" accept="image/*" style="display: none;">
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Họ và tên</div>
                                    <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                        <input name="name" placeholder="Tên" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="2qaa9q" value="" required >
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Số điện thoại</div>
                                    <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                        <input name="phone" placeholder="Vd: 0123456789" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="x15qwl" value="" required pattern=[0-9]{10}>
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div disabled="" class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Address</div>
                                    <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                        <input name="address" placeholder="Địa chỉ" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="2pq8sm" value="" required >
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Ngày tháng năm sinh</div>
                                    <div class="DatePicker__EnhanceDatePicker-sc-13jd4oj-0 fUKkhX">
                                        <div class="react-datepicker-wrapper">
                                            <div class="react-datepicker__input-container">
                                                <input type="date" name="dob" placeholder="Nhập ở đây" class="" value="" fdprocessedid="uzczax" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Ảnh</div>
                                    <div class="DatePicker__EnhanceDatePicker-sc-13jd4oj-0 fUKkhX">
                                        <div class="react-datepicker-wrapper">
                                            <div class="react-datepicker__input-container">
                                                <input type="text" name="imgUrl" placeholder="Đường dẫn ảnh" class="" value="" fdprocessedid="uzczax" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row dAEIrW">
                                    <a href="/RenderProfileClient" type="button" class="btn btn-dark col-sm-6"><u>Quay lại</u></a>
                                    <input type="submit" class="btn btn-success col-sm-6" value="Cập nhật">
                                </div>
                            </form>
                        </c:if>

                        <c:if test="${infor != null}">
                            <form action="/client/homepage/updateProfileClient"  method="POST">
                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="Profile__GoBack-sc-1mtm53v-1 gAJIxi" id="goBackButton">
                                <path d="M15 3L3 15M3 3l12 12" stroke="#2A2D34" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                                <div class="Avatar__Container-sc-hrmnxt-0 hygtnX">
                                    <img alt="avatar" id="avatarImg" src="${infor.accountImg}" class="Avatar__AvatarImg-sc-hrmnxt-1 QQwSN">

                                    <input type="file" accept="image/*" style="display: none;">
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Họ và tên</div>
                                    <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                        <input name="name" placeholder="Nhập ở đây" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="2qaa9q" value="${infor.fullName}" required >
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Số điện thoại</div>
                                    <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                        <input name="phone" placeholder="Vd: 0123456789" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="x15qwl" value="${infor.phone}" required pattern=[0-9]{10}>
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div disabled="" class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Address</div>
                                    <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                        <input name="address" placeholder="Nhập ở đây" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="2pq8sm" value="${infor.address}" required >
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Ngày tháng năm sinh</div>
                                    <div class="DatePicker__EnhanceDatePicker-sc-13jd4oj-0 fUKkhX">
                                        <div class="react-datepicker-wrapper">
                                            <div class="react-datepicker__input-container">
                                                <input type="date" name="dob" placeholder="Nhập ở đây" class="" value="${infor.dateOfBirth}" fdprocessedid="uzczax" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                    <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Ảnh</div>
                                    <div class="DatePicker__EnhanceDatePicker-sc-13jd4oj-0 fUKkhX">
                                        <div class="react-datepicker-wrapper">
                                            <div class="react-datepicker__input-container">
                                                <input type="text" name="imgUrl" id="imgUrlInput" placeholder="Nhập ở đây" class="" value="${infor.accountImg}" fdprocessedid="uzczax" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row dAEIrW">
                                    <a href="/RenderProfileClient" type="button" class="btn btn-dark col-sm-6" ><u>Quay lại</u></a>
                                    <input type="submit" class="joLRer col-sm-6" value="Cập nhật" id="updateButton">                                      
                                </div>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- *** Footer *** --> <jsp:include page="../component/Footer.jsp" />

            <script>
                document.getElementById("goBackButton").onclick = function () {
                    window.location.href = "/homepage"; // Thay đổi "index.html" thành URL của trang chủ của bạn
                }
            </script>


            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            <script src="../../../public/admin/js/alert.js"></script>

        </body>
    </html>
