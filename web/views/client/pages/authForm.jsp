<%-- 
    Document   : signInUpForm
    Created on : May 22, 2024, 10:14:13 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../../public/client/css/loginForm.css"/>
    </head>
    <body>



        <div class="wrapper">
            <div class="sign-panels">
                <ul class="flash_msg">
                     <c:if test="${sessionScope.message != null}">
                    <li class="msg s_success">
                        <span><i class="fas fa-check"></i></span>
                        <div class="text">
                            <div class="title">Success</div>
                            <div class="content">${sessionScope.message}</div>
                             ${sessionScope.remove("message")}
                        </div>
                        <span class="alink"><i class="fas fa-times"></i></span>
                    </li>
                     </c:if>

                    <c:if test="${sessionScope.error != null}">
                        <li class="msg s_warning" style="margin-bottom: 0">
                            <span><i class="fas fa-exclamation"></i></span>
                            <div class="text">
                                <div class="title">Warning</div>
                                <div class="content"> <h3 style="color: red">${sessionScope.error}</h3> </div>
                                ${sessionScope.remove("error")}
                            </div>
                            <span class="alink"><i class="fas fa-times"></i></span>
                        </li>
                    </c:if>

                </ul>


                <div class="login">
                    <div class="title">
                        <span>Sign In</span>
                        <
                        <p>Welcome back, please login to your account. You can login with Google or by your regular
                            user login.</p>
                    </div>

                    <div>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/GoogleLogin&response_type=code&client_id=486293954738-8c3f1t8nphc2nn3qvmkuqra1js1ja2n8.apps.googleusercontent.com&approval_prompt=force" class="btn-face"><i class="fa fa-facebook" aria-hidden="true"></i> Google</a>

                    </div>

                    <div class="or"><span>OR</span></div>

                    <form action="/signIn" method="post" id="loginForm">
                        <input type="text" placeholder="Username" name="Username" required>
                        <input type="password" placeholder="Password" name="Password" required maxlength="6" pattern="^\S{6,}$">
                        <input type="checkbox" id="remember">
                        <label for="remember">Keep me sign in</label>
                        <a id="clickHref" class="btn-signin">Sign In</a>
                        <!--                        <input type="submit" value="Submit" class="btn-signin">-->


                        <a href="javascript:void(0)" class="btn-reset btn-fade">Recover your password <i class="fa fa-long-arrow-right"
                                                                                                         aria-hidden="true"></i></a>
                        <a href="javascript:void(0)" class="btn-member btn-fade">Not a member yet? <i class="fa fa-long-arrow-right"
                                                                                                      aria-hidden="true"></i></a>
                    </form>
                </div>
                <!--                ----------------------------------------------------------------------------------------------------------->
                <div class="signup">
                    <div class="title">
                        <span>Sign Up</span>
                        <p>Create a new account. You can sign up with your Google accunt. Or your regular user
                            login.</p>
                    </div>
                    <div>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/GoogleSignup&response_type=code&client_id=486293954738-8c3f1t8nphc2nn3qvmkuqra1js1ja2n8.apps.googleusercontent.com&approval_prompt=force" class="btn-face"><i class="fa fa-facebook" aria-hidden="true"></i> Google</a>

                    </div>

                    <div class="or"><span>OR</span></div>

                    <form action="/signUp" id="signUp" method="post">
                        <input type="text" placeholder="Username" name="username" required>
                        <input type="text" placeholder="Email Address" name="email" required>
                        <input type="password" placeholder="Password" name="password" maxlength="6" pattern="^\S{6,}$" required>
                        <input type="password" placeholder="Repeat Password" name="repeatPassword" maxlength="6" pattern="^\S{6,}$" required>

                        <a href="#" class="btn-signin" id="signUpLink">Sign Up</a>
                        <a href="javascript:void(0)" class="btn-login btn-fade">Already have an account, Sign In <i
                                class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                    </form>
                </div>

                <div class="recover-password">
                    <div class="title">
                        <span>Recover Password</span>
                        <p>Enter in the username or email associated with your account</p>
                    </div>

                    <form action="/fogotPassword">
                        <input type="email" placeholder="Username/Email Address" id="resetPassword" name="email" required>
                        <span class="error"></span>

                        <input type="submit" value="Send" style="background-color: #ec581e; color: white">
                        <a href="javascript:void(0)" class="btn-login btn-fade"><i class="fa fa-long-arrow-left" aria-hidden="true"></i> Cancel
                            and go back to Login page </a>
                    </form>

                    <div class="notification">
                        <p>Good job. An email containing information on how to reset your passworld was sent to
                            <span class="reset-mail"></span>. Please follow the instruction in that email to
                            reset your password. Thanks!</p>
                        <input type="email" placeholder="Username/Email Address" id="resetPassword" name="email" required>

                    </div>

                </div>
            </div>
        </div>

        <!--
         * Created by Muhammed Erdem on 10.10.2017.
         *-->
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../../../public/client/js/loginFormJS.js"></script>

</html>
