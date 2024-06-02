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
        <title>Reset password</title>

    </head>
    <body>
        <div class="wrapper">
            <div class="sign-panels">
                <ul class="flash_msg">
                    <!--			<li class="msg s_success">
                                                    <span><i class="fas fa-check"></i></span>
                                                    <div class="text">
                                                            <div class="title">Success</div>
                                                            <div class="content">Anyone with access can view your invited visitors.</div>
                                                    </div>
                                                    <span class="alink"><i class="fas fa-times"></i></span>
                    </li>-->

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
                        <span>Reset your Password</span>
                        <p>Enter new password </p>
                    </div>



                    <div class="notification">
                        <form action="/resetPassword" method="POST">
                            <input type="password" placeholder="Enter new password" id="resetPassword" name="password" required> 
                            <input type="password" placeholder="Confirm password" id="resetPassword" name="confirmPassword" required> 
                            <input type="submit" value="Submit" style="background-color:#ec581e; color: white " > 
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!--    <script src="../../../public/client/js/loginFormJS.js"></script>-->
</html>
