

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch sử giao dịch</title>
        <link rel="stylesheet" href="../../../../public/admin/css/dashBoardCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="../../../../public/admin/css/transactionCss.css"/>
    </head>
    <body>
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <c:import url="/views/admin/component/NavBar.jsp" />
            <!-- Main content -->
            <c:if test="${fn:contains(permission, 'view_ticket')}">
                <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                    <!-- Header -->
                    <header class="bg-surface-primary border-bottom pt-6">
                        <div class="container-fluid">
                            <div class="mb-npx">
                                <div class="row align-items-center">
                                    <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                        <!-- Title -->
                                        <h1 class="h2 mb-0 ls-tight">Lịch sử giao dich</h1>
                                    </div>
                                    <!-- Actions -->
                                    <div class="col-sm-6 col-12 text-sm-end">
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
                                <div class="card-header">

                                </div>
                                <div class="table-responsive">
                                    <div class="content">

                                        <div class="content2">
                                            <div class="online_orders shadow">
                                                <div class="online_orders_1">Số giao dịch</div>
                                                <div class="online_orders_2">232</div>
                                            </div>
                                            <div class="amount_recieved shadow">
                                                <div class="amount_recieved_1">Tổng tiền hiện tại</div>
                                                <div class="amount_recieved_2"> 2,392,312.19 đ</div>
                                            </div>
                                        </div>

                                        <div class="shadowforlastbox">
                                            <div class="content4">


                                            </div>
                                            <div class="content5">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>Order ID</th>
                                                            <th>Ngày giao dịch</th>
                                                            <th>Tổng số tiền</th>
                                                            <th>Phí giao dịch</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>
                                                        <tr>
                                                            <td>#281209</td>
                                                            <td>7 July, 2023</td>
                                                            <td>&#8377;1,278.23</td>
                                                            <td>&#8377;22</td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="content6">
                                                <div class="content6_1">

                                                    <div class="content6_1_2">Trước</div>
                                                </div>
                                                <div class="content6_2">
                                                    <div class="content6_2_1 pageno">1</div>
                                                    <div class="content6_2_2 pageno">...</div>
                                                    <div class="content6_2_3 pageno">10</div>
                                                    <div class="content6_2_4 pageno">11</div>
                                                    <div class="content6_2_5 pageno">12</div>
                                                    <div class="content6_2_6 pageno">13</div>
                                                    <div class="content6_2_7 pageno">14</div>
                                                    <div class="content6_2_8 pageno">15</div>
                                                    <div class="content6_2_9 pageno">16</div>
                                                    <div class="content6_2_10 pageno">17</div>
                                                </div>
                                                <div class="content6_3">
                                                    <div class="content6_3_1">Sau</div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>



                            </div>
                        </div>
                    </main>
                </div>
            </c:if>




        </div>
    </body>
</html>
