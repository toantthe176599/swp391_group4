
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../../public/admin/css/createUserFormCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/createEvent.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <title>Chi tiết bài viết</title>
    </head>
    <body>


        <!---tab to print html code          -->


        <!----->


        <c:if test="${fn:contains(permission, 'view_blog')}">
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

                                <main style="margin-left: 200px" >




                                    <!---titile-->
                                    <label for="title"  style="margin-top: 30px"><b><h4>Tiêu đề sự kiện: ${blog.title}  </h4></b></label>

                                    <br/>
                                    <!--- artist-->
                                    <label for="artist"  style="margin-top: 30px"><b><h4>Tác giả bài viết: ${blog.author} </h4></b></label>

                                    <br/>
                                    <!--- organizer--> 



                                    <!--desctiption-->
                                    <label for="description"  style="margin-top: 30px"><b><h4>Mô tả bài viết</h4></b></label>
                                    <div class="row">

                                        <c:out value="${blog.content}"  escapeXml="false"/>


                                    </div>
                                    <br/>



                                    <!--start date-->
                                    <label for="start_date"  style="margin-top: 30px"><b><h4>Ngày xuất bản: ${blog.startDate}</h4></b></label>


                                    <br/>


                                    <!---image demo event-->
                                    <label   style="margin-top: 20px"><b><h4>Ảnh bài viết</h4></b></label>
                                    <div > 
                                        <img  class="image-preview" src="${blog.image}" alt="alt"/>
                                    </div>











                                    <!---status event-->
                                    <div class="title" style="margin-top: 30px; margin-bottom: 30px" ><b><h4>Trạng thái bài viết: ${event.status == "active" ? "Hoạt động" : "Không hoạt động"}</h4></b></div>


                                    <a href="/admin/blog" class="btn btn-primary">Quay lại</a>

                                    <c:if test="${fn:contains(permission, 'edit_blog')}">
                                        <a href="/admin/blog/edit/form/${blog.id}" class="btn btn-success">Chỉnh sửa</a>

                                    </c:if>

                                    <c:if test="${fn:contains(permission, 'delete_blog')}">
                                        <a type="button" deleteButton  class="btn btn-danger">Xóa bài viết</a>

                                    </c:if>

                                </main>
                            </div>
                        </div>
                </div>
            </div>

            <form action="/admin/blog/delete" method="post" deleteForm>
                <input type="hidden" name="idBlog" value="${blog.id}">
            </form>         

        </c:if>


        <script >
            const deleteButton = document.querySelector("[deleteButton]")
            if (deleteButton) {
                deleteButton.addEventListener('click', () => {
                    const isConfirm = confirm("Bạn có chắc muốn xóa bài viết này không?")
                    if (isConfirm) {
                        const deleteForm = document.querySelector("[deleteForm]");
                        deleteForm.submit();
                    }
                })
            }

        </script>


        <!--- tiny mce-->

        <script src="../../../../tinymce/tinymce.min.js"></script>
        <script src="../../../../public/admin/js/tinyMceConfig.js"></script>
        <script src="../../../../public/admin/js/imageForEdit.js"></script>
        <!----->

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
