<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="pre-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-sm-6">
                <span>                    </span>
            </div>
            <div class="col-lg-6 col-sm-6">
                <div class="text-button">

                    <c:if test="${token == null}">
                        <a href="/form">Đăng nhập <i class="fa fa-arrow-right"></i></a>
                        </c:if>
                        <c:if test="${token != null}">
                        <a href="/logout">Đăng xuất <i class="fa fa-arrow-right"></i></a>
                        </c:if>
                    
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
                    <div class="logo-search">
                        <!-- Logo -->
                        <a href="/homepage" class="logo">Book<em>Show</em></a>
                        <!-- Search Box -->
                        <div class="search-box">
                            <form id="searchForm" action="${pageContext.request.contextPath}/search" method="get">
                                <input type="text" name="searchTerm" placeholder="Bạn tìm kiếm gì hôm nay..." required>
                                <button type="submit">Tìm kiếm</button>
                            </form>
                        </div>
                    </div>
                    <!-- Navigation -->
                    <nav class="main-nav">
                        <ul class="nav">
                            <li><a href="/homepage" class="active">Trang chủ</a></li>
                            <li><a href="/blog">Bài viết</a></li>
                            <li><a href="rent-venue.html">Các vé đã mua</a></li>
                            <li><a href="shows-events.html">Thông tin tài khoản</a></li>
                        </ul>
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
