

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/tooplate-artxibition.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/your-stylesheet.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/font-awesome.css">

        <title>Thông tin tài khoản</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;

            }
            h1{
                text-align: center;
                color: white;
                margin-bottom: -25px;

            }
            .h2, h2 {
                font-size: 2.5rem;
                color: white
            }

            .container{

                width: 100%;
                height: 100%;

            }

            .kcPChZ {
                position: relative;
                max-width: 500px;
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
                margin-top: 8px;
                height: 84px;
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



        </style>
    </head>


    <body>

        <!--alert messsage-->

        <!-- get all role-->
        <c:set var="role" value="${requestScope.role}"/>  
        <!-- end-->

        <c:set var="permission" value="${applicationScope.permission}"  />



        <!--        //End alert message-->
        <div class="header-wrapper">
            <jsp:include page="../component/Navbar.jsp" />
        </div>
        <div class="container">
            <!-- Header -->


            <div class="Profile__Container-sc-1mtm53v-0 kcPChZ">    
                <div class="profile">
                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="Profile__GoBack-sc-1mtm53v-1 gAJIxi" id="goBackButton">
                    <path d="M15 3L3 15M3 3l12 12" stroke="#2A2D34" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                    <div class="Avatar__Container-sc-hrmnxt-0 hygtnX">
                        <c:if test="${infor.accountImg == null}">
                            <div class="user-card-img">
                                <img alt="avatar" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png" class="Avatar__AvatarImg-sc-hrmnxt-1 QQwSN">

                                <input type="file" accept="image/*" style="display: none;">
                            </div>
                        </c:if>

                        <c:if test="${infor.accountImg != null}">
                            <div class="user-card-img">
                                <img alt="avatar" src="${infor.accountImg}" class="Avatar__AvatarImg-sc-hrmnxt-1 QQwSN">

                                <input type="file" accept="image/*" style="display: none;">
                            </div>
                        </c:if>

                    </div>
                    <div class="user-card-info">
                        <c:if test="${infor == null}">
                            <h5>Thông tin của bạn chưa được cập nhật!</h5>  
                            <h5>Vui lòng cập nhật thông tin!</h5>
                        </c:if>

                        <c:if test="${infor != null}">
                            <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Họ và tên</div>
                                <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                    <input disabled name="name" placeholder="Nhập ở đây" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="2qaa9q" value="${infor.fullName}" >
                                </div>
                            </div>
                            <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Số điện thoại</div>
                                <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                    <input disabled name="phone" placeholder="Vd: 0123456789" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="x15qwl" value="${infor.phone}" pattern=[0-9]{10}>
                                </div>
                            </div>
                            <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                <div disabled="" class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Địa chỉ</div>
                                <div class="InfoItem__InputWrapper-sc-1asxhgs-3 doWiTg">
                                    <input disabled name="address" placeholder="Nhập ở đây" type="text" maxlength="70" class="InfoItem__EnhanceInput-sc-1asxhgs-4 gsOHJo" fdprocessedid="2pq8sm" value="${infor.address}" >
                                </div>
                            </div>
                            <c:set var="originalDateString" value="${infor.dateOfBirth}" />

                            <fmt:parseDate value="${originalDateString}" pattern="yyyy-MM-dd" var="dateObject" />

                            <fmt:formatDate value="${dateObject}" pattern="dd/MM/yyyy" var="formattedDate" />

                            <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Ngày tháng năm sinh</div>
                                <div class="DatePicker__EnhanceDatePicker-sc-13jd4oj-0 fUKkhX">
                                    <div class="react-datepicker-wrapper">
                                        <div class="react-datepicker__input-container">
                                            <input disabled type="date" name="dob" placeholder="Nhập ở đây" class="" value="${infor.dateOfBirth}" fdprocessedid="uzczax">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="Container__FlexColumn-sc-17x1kk6-3 InfoItem__Wrapper-sc-1asxhgs-2 ddiJGM EqykT">
                                <div class="InfoItem__Label-sc-1asxhgs-5 gaxsRf">Ảnh</div>
                                <div class="DatePicker__EnhanceDatePicker-sc-13jd4oj-0 fUKkhX">
                                    <div class="react-datepicker-wrapper">
                                        <div class="react-datepicker__input-container">
                                            <input disabled type="text" name="imgUrl" placeholder="Nhập ở đây" class="" value="${infor.accountImg}" fdprocessedid="uzczax" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <div class="update__Button-sc-1lgblze-0 qDHHO">
                            <button updateBtn2 class="joLRer" id="updateBtn2">Cập nhật</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- *** Footer *** --> <jsp:include page="../component/Footer.jsp" />
        <script>
            document.getElementById("goBackButton").onclick = function () {
                window.location.href = "/homepage";
            }
        </script>
    </body>
    <script src="../../../../public/client/js/profileJs.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
