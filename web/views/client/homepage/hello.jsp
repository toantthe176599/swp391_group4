<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            .container{
                display: flex;
                flex-direction: column;
                width: 100%;
                min-height: 100vh;
                background: rgb(245, 247, 252);
            }
            .iVXoTn{
                line-height: 1.15;
                text-size-adjust: 100%;
                font-family: Inter, sans-serif;
                font-weight: normal;
                font-size: 14px;
                box-sizing: border-box;
                width: 100%;
                height: max-content;
                padding-block: 2rem;
                padding-inline: 1rem;
                background: linear-gradient(rgb(39, 39, 42) 48.04%, rgb(0, 0, 0) 100%);
                color: rgb(255, 255, 255);
            }
            .iVXoTn .content {
                width: 100%;
                height: 100%;
                padding: 0px;
                color: white;
                border-radius: 1.5rem;
                background: linear-gradient(rgb(39, 39, 42) 48.04%, rgb(0, 0, 0) 100%);
                overflow: hidden;
                display: flex;
            }
            .iVXoTn .content .text-wrapper {
                flex: 1 1 0%;
                background-color: rgb(56, 56, 61);
                position: relative;
                padding: 1.875rem;
            }
            .iVXoTn .content .text-wrapper #circle1 {
                top: 0px;
                right: 0px;
                transform: translate(1.875rem, -1.875rem);
                background-color: rgb(39, 39, 42);
                position: absolute;
                width: 50px;
                height: 50px;
                border-radius: 50%;
            }
            .iVXoTn .content .text-wrapper #circle2 {
                bottom: 0px;
                right: 0px;
                transform: translate(1.875rem, 1.875rem);
                background-color: rgb(2, 2, 3);
                position: absolute;
                width: 50px;
                height: 50px;
                border-radius: 50%;
            }
            .iVXoTn .content .text-wrapper #vertical-dashed {
                position: absolute;
                right: 0px;
                bottom: -8px;
                z-index: 10;
                transform: translate(2px, -2rem);

            }
            .iVXoTn .content .text-wrapper #vertical-dashed-2 {
                position: absolute;
                right: 0px;
                top: 100%;
                z-index: 10;
                transform: translate(2px, 2rem);

            }
            .iVXoTn .content .text-wrapper .text {
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                -webkit-box-pack: justify;
                justify-content: space-between;
            }
            .iVXoTn .content .text-wrapper .text .info {
                display: flex;
                flex-direction: column;
                -webkit-box-pack: center;
                justify-content: center;
                overflow: hidden;
            }
            .iVXoTn .content .text-wrapper .text .info #title {
                font-size: 16px;
                overflow: hidden;
                word-break: break-word;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 3;
            }
            .iVXoTn .content .text-wrapper .text .info #date {
                margin-top: 1rem;
            }
            .iVXoTn .content .text-wrapper .text .info #date #date-text {
                text-transform: capitalize;
                padding-left: 0.5rem;
            }
            .iVXoTn .content .text-wrapper .text .info #venue {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                margin-top: 1rem;
            }
            .iVXoTn .content .text-wrapper .text .info #location-icon {
                transform: scale(0.65) translateX(-0.4rem);
            }
            .iVXoTn .content .text-wrapper .text .info span {
                color: rgb(45, 194, 117);
                font-weight: bold;
            }
            .iVXoTn .content .text-wrapper .text .info #address {
                font-size: 0.8em;
                color: rgb(196, 196, 207);
                margin-left: 1.5rem;
            }
            .iVXoTn .content .text-wrapper .text .price {
                border-top: 1px solid rgb(196, 196, 207);
            }
            .iVXoTn .content .text-wrapper .text .price #ticket-price {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                gap: 0.5rem;
                padding-block: 1rem;
                font-size: 16px;
                font-weight: bold;
            }
            .iVXoTn .content .text-wrapper .text .price #ticket-price #price-value {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                gap: 0.5rem;
                color: rgb(45, 194, 117);
            }
            .iVXoTn .content .text-wrapper .text .price #ticket-price #price-value svg {
                margin-left: 0.5rem;
            }
            .bHHstD {
                width: 100%;
                padding-block: 0.5rem;
                border-radius: 0.25rem;
                font-weight: bold;
                transition: background-color 0.4s ease-in-out 0s;
                color: rgb(255, 255, 255);
                background-color: rgb(45, 194, 117);
            }
            .iVXoTn .content .img-wrapper {
                flex: 2 0 0%;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                overflow: hidden;
                background: linear-gradient(rgb(39, 39, 42) 48.04%, rgb(0, 0, 0) 100%);
            }
            .iVXoTn .content .img-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center center;
            }

            .eYXroU {
                border-radius: 12px;
                margin-top: 25px;
                padding: 0px 1rem;
                background-color: rgb(255, 255, 255);
                overflow: hidden;
            }
            .eYXroU #title {
                padding: 0.75rem 0px;
                border-bottom: 1px solid rgb(235, 235, 240);
            }
            .eYXroU #content {
                padding: 0.75rem 0px;
                margin-top: 24px;
            }
            
            
            .bHHstD {
    width: 100%;
    padding-block: 0.5rem;
    border-radius: 0.25rem;
    font-weight: bold;
    transition: background-color 0.4s ease-in-out 0s;
    color: rgb(255, 255, 255);
    background-color: rgb(45, 194, 117);
}
button {
    background-color: transparent;
    color: inherit;
    border-width: 0px;
    padding: 0px;
    cursor: pointer;
}
button, [type="button"], [type="reset"], [type="submit"] {
    appearance: button;
}
button, select {
    text-transform: none;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    font-family: inherit;
    font-size: 100%;
    line-height: 1.15;
    margin: 0px;
}
            
            
            
            
        </style>
        
    </head>
    <body>
        <div class="container">
            <div id="banner" class="style__BannerWrapper-sc-56ar6x-0 iVXoTn">
                <div class="tbox-container content desktop">
                    <div class="text-wrapper">
                        <div id="circle1" class="circle"></div>
                        <div id="circle2" class="circle"></div>
                        <svg width="4" height="415" viewBox="0 0 4 415" fill="none" xmlns="http://www.w3.org/2000/svg" id="vertical-dashed"><path stroke="#27272A" stroke-width="4" stroke-linecap="round" stroke-dasharray="4 10" d="M2 2v411"></path></svg>
                        <svg width="4" height="415" viewBox="0 0 4 415" fill="none" xmlns="http://www.w3.org/2000/svg" id="vertical-dashed-2"><path stroke="#27272A" stroke-width="4" stroke-linecap="round" stroke-dasharray="4 10" d="M2 2v411"></path></svg>
                        <div class="text">
                            <div class="info">
                                <p id="title">
                                    <strong>[HCM] TRUNG QUÂN  1689 - More than 1589</strong>
                                </p>
                                <p id="date">
                                    <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="icon">
                                    <path d="M4.333.333C4.702.333 5 .632 5 1v.667h4V1a.667.667 0 011.333 0v.667H11a2.667 2.667 0 012.667 2.667v1.333H.333V4.334A2.667 2.667 0 013 1.667h.667V1c0-.368.298-.667.666-.667zM13.667 7H.333v5.334c0 .736.597 1.333 1.334 1.333h10.666c.737 0 1.334-.597 1.334-1.333V7z" fill="#fff"></path>
                                    </svg>
                                    <span id="date-text">19:00 - 22:00, 13 tháng 07, 2024</span></p>
                                <p id="venue"><svg width="22" height="28" viewBox="0 0 22 28" fill="none" xmlns="http://www.w3.org/2000/svg" id="location-icon" class="icon">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M4.031 3.307a10.514 10.514 0 0113.937 0c4.485 3.945 4.955 10.854 1.058 15.392l-7.015 8.17a1.333 1.333 0 01-2.023 0l-7.015-8.17C-.923 14.161-.454 7.252 4.031 3.307zM11 14.667A3.333 3.333 0 1011 8a3.333 3.333 0 000 6.666z" fill="#000"></path>

                                    </svg>
                                    <span class="venue-text">Nhà thi đấu Phú Thọ</span></p>
                                <p id="address">01 Lữ Gia, Phường 15, Quận 11, Thành Phố Hồ Chí Minh</p>
                            </div>
                            <div class="price">
                                <div id="ticket-price">
                                    <span>Giá từ</span>
                                    <a href="#ticket-info" id="price-value">
                                        <span>1.000.000 đ</span>
                                        <svg width="8" height="14" viewBox="0 0 8 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.293.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L5.586 7 .293 1.707a1 1 0 010-1.414z" fill="#2DC275"></path></svg>
                                    </a>
                                </div>
                                <a href="">
                                    <button id="buynow-btn" class="style__BuynowBtn-sc-56ar6x-1 bHHstD" fdprocessedid="5iuped">Mua vé ngay</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="img-wrapper">
                        <img src="https://salt.tkbcdn.com/ts/ds/bb/e2/49/34560b519e0293e77d1b16bbaaefcf1c.jpg" alt="Banner cover">
                    </div>
                </div>

            </div>
            <div class="style__Wrapper-sc-12c1ml7-0 eYXroU"><h4 id="title" class="style__Title-sc-12c1ml7-1 kYOHji">Giới thiệu</h4><div id="content" class="style__Content-sc-12c1ml7-2 digqDr"><div class="style__WrapperIntro-sc-e7oelh-0 giRCXh" style="height: auto;"><div class="style__ContentIntro-sc-e7oelh-1 czloHV"><p class="ql-align-justify"><strong>Hạng vé/giá bán:</strong></p>
                            <ul>
                                <li class="ql-align-justify">Trót Yêu:&nbsp;&nbsp;4.000.000 VND</li>
                                <li class="ql-align-justify">Dấu Mưa:&nbsp;3.300.000 VND</li>
                                <li class="ql-align-justify">Tự Tình:&nbsp;&nbsp;2.700.000 VND</li>
                                <li class="ql-align-justify">Chuyện mưa:&nbsp;2.200.000 VND</li>
                                <li class="ql-align-justify">Chưa bao giờ:&nbsp;1.800.000 VND</li>
                                <li class="ql-align-justify">Gọi mưa:&nbsp;1.000.000 VND</li>
                            </ul>
                            <p class="ql-align-justify">LƯU Ý: Tất cả giá vé trên chưa bao gồm thuế giá trị gia tăng theo quy định của pháp luật áp dụng hiện hành. Giá vé trên tương ứng với 1 chỗ ngồi chỉ áp dụng cho người lớn hoặc trẻ em trên 6 tuổi.</p>
                            <p class="ql-align-center"><img src="https://salt.tkbcdn.com/ts/ds/01/3f/bf/f48ecae241cafaa7a29d21c7d9ed0da3.png"></p>
                            <p class="ql-align-justify">&nbsp;</p>
                            <p class="ql-align-justify"><strong>NHỮNG QUY ĐỊNH CẦN BIẾT KHI MUA VÉ</strong></p>
                            <ul>
                                <li class="ql-align-justify">Trong quá trình mua vé, đối với hạng vé ngồi, khách hàng không được chọn vị trí ngồi chính xác. BTC sẽ xuất vé có số ghế ngồi cụ thể cho khách hàng và khách hàng bắt buộc phải ngồi theo đúng số ghế trên vé.</li>
                                <li class="ql-align-justify">Mỗi Vé tương ứng với 01 khách tham gia (không bao gồm trẻ em).</li>
                                <li class="ql-align-justify">Người Mua kiểm tra lại thông tin Vé (tổng số vé, loại vé, số vé từng loại) và số tiền trước khi xác nhận Đơn hàng mua Vé.</li>
                                <li class="ql-align-justify">Vé Sự Kiện là Vé không được đổi hoặc trả lại dưới mọi hình thức, khách hàng vui lòng cân nhắc kỹ trước khi mua.</li>
                                <li class="ql-align-justify">Thời gian giữ Vé: 15 PHÚT/ lượt.</li>
                                <li class="ql-align-justify">Khách hàng được mua tối đa 10 Vé/ 1 loại vé/ 1 giao dịch.</li>
                                <li class="ql-align-justify">Khách hàng có trách nhiệm bảo mật tuyệt đối mã Vé điện tử của mình. Trường hợp có nhiều hơn 1 người check-in bằng 1 mã Vé điện tử thì BTC sẽ chấp nhận người đầu tiên check-in mã Vé đó được tham gia chương trình.</li>
                                <li class="ql-align-justify">Đối với Người Mua đặt qua Ticketbox, sau khi hoàn thành thanh toán tiền mua Vé (Giao dịch thành công), hệ thống sẽ thực hiện gửi Mã Đặt Chỗ thành công cho Người Mua qua email. Chậm nhất trong vòng 5 (năm) ngày làm việc trước ngày sự kiện diễn ra (Hồ Chí Minh - 13/07/2023) BTC sẽ thực hiện gửi (các) Mã Vé QR (dùng để checkin vào cổng) cho Người Mua qua email Người Mua đã cung cấp.&nbsp;</li>
                                <li class="ql-align-justify">Để đảm bảo nhận được Mã Đặt Chỗ và Mã Vé QR, trước khi thực hiện việc đặt mua Vé theo quy trình giao dịch tại Quy chế này, Người Mua nên chủ động kiểm tra và điền đầy đủ, chính xác thông tin email trên các nền tảng bán Vé.</li>
                                <li class="ql-align-justify">Nếu trong vòng 24 giờ kể từ khi mua Vé mà Người Mua vẫn chưa nhận được Mã Đặt Chỗ (đối với Vé đặt qua Ticketbox) thì Người Mua vui lòng liên hệ Hotline: 1900.6408 hoặc email support@ticketbox.vn và Fanpage Facebook https://www.facebook.com/ticketbox.vn</li>
                            </ul>
                            <p class="ql-align-justify">&nbsp;</p>
                            <p class="ql-align-justify"><strong>QUY ĐỊNH CHECK IN&nbsp;</strong></p>
                            <ul>
                                <li class="ql-align-justify">Thời gian mở cổng check in: 16h00 ngày 13/07/2024.</li>
                                <li class="ql-align-justify">Thời gian đóng cổng check in: 20h00 ngày 13/07/2024.</li>
                                <li class="ql-align-justify">Khách hàng có trách nhiệm bảo mật tuyệt đối mã Mã QR Vé điện tử của mình. Trường hợp có nhiều hơn 1 người check-in bằng 1 Mã QR Vé điện tử thì BTC sẽ chấp nhận người đầu tiên check-in mã QR Vé đó được tham gia chương trình.</li>
                                <li class="ql-align-justify">Ngay khi check in tại sự kiện, khách hàng sẽ được nhận vòng đeo tay. Điều kiện hợp lệ để vào tham gia sự kiện là: (1) có đủ vòng đeo tay (còn nguyên vẹn chưa bị rách/xé) và có đóng dấu check-in của chương trình; (2) khách hàng phải xuất trình được vé điện tử (hoặc vé mời) do BTC gửi của mình bất cứ lúc nào được yêu cầu. Khách hàng sẽ không được phép qua khu vực kiểm soát an ninh của sự kiện nếu thiếu 1 trong 2 điều trên.</li>
                            </ul>
                            <p class="ql-align-justify">&nbsp;</p>
                            <p class="ql-align-justify"><strong>QUY ĐỊNH THAM GIA SHOW</strong></p>
                            <ul>
                                <li class="ql-align-justify">Trẻ em dưới 6 tuổi không được tham gia.&nbsp;</li>
                                <li class="ql-align-justify">Cấm mang vào địa điểm diễn ra sự kiện các loại vũ khí, vật sắc nhọn, chất nổ, chất độc, chất dễ cháy và chất phóng xạ, chất gây nghiện và chất kích thích, đồ ăn và thức uống có màu, mùi, vị (ngoại trừ nhãn, hiệu được phép) hoặc các vật phẩm khác có thể gây ảnh hưởng đến trật tự và công tác tổ chức sự kiện.</li>
                                <li class="ql-align-justify">Cấm mang vào địa điểm đèn laser, đèn pin, các vật nhọn, ô dù, bút viết, gậy selfie, chân máy ảnh/máy quay.</li>
                                <li class="ql-align-justify">Cấm mang vào địa điểm áp-phích, băng cổ vũ, bảng chỉ dẫn… có nội dung liên quan đến chính trị, tôn giáo và/hoặc chứa ngôn từ không phù hợp với thuần phong mỹ tục.</li>
                                <li class="ql-align-justify">Nghiêm cấm hút thuốc (kể cả thuốc lá điện tử) tại địa điểm diễn ra sự kiện.</li>
                                <li class="ql-align-justify">Cấm các loài động vật hoặc thú nuôi.</li>
                                <li class="ql-align-justify">Trang phục tham gia lịch sự, không phản cảm, không chứa hoạ tiết, thông điệp tuyên truyền về tôn giáo, chính trị, công kích cá nhân và tổ chức hoặc bất kỳ những vấn đề nào trái với thuần phong mỹ tục.</li>
                                <li class="ql-align-justify">Không phát trực tiếp (livestream) và không ghi hình trực tiếp toàn bộ chương trình. Không chụp ảnh, quay video hoặc ghi âm chuyên nghiệp theo bất kỳ hình thức nào trong suốt thời điểm chương trình ra. BTC có quyền yêu cầu người vi phạm ra khỏi khu vực sự kiện và không hoàn trả tiền vé.</li>
                                <li class="ql-align-justify">Tất cả người tham dự đều phải được kiểm tra túi/balo/túi xách tại tất cả các cổng vào trước khi vào bên trong.</li>
                                <li class="ql-align-justify">BTC có quyền yêu cầu kiểm tra, xem xét và từ chối quyền tham gia sự kiện đối với cá nhân/nhóm có dấu hiệu thực hiện các hành vi trái pháp luật, tuyên truyền tôn giáo trái phép, hay bất kỳ hoạt động nào làm ảnh hưởng tiêu cực đến sự kiện.&nbsp;</li>
                                <li class="ql-align-justify">Ban tổ chức có quyền thay đổi thời gian, bố cục sự kiện mà không cần thông báo trước.</li>
                                <li class="ql-align-justify">Khi tham gia chương trình đồng nghĩa với việc bạn đã đồng ý cho phép BTC sử dụng hình ảnh của mình để khai thác cho các sản phẩm ghi hình, ghi âm của chương trình.</li>
                                <li class="ql-align-justify">Quyết định của BTC là quyết định cuối cùng trong mọi trường hợp.</li>
                            </ul></div><div rotate="false" class="style__IconHandleHeight-sc-e7oelh-3 eVsDpA"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6 9l6 6 6-6" stroke="#2A2D34" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path></svg></div></div></div></div>


           
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>