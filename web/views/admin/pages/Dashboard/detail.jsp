<%-- 
    Document   : detail
    Created on : Jul 1, 2024, 11:24:08 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../../../../public/admin/css/DashboarCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/detailDashboard.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/chartCss.css"/>
        <link rel="stylesheet" href="../../../../public/admin/css/alert.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Báo cáo chi tiết</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
//            draw f chart 
            google.charts.setOnLoadCallback(drawChart);
            google.charts.setOnLoadCallback(drawChart2);
            google.charts.setOnLoadCallback(drawChart3);
            google.charts.setOnLoadCallback(drawChart4);
            //end

            // function to draw chart
            function drawChart() {
                const listArea = [];
                listArea.push(['', '']);
            <c:forEach var="item" items="${report.listArea}">

                listArea.push([`${item.nameArea}`, ${item.originQuantityTicket}]);
            </c:forEach>

                var data = google.visualization.arrayToDataTable(listArea);

                var options = {
                    title: 'Tỷ lệ các vé',
                    is3D: true,
                };



                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));

                chart.draw(data, options);

            } // draw chart percent ticket

            function drawChart2() {
                const listArea = [];
                listArea.push(['', '']);
                let check = false;
            <c:forEach var="item" items="${report.listArea}">
                listArea.push([`${item.nameArea}`, ${item.soldTicket}]);
                if (${item.soldTicket} > 0) {
                    check = true;
                }
            </c:forEach>
                if (!check) {
                    listArea.push(["Chưa có vé nào được bán", 1])
                }

                var data = google.visualization.arrayToDataTable(listArea);

                var options = {
                    title: 'Tỷ lệ các vé đã bán được',
                    is3D: true,
                };



                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d_sold'));

                chart.draw(data, options);

            } // percent ticket sold

            function drawChart3() {
                const listArea = [];
                listArea.push(['', '']);
                let check = false;
            <c:forEach var="item" items="${report.listArea}">
                listArea.push([`${item.nameArea}`, ${item.totalMoney}]);
                if (${item.soldTicket} > 0) {
                    check = true;
                }
            </c:forEach>
                if (!check) {
                    listArea.push(["Chưa có vé nào được bán", 1])
                }

                var data = google.visualization.arrayToDataTable(listArea);

                var options = {
                    title: 'Tỷ lệ doanh thu các vé',
                    is3D: true,
                };



                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d_money'));

                chart.draw(data, options);

            } // percent total amount

            function drawChart4() {
                const listArea = [];
                listArea.push(['', '']);
                let check = false;
            <c:forEach var="item" items="${report.listArea}">
                listArea.push([`${item.nameArea}`, ${item.remainTicket}]);
                if (${item.soldTicket} > 0) {
                    check = true;
                }
            </c:forEach>
                if (!check) {
                    listArea.push(["Chưa có vé nào được bán", 1])
                }

                var data = google.visualization.arrayToDataTable(listArea);

                var options = {
                    title: 'Tỷ lệ các vé chưa bán',
                    is3D: true,
                };



                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d_remain'));

                chart.draw(data, options);

            } // percent total ticket remain
            //end

        </script>
    </head>


    <body>

        <form action="/admin/event/cancel" cancelForm method="POST">
            <input type="hidden" name="eventID" value="${report.idEvent}">
        </form>


        <aside>
            <c:import url="/views/admin/component/NavBar.jsp" />
        </aside>

        <main>
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

            <h2>Báo cáo sự kiện: ${report.nameEvent} </h2>
            <header  style="display: flex; justify-content: end; align-items: center;">

                <button type="button" class="btn btn-primary" detailBtn >Chi tiết doanh thu</button>
                <c:if test="${report.status != 'cancel'}">
                    <button type="button" class="btn btn-danger mx-1" cancelBtn >Hủy sự kiện</button>
                </c:if>

                <a href="/admin/dashboard" type="button" class="btn btn-dark">Quay lại</a>
            </header>


            <div class="grid">
                <div class="grid-item big">
                    <div style="width: 100%; height: 100%; margin-top: 10px; margin-left: 10px ">

                        Số vé đã bán: <b>${report.ticketSold} </b><br> 
                        Số vé còn lại: <b>${report.ticketLeft}</b>  <br>
                        Tổng số lượng vé: <b>${report.totalTicket}</b> <br> 
                        Tiến độ bán vé: <b>${report.percentSold}%</b> <br> 
                        <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="${report.ticketSold}" aria-valuemin="0" aria-valuemax="${report.totalTicket}" style="width: 100%; margin-top: 10px">
                            <div class="progress-bar bg-success" style="width: ${report.percentSold}%"></div>
                        </div>
                        <br>
                        Số loại vé: ${fn:length(report.listArea)} <br>
                        <!--- piechart-->
                        <div id="piechart_3d" style="width: auto; height: 200px;"></div>
                        <div id="piechart_3d_sold" style="width: auto; height: 200px;"></div>
                        <!----->



                    </div>




                </div>

                <div class="grid-item big">
                    <div style="width: 100%; height: 100%; margin-top: 10px; margin-left: 10px ">
                        <div style="width: 100%; margin-bottom: 100px">
                            Tổng doanh thu hiện tại: <b> <fmt:formatNumber value="${money.currentMoney}" type="currency" currencySymbol="₫" currencyCode="VND" /> </b><br> 
                            Tổng tiền cho nghệ sĩ: <b> <fmt:formatNumber value="${money.moneyForArtist}" type="currency" currencySymbol="₫" currencyCode="VND" /> </b>

                        </div>
                        <!---Pie chart-->
                        <div id="piechart_3d_money" style="width: auto; height: 200px;"></div>
                        <div id="piechart_3d_remain" style="width: auto; height: 200px;"></div>
                        <!----->

                    </div>

                </div>

                <c:forEach var="item" items="${report.listArea}">
                    <div class="grid-item regular">
                        <div id="app">
                            <div style="width: 250px; height: 250px; display: flex; justify-content: center; align-items: center">
                                <div class="w-4/4" style="width: 100%">
                                    <div>
                                        <div
                                            class="absolute flex h-full items-center justify-center text-center w-full"

                                            >
                                            <span class="text-base text-gray-900">${item.soldTicket}</span>
                                            <span class="pl-1 text-sm text-gray-600">/${item.originQuantityTicket} (${item.percentSole}%)</span>

                                        </div>
                                        <svg viewBox="0 0 36 36" class="circular-chart red">
                                        <path
                                            class="circle-bg"
                                            d="M18 2.0845
                                            a 15.9155 15.9155 0 0 1 0 31.831
                                            a 15.9155 15.9155 0 0 1 0 -31.831"
                                            />

                                        <path
                                            class="circle"
                                            stroke-dasharray="${item.soldTicket /item.originQuantityTicket * 100}, ${100 - (item.soldTicket /item.originQuantityTicket * 100)}"
                                            d="M18 2.0845
                                            a 15.9155 15.9155 0 0 1 0 31.831
                                            a 15.9155 15.9155 0 0 1 0 -31.831"
                                            />
                                        </svg>
                                    </div>
                                    <div class="text-center" style="width: 100%">
                                        <span class="text-gray-900">Tên: <b>${item.nameArea} </b> </span> <br>
                                        <span class="text-gray-900">Giá: <b><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" currencyCode="VND" /></b> </span> <br>
                                        <span class="text-gray-600">Đã bán: <b>${item.soldTicket}</b> </span> <br>
                                        <span class="text-gray-600">Còn: <b>${item.remainTicket}</b> </span> <br>
                                        <span class="text-gray-600">Tổng: <b>${item.originQuantityTicket}</b> </span> <br>
                                        <span class="text-gray-600">Thành tiền: <b> <fmt:formatNumber value="${item.totalMoney}" type="currency" currencySymbol="₫" currencyCode="VND" /></b> </span> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>



                <!--                <div class="grid-item tiny">7</div>
                                <div class="grid-item regular">8</div>
                                <div class="grid-item tiny">9</div>-->

            </div>
        </main>
    </body>

    <script >
        const detailBtn = document.querySelector("[detailBtn]");
        if (detailBtn) {
            detailBtn.addEventListener("click", () => {
                const idEvent = "${report.idEvent}"
                window.location.href = "/admin/dashboard/transaction/" + idEvent;
            })
        }


        const cancelBtn = document.querySelector("[cancelBtn]");
        if (cancelBtn) {
            cancelBtn.addEventListener("click", () => {
                const form = document.querySelector("[cancelForm]");
                const isConfirm = confirm('Bạn có chắc muốn hủy sự kiện này không ');
                if (isConfirm && form) {
                    form.submit()
                }
            }
            )


        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="../../../../public/admin/js/alert.js"></script>
</html>
