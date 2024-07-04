<%-- 
    Document   : DashboardBlog
    Created on : Jun 20, 2024, 5:15:14 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/CssBlogDashboard.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Bài viết</title>
    </head>
    <body>
        <!--alert messsage-->

        <!-- get all role-->
        <c:set var="role" value="${requestScope.role}"/>  
        <!-- end-->

        <c:set var="permission" value="${applicationScope.permission}"  />


        <c:if test="${sessionScope.error != null}">
            <div class="message info">
                <div class="alert alert-danger" show-alert data-time="3000"> ${sessionScope.error}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("error")}
        </c:if>


        <c:if test="${sessionScope.success != null}">
            <div class="message info">
                <div class="alert alert-success" show-alert data-time="3000"> ${sessionScope.success}  <span close-alert>x</span> </div>
            </div>
            ${sessionScope.remove("success")}
        </c:if>

        <!--End alert message-->

        <!--_
        <c:forEach var="index"  begin="0" end="${fn:length(permission) - 5}" step="1">
                    <h1>${permission[index]}</h1>
        </c:forEach>
        -->
        <c:set var="lengthArray" value="${(fn:length(blog) / 3) + 1}"  />




        <c:if test="${fn:contains(permission, 'view_blog')}">
            <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
                <!-- Vertical Navbar -->
                <c:import url="/views/admin/component/NavBar.jsp" />
                <!-- Main content -->
                <c:if test="${fn:contains(permission, 'view_blog')}">
                    <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                        <!-- Header -->
                        <header class="bg-surface-primary border-bottom pt-6">
                            <div class="container-fluid">
                                <div class="mb-npx">
                                    <div class="row align-items-center">
                                        <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                            <!-- Title -->
                                            <h1 class="h2 mb-0 ls-tight">Danh sách Bài viết</h1>
                                        </div>
                                        <!-- Actions -->
                                        <div class="col-sm-6 col-12 text-sm-end">
                                            <c:if test="${fn:contains(permission, 'add_blog')}">
                                                <div class="mx-n1">

                                                    <a href="/admin/blog/create/form" class="btn d-inline-flex btn-sm btn-primary mx-1">
                                                        <span class=" pe-2">
                                                            <i class="bi bi-plus"></i>
                                                        </span>
                                                        <span>Tạo bài viết mới</span>
                                                    </a>
                                                </div>
                                            </c:if>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </header>
                        <!-- Main -->





                        <main class="py-6 bg-surface-secondary">
                            <div class="container-fluid">
                                <!-- Card stats -->

                                <div class="card shadow border-0 mb-7">



                                    <div class="table-responsive">
                                        <table class="table table-hover table-nowrap">

                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col"> </th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="index"  begin="1" end="${lengthArray}" step="1">

                                                    <tr>

                                                <div class="container">
                                                    <div class="blog-row">
                                                        <c:forEach var="jndex"  begin="${index * 3 - 3}" end="${index * 3 - 1}" step="1">
                                                            <c:if test="${jndex < fn:length(blog)}">
                                                                <div class="blog">

                                                                    <div class="blog-image">
                                                                        <img src="${blog[jndex].image}" alt="Blog Image 1" style="object-fit: contain">
                                                                        <div class="date">${blog[jndex].startDate}</div>
                                                                    </div>
                                                                    <div class="blog-content">
                                                                        <h2>${blog[jndex].title}</h2>

                                                                        <p>Tác giả: ${blog[jndex].author}</p>
                                                                        <a href="/admin/blog/detail/${blog[jndex].id}">Thông tin chi tiết </a>
                                                                    </div>




                                                                </div>
                                                            </c:if>

                                                        </c:forEach>
                                                    </div>

                                                </div>

                                                </tr>

                                            </c:forEach>





                                            <tr>
                                            <div class="container">
                                                <div class="blog-row">
                                                    <div class="blog-row">
                                                        <div class="blog">
                                                            <div class="blog-image">
                                                                <img src="https://denizhalil.com/wp-content/uploads/2024/05/Creating-Ransomware-with-Python-part-1-by-denizhalil-1024x597.png" alt="Blog Image 4">
                                                                <div class="date">June 13, 2024</div>
                                                            </div>
                                                            <div class="blog-content">
                                                                <h2>Blog Post 4</h2>
                                                                <p>Etiam nec justo euismod, maximus dui in, posuere nunc. Phasellus mollis felis sed felis ullamcorper.</p>
                                                                <a href="">Thông tin chi tiết</a>
                                                            </div>
                                                        </div>
                                                        <div class="blog">
                                                            <div class="blog-image">
                                                                <img src="https://denizhalil.com/wp-content/uploads/2024/05/End-to-End-Encryption-Implementation-and-Practical-Code-1024x580.png" alt="Blog Image 5">
                                                                <div class="date">June 14, 2024</div>
                                                            </div>
                                                            <div class="blog-content">
                                                                <h2>Blog Post 5</h2>
                                                                <p>Curabitur dignissim quam a felis rhoncus, non sagittis nunc ultricies. Sed vel massa semper, egestas.</p>
                                                                <a href="#">Read More</a>
                                                            </div>
                                                        </div>
                                                        <div class="blog">
                                                            <div class="blog-image">
                                                                <img src="https://denizhalil.com/wp-content/uploads/2024/05/recommendations-for-learning-cryptography-1024x580.png" alt="Blog Image 6">
                                                                <div class="date">June 15, 2024</div>
                                                            </div>
                                                            <div class="blog-content">
                                                                <h2>Blog Post 6</h2>
                                                                <p>Donec mattis libero sit amet dui vehicula, vel suscipit nulla aliquam. Fusce in ex nec est dapibus.</p>
                                                                <a href="#">Read More</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </tr>



                                            </tbody>

                                        </table>

                                    </div>

                                </div>
                            </div>
                        </main>
                    </div>
                </c:if>


            </div>

        </c:if>



    </body>
    <script src="../../../../public/admin/js/dashboard.js"></script>
    <script src="../../../../public/admin/js/alert.js"></script>
    <script src="../../../../public/admin/js/EditCategoryDashboard.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
