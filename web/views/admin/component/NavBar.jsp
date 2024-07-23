<%-- 
    Document   : NavBar
    Created on : May 30, 2024, 11:18:27 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
    <div class="container-fluid">
        <!-- Toggler -->
        <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Brand -->
        <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="/admin/dashboard">
            <img src="https://scontent.fhan14-3.fna.fbcdn.net/v/t1.15752-9/449601047_1156146512267329_8204449363145448204_n.png?_nc_cat=111&ccb=1-7&_nc_sid=9f807c&_nc_eui2=AeGqe6XFZJIn6HsRENTQD75LJoQNGWIPHZQmhA0ZYg8dlCsjrqVTgoMrY12bgXj86bokf02vtKP1dXeChs3gHnJ_&_nc_ohc=3Tvpd2eJz8QQ7kNvgFITuWc&_nc_ht=scontent.fhan14-3.fna&oh=03_Q7cD1QGXONmRIUIsvmZwbdOe8D5uKUmO4fzhAzkGCcTFCGYe1g&oe=66BB09F1" alt="...">
        </a>
        <!-- User menu (mobile) -->
        <div class="navbar-user d-lg-none">
            <!-- Dropdown -->
            <div class="dropdown">
                <!-- Toggle -->
                <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="avatar-parent-child">
                        <span class="avatar-child avatar-badge bg-success"></span>
                    </div>
                </a>
                <!-- Menu -->
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                    <a class="nav-link" href="/admin/ticket">
                        <i class="bi bi-house"></i> Trang chủ
                    </a>
                    <a class="nav-link" href="#">
                        <i class="bi bi-bar-chart"></i> Báo cáo 
                    </a>
                    <a class="nav-link" href="#">
                        <i class="bi bi-chat"></i> Truyền thông
                    </a>
                    <a class="nav-link" href="/admin/permission">
                        <i class="bi bi-bookmarks"></i> Nhóm quyền
                    </a>
                    <hr class="dropdown-divider">
                    <a class="nav-link" href="/admin/account">
                        <i class="bi bi-people"></i> Tài khoản
                    </a>
                    <a href="/logout" class="dropdown-item">Đăng xuất</a>
                </div>
            </div>
        </div>

        <c:set var="permission" value="${applicationScope.permission}"  />



        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidebarCollapse">
            <!-- Navigation -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/dashboard">
                        <i class="bi bi-house"></i> Trang chủ
                    </a>
                </li>
                <c:if test="${fn:contains(permission, 'view_ticket')}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/event">
                            <i class="bi bi-bar-chart"></i> Các sự kiện 
                        </a>
                    </li>
                </c:if>

                <c:if test="${fn:contains(permission, 'view_category')}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/category">
                            <i class="bi bi-collection"></i> Loại sự kiện
                        </a>
                    </li>
                </c:if>

                <c:if test="${fn:contains(permission, 'view_account')}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/account">
                            <i class="bi bi-people"></i> Tài khoản
                        </a>
                    </li>
                </c:if>


                <c:if test="${fn:contains(permission, 'view_role')}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/permission">
                            <i class="bi bi-bookmarks"></i> Nhóm quyền
                        </a>
                    </li>
                </c:if>


                <c:if test="${fn:contains(permission, 'view_blog')}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/blog">
                            <i class="bi bi-newspaper"></i> Bài viết
                        </a>
                    </li>
                </c:if>


                <c:if test="${fn:contains(permission, 'view_inforwebsite')}">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/footer">
                            <i class="bi bi-envelope"></i> Thông tin website
                        </a>

                    </li>
                </c:if>

                <li class="nav-item">
                    <a class="nav-link" href="/homepage">
                        <i class="bi bi-globe"></i> Đi đến trang web
                    </a>

                </li>
            </ul>
            <!-- Divider -->
            <hr class="navbar-divider my-5 opacity-20">
            <!-- Navigation -->

            <!-- Push content down -->
            <div class="mt-auto"></div>
            <!-- User (md) -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/profile">
                        <i class="bi bi-person-square"></i> Tài khoản của tôi
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">
                        <i class="bi bi-box-arrow-left"></i> Đăng xuất
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
