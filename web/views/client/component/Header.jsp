<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="pre-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-sm-6">
                <span>                               </span>
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="text-button">
                    <a href="/logout">Đăng xuất <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="header-content">
                    <!-- Logo -->
                    <a href="/homepage" class="logo">Book<em>Show</em></a>
                    <!-- Navigation -->
                    <nav class="main-nav">
                        <ul class="nav">
                            <li><a href="/homepage" class="active">Trang chủ</a></li>
                            <li><a href="/blog">Bài viết</a></li>

                            <li><a href="rent-venue.html">Các vé đã mua</a></li>
                            <li><a href="shows-events.html">Thông tin tài khoản</a></li>
                        </ul>

                        <%-- Display different menu options based on login status --%>
                        <c:choose>
                            <c:when test="${empty sessionScope.username}">
                                <a href="/login" class='menu-trigger'>
                                    <span>Login</span>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/user-profile" class='menu-trigger'>
                                    <span>${sessionScope.username}</span>
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
