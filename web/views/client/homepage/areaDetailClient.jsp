<%-- 
    Document   : bookingg
    Created on : Jun 23, 2024, 5:52:38 PM
    Author     : linhl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/font-awesome.css">

        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/owl-carousel.css">

        <!-- Tooplate ArtXibition CSS -->
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/your-stylesheet.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/client/homepage/assets/css/tooplate-artxibition.css">

        <style>
            /*            .body {
                            margin: 0px;
                            font-family: Inter, sans-serif;
                            font-weight: normal;
                            color: rgb(42, 45, 52);
                            min-height: 100%;
                            font-size: 14px;
                            overflow: auto;
                            scroll-behavior: smooth;
                        }*/
            .ddCPns {
                width: 100%;
                min-height: 100vh;
                background: rgb(0, 0, 0);
            }
            .kFFfPJ {
                display: block;
            }
            .RLbgM {
                width: 100%;
                display: flex;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                background-color: rgb(45, 194, 117);
                height: 76px;
            }
            .doqHEz main {
                margin-top: 0px;
            }

            .hSHggk {
                margin-left: 0px;
            }
            .jBnkIM {
                width: 100%;
                height: 100%;
                background-color: rgb(0, 0, 0);
            }
            .gFuuNu {
                background-color: rgb(0, 0, 0);
                padding-top: 0px;
            }
            .cXzMqO {
                width: 100%;
            }
            .cXzMqO > div {
                background-color: transparent;
            }
            .hKYqsl {
                margin-left: auto;
                margin-right: auto;
                background: rgb(39, 39, 42);
                width: 100% ;
                max-width: 100%;
            }

            .exyvQo {
                display: flex;
                -webkit-box-pack: justify;
                justify-content: space-between;
                column-gap: 1rem;
            }

            .iNxlIv {
                -webkit-box-flex: 1;
                flex-grow: 1;
                margin-bottom: 1rem;
            }

            .fPXhbA .titlepage {
                text-align: left;
                font-weight: bold;
                font-size: 18px;
                line-height: 24px;
                padding-left: 2rem;
                margin-bottom: 32px;
                padding-top: 16px;
                position: relative;
                color: rgb(45, 194, 117);
                cursor: pointer;
            }

            .fUGDeE {
                font-style: normal;
                font-weight: bold;
                font-size: 16px;
                line-height: 24px;
                text-align: center;
                margin-bottom: 32px;
                padding-top: 16px;
                position: relative;
                color: rgb(45, 194, 117);
                padding-left: 1.2rem;
            }
            .fUGDeE .icon {
                cursor: pointer;
                position: absolute;
                left: 0.75rem;
                display: flex;
                gap: 0.5rem;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                flex-direction: row;
            }
            .fUGDeE .icon {
                cursor: pointer;
                position: absolute;
                left: 0.75rem;
                display: flex;
                gap: 0.5rem;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                flex-direction: row;
            }
            .fPXhbA .titlepage .back {
                left: 0px;
                top: 28px;
            }
            .fUGDeE .icon svg path {
                stroke: white;
            }
            .fUGDeE .content {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                cursor: default;
            }
            .tbox-container {
                box-sizing: border-box;
                position: relative;
                margin-left: auto;
                margin-right: auto;
                max-width: 100vw;
                padding-left: 12px;
                padding-right: 12px;
            }

            .tbox-row {
                display: flex;
                flex-wrap: wrap;
                -webkit-box-flex: 0;
                flex-grow: 0;
                flex-shrink: 0;
                margin-left: -12px;
                margin-right: -12px;
            }
            .tbox-col-lg-2 {
                flex: 0 0 16.6667%;
                max-width: 16.6667%;
                padding-left: 12px;
                padding-right: 12px;
            }
            .tbox-col-lg-8 {
                flex: 0 0 66.6667%;
                max-width: 66.6667%;
                padding-left: 12px;
                padding-right: 12px;
            }
            .tbox-col-lg-4 {
                flex: 0 0 33.3333%;
                max-width: 33.3333%;
                padding-left: 12px;
                padding-right: 12px;
            }
            .tbox-col-md-9 {
                flex: 0 0 75%;
                max-width: 75%;
                padding-left: 12px;
                padding-right: 12px;
            }
            .tbox-col-md-3 {
                flex: 0 0 25%;
                max-width: 25%;
                padding-left: 12px;
                padding-right: 12px;
            }
            .fPXhbA .header-with-border {
                padding: 10px 0px;
            }
            .bViphM {
                font-size: 16px;
                color: rgb(255, 255, 255);
                font-weight: 700;
            }

            .fPXhbA .text-right {
                text-align: right;
            }
            .fPXhbA .row-default {
                padding: 20px 0px;
                border-bottom: 1px dashed rgb(128, 128, 137);
                display: flex;
            }
            .jlYsqu {
                color: rgb(45, 194, 117);
                font-weight: 700;
            }
            .fYSkyu {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }
            .fPXhbA .text-right {
                text-align: right;
            }
            .dMsBvl {
                color: rgb(255, 255, 255);
            }
            .fPXhbA .flex-end {
                display: flex;
                -webkit-box-pack: end;
                justify-content: flex-end;
            }
            .jpnUwK {
                display: flex;
                gap: 0.2rem;
            }
            .jpnUwK button:disabled {
                border: 1px solid rgba(0, 0, 0, 0.05);
                background: rgb(245, 245, 250);
                padding: 5px 11px;
            }
            .jpnUwK button {
                border-radius: 4px;
                color: rgb(45, 194, 117);
                border-color: rgb(45, 194, 117);
            }
            .ant-input {
                box-sizing: border-box;
                margin: 0;
                padding: 5px 11px;
                color: rgba(0, 0, 0, 0.88);
                font-size: 14px;
                line-height: 1.5714285714285714;
                list-style: none;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
                position: relative;
                display: inline-block;
                width: 100%;
                min-width: 0;
                background-color: #ffffff;
                background-image: none;
                border-width: 1px;
                border-style: solid;
                border-color: #d9d9d9;
                border-radius: 6px;
                transition: all 0.2s;
            }
            .ant-btn-default{
                padding: 5px 11px;
            }
            .fZdXpk {
                background: rgb(56, 56, 61);
                transition: all 500ms ease 0s;
                min-height: calc(-76px + 100vh);
                height: 100%;
                position: relative;
            }
            .kDlekG .event-info {
                color: rgb(255, 255, 255);
                font-weight: 500;
                font-size: 12px;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
            }
            .dsoGkb {
                display: flex;
            }
            .kDlekG .event-info svg {
                width: 24px;
                height: 24px;
                margin-right: 5px;
            }
            .kDlekG svg > path {
                fill: rgb(45, 194, 117);
            }
            .ant-spin-nested-loading .ant-spin-container::after {
                position: absolute;
                top: 0;
                inset-inline-end: 0;
                bottom: 0;
                inset-inline-start: 0;
                z-index: 10;
                width: 100%;
                height: 100%;
                background: #ffffff;
                opacity: 0;
                transition: all 0.3s;
                content: "";
                pointer-events: none;
            }
            .fZdXpk .tkb-divider {
                margin: 12px auto;
                border-block-start: 1px solid rgb(81, 81, 88) !important;
            }
            .kDlekG {
                color: rgb(255, 255, 255);
                padding: 0px 0.75rem;
                width: 100%;
            }
            .ant-list {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                color: rgba(0, 0, 0, 0.88);
                font-size: 14px;
                line-height: 1.5714285714285714;
                list-style: none;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
                position: relative;
            }
            .kDlekG .ant-list-header {
                border-block-end: transparent;
            }
            .kDlekG .ticket-price-title {
                color: rgb(255, 255, 255);
                font-weight: 600;
            }
            .ant-spin-nested-loading .ant-spin-container {
                position: relative;
                transition: opacity 0.3s;
            }
            .bnnWSE {
                transition: all 500ms ease 0s;
                background: rgb(39, 39, 42);
                position: sticky;
                top: calc(-110px + 100vh);
                width: 100%;
                padding: 0.75rem 0px;
            }

            .kDlekG .bottomBooking {
                margin: 0.75rem 0px;
            }
            .bnnWSE button {
                width: 100%;
            }
            .iGFdLx {
                flex: 0 0 30%;
                max-width: 25rem;
            }
            .bibYBG {
                display: flex;
                gap: 0.5rem;
                justify-content: flex-start;
                align-items: center;
                padding: 0.75rem;
                height: auto; /* Đặt chiều cao tự động để chứa nội dung */
                overflow: hidden;
                background: rgb(39, 39, 42);
            }
            .bibYBG > div {
                font-weight: 700;
                font-size: 20px;
                color: rgb(255, 255, 255);
                width: 100%;
                overflow: hidden;
                white-space: normal; /* Cho phép xuống dòng */
                word-wrap: break-word; /* Cho phép xuống dòng khi cần thiết */
                line-height: 30px;
                height: auto; /* Đặt chiều cao tự động để chứa nội dung */
            }
            :where(.css-nnuwmp).ant-spin-nested-loading .ant-spin-container {
                position: relative;
                transition: opacity 0.3s;
            }

            .kDlekG .ant-list-items {
                height: 8vh;
                overflow-y: auto;
            }
            :where(.css-nnuwmp).ant-list .ant-list-items {
                margin: 0;
                padding: 0;
                list-style: none;
            }
            .kDlekG .ticket-price-title {
                color: rgb(255, 255, 255);
                font-weight: 600;
            }
            :where(.css-nnuwmp).ant-list .ant-list-header, :where(.css-nnuwmp).ant-list .ant-list-footer {
                padding-block: 12px;
            }
            .tbox-my-8 {
                margin: 8px 0px;
            }
            .kDlekG .tag-name {
                color: rgb(255, 255, 255);
                font-weight: 500;
                font-size: 12px;
            }
            .kDlekG .none-border, .kDlekG .ant-list-header {
                border-block-end: transparent;
            }
            .fZdXpk .tbox-p-0 {
                padding: 0px !important;
            }
            :where(.css-nnuwmp).ant-space-align-center {
                align-items: center;
            }
            .kDlekG .ticket-price {
                font-weight: 600;
                font-size: 12px;
                color: rgb(45, 194, 117);
            }
            .bcYVSM {
                color: rgb(255, 255, 255);
                gap: 0.5rem;
                padding: 0.5rem 0px 0px;
                min-height: 1.25rem;
                height: auto;
            }
            .bcYVSM svg > path {
                fill: rgb(255, 255, 255);
            }
            .bcYVSM .ticket-info-text {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .ant-list .ant-list-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 12px 0;
                color: rgba(0, 0, 0, 0.88);
            }
            .iNUmHz {
                display: flex;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                gap: 0.5rem;
                width: 100%;
                padding-block: 0.6rem;
                border-radius: 0.25rem;
                color: rgb(128, 128, 137);
                font-size: 1em;
                font-weight: bold;
                transition: background-color 0.4s ease-in-out 0s;
                cursor: not-allowed;
                background-color: rgb(221, 221, 227);
            }
            .iNUmHz:disabled {
                background-color: #CCCCCC;
                cursor: not-allowed;
            }

            .iNUmHz svg > path {
                fill: rgb(128, 128, 137) !important;
            }
            .quantityInput {
                min-width: 40px;
                max-width: 50px;
                text-align: center;
            }
            .fPXhbA .tag {
                padding: 4px 8px;
                border-radius: 12px;
                text-align: center;
                font-size: 14px;
                align-self: center;
            }
            .number-ticket-container {
                display: flex;
                justify-content: flex-end;
                margin-top: 8px;
                width: 100%;
            }

            .number-ticket {
                display: block;
                color: white !important;

            }

            .btn-success {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 0.5rem;
                width: 100%;
                padding-block: 0.6rem;
                border-radius: 0.25rem;
                color: rgb(255, 255, 255);
                font-size: 1em;
                font-weight: bold;
                transition: background-color 0.4s ease-in-out 0s;
                background-color: rgb(45, 194, 117);
            }
            .iNUmHz .buttomBooking {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 0.5rem;
                width: 100%;
                padding-block: 0.6rem;
                border-radius: 0.25rem;
                color: rgb(128, 128, 137);
                font-size: 1em;
                font-weight: bold;
                transition: background-color 0.4s ease-in-out 0s;
                cursor: not-allowed;
                background-color: rgb(221, 221, 227);
            }
            .btn-success svg > path {
                fill: rgb(255, 255, 255) !important;
            }
            .iNUmHz .buttomBooking svg > path{
                fill: rgb(128, 128, 137) !important;
            }

        </style>
        <script>
            // Khởi tạo biến đếm số lượng vé và tổng giá tiền
            let totalPrice = 0;
            function increaseQuantity(price, quantityMax, ele) {
                let quantity = document.querySelector("#" + ele).value;
                quantity++;
                if (quantity > quantityMax) {
                    quantity = quantityMax;
                    alert("Số vé vượt quá giới hạn");
                    return;
                }
                document.querySelector("#" + ele).value = quantity;
                totalPrice += price;
                let chooseTicketButton = document.getElementById('chooseTicketButton');
                chooseTicketButton.textContent = 'Tiếp tục - ' + totalPrice + ' VNĐ';
                chooseTicketButton.disabled = false;
                chooseTicketButton.classList.add('btn-success');
                chooseTicketButton.classList.remove('iNUmHz .buttomBooking'); // Xóa lớp màu xám

            }

            // Hàm giảm số lượng vé và cập nhật tổng giá tiền
            function decreaseQuantity(price, ele) {
                let quantity = document.querySelector("#" + ele).value;
                if (quantity > 0) {
                    quantity--;
                    totalPrice -= price; // Trừ đi giá tiền
                    document.querySelector("#" + ele).value = quantity;
                    // Cập nhật nội dung của button
                    let chooseTicketButton = document.getElementById('chooseTicketButton');
                    if (quantity === 0) {
                        chooseTicketButton.innerHTML = `
                            Vui lòng chọn vé  
                            <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="disable">
                            <path d="M8.207 5.293a1 1 0 00-1.414 1.414L12.086 12l-5.293 5.293a1 1 0 101.414 1.414l6-6a1 1 0 000-1.414l-6-6z" fill="#fff"></path>
                            <path d="M13.207 5.293a1 1 0 10-1.414 1.414L17.086 12l-5.293 5.293a1 1 0 001.414 1.414l6-6a1 1 0 000-1.414l-6-6z" fill="#fff"></path>
                            </svg>
                                                                `;
                        chooseTicketButton.disabled = true;
                        chooseTicketButton.classList.remove('btn-success'); // Xóa lớp màu xanh lá cây
                        chooseTicketButton.classList.add('iNUmHz .buttomBooking'); // Thêm lại lớp màu xám
                        // Ẩn div flex-end khi số lượng vé bằng 0
                        document.getElementById('flexEndDiv').style.display = 'none';
                    } else {
                        chooseTicketButton.textContent = 'Tiếp tục - ' + totalPrice + ' VNĐ';
                        chooseTicketButton.classList.add('btn-success'); // Thêm lớp màu xanh lá cây
                        chooseTicketButton.classList.remove('iNUmHz .buttomBooking'); // Xóa lớp màu xám

                        // Hiển thị lại div flex-end khi số lượng vé lớn hơn 0
                        document.getElementById('flexEndDiv').style.display = 'block';
                    }
                }
            }
        </script>

    </head>
    <body>

        <c:set var="event" value="${requestScope.event}" />
        <c:set var="area" value="${requestScope.area}" />

        <div class="header-wrapper">
            <jsp:include page="../component/Header.jsp" />
        </div>

        <div class="slug_WrapperEventDetail-sc-1hbmhht-0 doqHEz">
            <div class="Container-FlexColumn-sc-17x1kk6-3 Layout_Wrapper-sc-1x9m3gv-0 ddiJGM ddCPns">
                <div class="Header_Wrapper-sc-qhadgg-1-kFFfPJ">
                    <div id="header-main-wrapper" class="Header_HeaderMainWrapper-sc-qhadgg-0 RLbgM">
                        <header class="style_Wrapper-sc-at0dtu-0 bojxnz">
                            <a href="" title="BookNow" class="style_LinkLogo-sc-at0dtu fiRKiJ">
                                <img>
                            </a>

                        </header>  
                    </div>  
                </div>
                <main class="Layout__Main-sc-1x9m3gv-1 hSHggk">
                    <div class="styles__StyledContainer-sc-17nwz24-0 jBnkIM">
                        <div class="styles__StyledContent-sc-17nwz24-2 gFuuNu">
                            <div class="style__Wrapper-sc-1dph1oz-2 cXzMqO">
                                <div class="Container-sc-17x1kk6-0 hKYqsl">
                                    <form id="ticketForm" action="checkout" method="post">
                                        <div class="style__Content-sc-1dph1oz-3 exyvQo">
                                            <div class="style__LeftCol-sc-1dph1oz-0 iNxlIv">
                                                <div class="styles__TicketTypeWrapper-sc-17mbses-0 fPXhbA">
                                                    <div class="titlepage">
                                                        <div class="BackPage__Title-sc-1axrga4-0 fUGDeE">
                                                            <div class="icon">
                                                                <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" class="back">
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M8.707 3.793a1 1 0 010 1.414L4.414 9.5H18a1 1 0 110 2H4.414l4.293 4.293a1 1 0 11-1.414 1.414l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 0z" fill="#fff"></path>
                                                                </svg>Trở về</div>
                                                            <div class="content">Chọn vé</div>  
                                                        </div>
                                                    </div>
                                                    <div class="tbox-container">
                                                        <div class="tbox-row">
                                                            <div class="tbox-col-lg-2 "></div>
                                                            <div class="tbox-col-md-12 tbox-col-lg-8 ">
                                                                <div class="tbox-container">
                                                                    <div class="tbox-row header-with-border">
                                                                        <div class="tbox-col-lg-8 ">
                                                                            <article class="ant-typography styles__Text-sc-17nwz24-3 bViphM css-euj9ji" color="white" weight="700">Loại vé</article>
                                                                        </div>
                                                                        <div class="tbox-col-lg-4 text-right">
                                                                            <article class="ant-typography styles__Text-sc-17nwz24-3 bViphM css-euj9ji" color="white" weight="700">Số lượng</article>
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="eventId" value="${event.id}">
                                                                    <c:forEach var="item" items="${area}" varStatus="loop" >
                                                                        <div class="tbox-row row-default">
                                                                            <div class="tbox-col-sm-7 tbox-col-md-9 ">
                                                                                <article class="ant-typography styles__Text-sc-17nwz24-3 jlYsqu css-euj9ji" color="mainGreen" weight="700">${item.nameArea}:</article>
                                                                                <article class="ant-typography styles__Text-sc-17nwz24-3 dMsBvl css-euj9ji" color="white">${item.price}</article>
                                                                            </div>
                                                                            <div class="tbox-col-sm-5 tbox-col-md-3 text-right flex-end" id="flexEndDiv">
                                                                                <div class="Container__AlignItemsCenter-sc-17x1kk6-4 styles__QuantityInputWrapper-sc-soyhxv-0 fYSkyu jpnUwK" id="quantityInputWrapper-${loop.index}">
                                                                                    <button type="button" class="ant-btn css-euj9ji ant-btn-default" id="minusButton-${loop.index}" onclick="decreaseQuantity(${item.price}, 'quantityInput-${loop.index}')">
                                                                                        <span>-</span>
                                                                                    </button>
                                                                                    <input min="0" max="${item.quantityTicketCurrent}" name="quantityInput-${loop.index}" readonly class="ant-input css-euj9ji" type="text" value="0" class="quantityInput" id="quantityInput-${loop.index}" style="min-width: 40px; max-width: 50px; text-align: center;">
                                                                                    <button type="button" class="ant-btn css-euj9ji ant-btn-default" id="plusButton-${loop.index}" onclick="increaseQuantity(${item.price}, ${item.quantityTicketCurrent}, 'quantityInput-${loop.index}')">
                                                                                        <span>+</span>
                                                                                    </button> 
                                                                                </div>

                                                                            </div>  
                                                                            <input type="hidden" name="ticketId-${loop.index}" value="${item.id}">
                                                                            <div class="number-ticket-container" id="chooseTicketText_${loop.index}">
                                                                                <a class="number-ticket">Số vé còn lại: ${item.quantityTicketCurrent}</a>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                    <div class="tbox-row row-default">
                                                                        <!--                                                                        <div class="tbox-col-sm-7 tbox-col-md-9 ">
                                                                                                                                                    <article class="ant-typography styles__Text-sc-17nwz24-3 jlYsqu css-euj9ji" color="mainGreen" weight="700">Gọi Mưa</article>
                                                                                                                                                    <article class="ant-typography styles__Text-sc-17nwz24-3 dMsBvl css-euj9ji" color="white">1.000.000 đ</article>
                                                                                                                                                </div>-->
                                                                        <!--                                                                        <div class="tbox-col-sm-5 tbox-col-md-3 text-right flex-end">
                                                                                                                                                    <div class="tag" style="color: rgb(255, 66, 79); background-color: rgb(255, 184, 188); border-radius: 12px; padding: 4px 8px;">Hết vé</div>
                                                                                                                                                </div>  -->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbox-col-lg-2 "></div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                            <div class="style__RightCol-sc-1dph1oz-1 iGFdLx">
                                                <div class="styles__Wrapper-sc-10vn60z-0 fZdXpk">
                                                    <div class="styles__TitleWrapper-sc-10vn60z-1 bibYBG">
                                                        <div>${event.name}</div>
                                                    </div>
                                                    <div class="styles__ContentWrapper-sc-10vn60z-2 kDlekG">
                                                        <div class="ant-list ant-list-split css-nnuwmp">
                                                            <div class="ant-spin-nested-loading css-nnuwmp">
                                                                <div class="ant-spin-container">
                                                                    <li class="ant-list-item none-border">
                                                                        <div class="Container__Flex-sc-17x1kk6-2 dsoGkb event-info">
                                                                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                            <path d="M4.333.333C4.702.333 5 .632 5 1v.667h4V1a.667.667 0 011.333 0v.667H11a2.667 2.667 0 012.667 2.667v1.333H.333V4.334A2.667 2.667 0 013 1.667h.667V1c0-.368.298-.667.666-.667zM13.667 7H.333v5.334c0 .736.597 1.333 1.334 1.333h10.666c.737 0 1.334-.597 1.334-1.333V7z" fill="#fff"></path>
                                                                            </svg>
                                                                            <!-- Chuyển đổi chuỗi thành đối tượng Date -->
                                                                            <fmt:parseDate var="parsedDate" value="${event.startDate}" pattern="yyyy-MM-dd" />

                                                                            <!-- Định dạng đối tượng Date thành chuỗi mới -->
                                                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" var="formattedDate" />

                                                                            <fmt:parseDate var="parsedTime" value="${event.startTime}" pattern="HH:mm:ss" />

                                                                            <!-- Định dạng đối tượng Date thành chuỗi mới -->
                                                                            <fmt:formatDate value="${parsedTime}" pattern="HH:mm" var="formattedTime" />
                                                                            <span>${formattedTime}, ${formattedDate}</span>
                                                                        </div>
                                                                    </li>
                                                                    <li class="ant-list-item none-border">
                                                                        <div class="Container__Flex-sc-17x1kk6-2 dsoGkb event-info">
                                                                            <svg width="22" height="28" viewBox="0 0 22 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4.031 3.307a10.514 10.514 0 0113.937 0c4.485 3.945 4.955 10.854 1.058 15.392l-7.015 8.17a1.333 1.333 0 01-2.023 0l-7.015-8.17C-.923 14.161-.454 7.252 4.031 3.307zM11 14.667A3.333 3.333 0 1011 8a3.333 3.333 0 000 6.666z" fill="#000"></path>
                                                                            </svg>
                                                                            <span>${event.destination}</span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ant-divider css-nnuwmp ant-divider-horizontal tkb-divider " role="separator"></div>
                                                    <div class="styles__ContentWrapper-sc-10vn60z-2 kDlekG"><div class="ant-list ant-list-split css-nnuwmp">
                                                            <div class="ant-list-header">
                                                                <div class="ticket-price-title">Giá vé</div>

                                                            </div>
                                                            <div class="ant-spin-nested-loading css-nnuwmp">
                                                                <div class="ant-spin-container">
                                                                    <c:forEach var="item" items="${area}">
                                                                        <ul class="ant-list-items">
                                                                            <li class="ant-list-item none-border tbox-p-0 tbox-my-8">
                                                                                <div class="ant-space css-nnuwmp ant-space-horizontal ant-space-align-center" style="gap: 4px 0px;">
                                                                                    <div class="ant-space-item" style=""></div>
                                                                                    <div class="ant-space-item">
                                                                                        <div class="tag-name">${item.nameArea}: </div>

                                                                                    </div>

                                                                                </div>
                                                                                <div class="ticket-price">${item.price} VNĐ</div>
                                                                            </li>                                                      
                                                                        </ul>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="styles__BottomWrapper-sc-10vn60z-3 bnnWSE bottomBooking">
                                                        <div class="styles__ContentWrapper-sc-10vn60z-2 kDlekG">
                                                            <div class="Container__AlignItemsCenter-sc-17x1kk6-4 BottomBooking__TicketWraper-sc-fn1azy-0 fYSkyu bcYVSM">

                                                                <!-- Nội dung sẽ thay đổi -->
                                                                <button id="chooseTicketButton" class="style__ContinueBtnWrapper-sc-1n85n6l-11 iNUmHz bottomBooking" disabled="">
                                                                    Vui lòng chọn vé  
                                                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="disable">
                                                                    <path d="M8.207 5.293a1 1 0 00-1.414 1.414L12.086 12l-5.293 5.293a1 1 0 101.414 1.414l6-6a1 1 0 000-1.414l-6-6z" fill="#fff"></path>
                                                                    <path d="M13.207 5.293a1 1 0 10-1.414 1.414L17.086 12l-5.293 5.293a1 1 0 001.414 1.414l6-6a1 1 0 000-1.414l-6-6z" fill="#fff"></path>
                                                                    </svg>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

                                                                            <jsp:include page="../component/Footer.jsp" />

        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