<!--
<div class="container">
    <div class="blog-row">
        <div class="blog">
            <div class="blog-image">
                <img src="https://denizhalil.com/wp-content/uploads/2024/05/Learning-Basic-Data-Types-in-Python-1024x580.png" alt="Blog Image 1">
                <div class="date">June 10, 2024</div>
            </div>
            <div class="blog-content">
                <h2>Blog Post 1</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel metus vel est fermentum consectetur.</p>
                <a href="#">Read More</a>
            </div>
        </div>
        <div class="blog">
            <div class="blog-image">
                <img src="https://denizhalil.com/wp-content/uploads/2024/06/what-is-linux-by-denizhalil-1024x580.png" alt="Blog Image 2">
                <div class="date">June 11, 2024</div>
            </div>
            <div class="blog-content">
                <h2>Blog Post 2</h2>
                <p>Nullam vehicula turpis in tellus lacinia euismod. Proin tristique arcu vel ullamcorper fermentum.</p>
                <a href="#">Read More</a>
            </div>
        </div>
        <div class="blog">
            <div class="blog-image">
                <img src="https://denizhalil.com/wp-content/uploads/2024/05/Anomaly-Detection-in-Cybersecurity-Using-Machine-Learning-1024x580.png" alt="Blog Image 3">
                <div class="date">June 12, 2024</div>
            </div>
            <div class="blog-content">
                <h2>Blog Post 3</h2>
                <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p>
                <a href="#">Read More</a>
            </div>
        </div>
    </div>
    <div class="blog-row">
        <div class="blog">
            <div class="blog-image">
                <img src="https://denizhalil.com/wp-content/uploads/2024/05/Creating-Ransomware-with-Python-part-1-by-denizhalil-1024x597.png" alt="Blog Image 4">
                <div class="date">June 13, 2024</div>
            </div>
            <div class="blog-content">
                <h2>Blog Post 4</h2>
                <p>Etiam nec justo euismod, maximus dui in, posuere nunc. Phasellus mollis felis sed felis ullamcorper.</p>
                <a href="#">Read More</a>
            </div>
        </div>
        <div class="blog">
            <div class="blog-image">
                <img src="https://denizhalil.com/wp-content/uploads/2024/05/End-to-End-Encryption-Implementation-and-Practical-Code-1024x580.png" alt="Blog Image 5">
                <div class="date">June 14, 2024</div>
            </div>
            <div class="blog-content">
                <h2>Blog Post 5</h2>
                <p>Curabitur dignissim quam a felis rhoncus, non sagittis nunc ultricies. Sed vel massa semper, egestas.</p>
                <a href="#">Read More</a>
            </div>
        </div>
        <div class="blog">
            <div class="blog-image">
                <img src="https://denizhalil.com/wp-content/uploads/2024/05/recommendations-for-learning-cryptography-1024x580.png" alt="Blog Image 6">
                <div class="date">June 15, 2024</div>
            </div>
            <div class="blog-content">
                <h2>Blog Post 6</h2>
                <p>Donec mattis libero sit amet dui vehicula, vel suscipit nulla aliquam. Fusce in ex nec est dapibus.</p>
                <a href="#">Read More</a>
            </div>
        </div>
    </div>
</div>-->