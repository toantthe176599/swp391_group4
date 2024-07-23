<%-- 
    Document   : OTPForm
    Created on : May 23, 2024, 6:28:21 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../public/client/css/loginForm.css"/>
        <title>Xác thực OTP</title>

    </head>
    <body>
        <div class="wrapper">
            <div class="sign-panels">
                <ul class="flash_msg">


                    <c:if test="${sessionScope.error != null}">
                        <li class="msg s_warning" style="margin-bottom: 0">
                            <span><i class="fas fa-exclamation"></i></span>
                            <div class="text">
                                <div class="title">Warning</div>
                                <div class="content">${sessionScope.error}</div>
                                ${sessionScope.remove("error")}
                            </div>
                            <span class="alink"><i class="fas fa-times"></i></span>
                        </li>
                    </c:if>

                </ul>



                <div class="recover-password">
                    <div class="title">
                        <span>Đổi mật khẩu</span>
                        <p>Nhập mã OTP </p>
                    </div>



                    <div class="notification">
                        <p>
                            <span class="reset-mail"></span>Vui lòng kiểm tra email để lấy mã xác thực OTP
                        </p>
                        <form action="/submitOTP" method="POST">
                            <input type="text" placeholder="Enter the OTP here" id="resetPassword" name="OTP" required> 
                            <input type="submit" value="Xác thực" style="background-color: rgb(45, 194, 117); color: white " > 
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!--    <script src="../../../public/client/js/loginFormJS.js"></script>-->
</html>
