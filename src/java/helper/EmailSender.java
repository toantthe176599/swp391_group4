/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

/**
 *
 * @author HP
 */
import java.text.SimpleDateFormat;
import static java.time.LocalDate.now;
import java.util.Date;
import java.util.List;
import model.queryAreaPosition;
import schema.AreaEvent;
import schema.Booking;
import schema.Event;
import schema.account;

public class EmailSender {

    public String emailConfirmBooking(List<Booking> bookings, String title, Event event, account accountLogin) {
        queryAreaPosition areaDao = queryAreaPosition.createInstanceAreaPosition();
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("<!DOCTYPE html>\n")
                .append("<html lang=\"en\">\n")
                .append("<head>\n")
                .append("    <meta charset=\"UTF-8\">\n")
                .append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n")
                .append("    <title>").append(title).append("</title>\n")
                .append("    <style>\n")
                .append("        body { font-family: Arial, sans-serif; background-color: #f4f4f9; color: #333; }\n")
                .append("        .container { width: 100%; max-width: 600px; margin: 0 auto; background-color: #fff; padding: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px; border: 1px solid #ddd; }\n")
                .append("        .header { margin: 10px 0; font-size: 24px; text-align: center; text-transform: uppercase; color: #4CAF50; }\n")
                .append("        .list-info { list-style: none; padding: 0; margin: 0; border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; }\n")
                .append("        .item-info { padding: 10px 0; border-bottom: 1px solid #ddd; }\n")
                .append("        .title-info { font-weight: 600; font-size: 16px; color: #333; }\n")
                .append("        .content-info { font-style: italic; font-size: 16px; color: #666; }\n")
                .append("        .order-product { width: 100%; margin-top: 20px; }\n")
                .append("        .order-product table { width: 100%; text-align: center; border-collapse: collapse; }\n")
                .append("        .order-product table th { font-weight: bold; color: #fff; background-color: #4CAF50; padding: 10px; }\n")
                .append("        .order-product table th, .order-product table td { border: 1px solid #ddd; padding: 10px; }\n")
                .append("        .order-product table .total { background-color: #e4e4e4; font-weight: bold; font-size: 16px; text-transform: uppercase; color: #333; }\n")
                .append("        .thank { margin-top: 20px; text-align: center; }\n")
                .append("        .thank p { font-size: 16px; font-weight: bold; color: #333; }\n")
                .append("        .footer { text-align: center; padding: 10px 0; margin-top: 20px; border-top: 1px solid #ddd; color: #999; font-size: 12px; }\n")
                .append("    </style>\n")
                .append("</head>\n")
                .append("<body>\n")
                .append("    <div class=\"container\">\n")
                .append("        <div class=\"header\">\n")
                .append("            <h2>").append(title).append("</h2>\n")
                .append("            <h4> Xin chào ").append(accountLogin.getUsername()).append(" đến với </h4>\n")
                .append("            <div>Sự kiện: ").append(event.getName()).append("</div>\n")
                .append("        </div>\n")
                .append("        <div class=\"main-order\">\n")
                .append("            <div class=\"info-order\">\n")
                .append("                <ul class=\"list-info\">\n");
        Date now = new Date();
        for (Booking booking : bookings) {
            AreaEvent areaEvent = areaDao.getAreaById(booking.getAreaId() + "");
            emailContent.append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Booking ID: </span>\n")
                    .append("                        <span class=\"content-info\">").append(booking.getBookingId()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Email: </span>\n")
                    .append("                        <span class=\"content-info\">").append(accountLogin.getEmail()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Ticket ID: </span>\n")
                    .append("                        <span class=\"content-info\">").append(booking.getTicketId()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Quantity: </span>\n")
                    .append("                        <span class=\"content-info\">").append(booking.getQuantity()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Total Amount: </span>\n")
                    .append("                        <span class=\"content-info\">").append(booking.getTotalAmount()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Payment Method: </span>\n")
                    .append("                        <span class=\"content-info\">").append(booking.getPaymentMethod()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Booking Date: </span>\n")
                    .append("                        <span class=\"content-info\">").append(new SimpleDateFormat("dd/MM/yyyy").format(now)).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <span class=\"title-info\">Area: </span>\n")
                    .append("                        <span class=\"content-info\">").append(areaEvent.getNameArea()).append("</span>\n")
                    .append("                    </li>\n")
                    .append("                    <li class=\"item-info\">\n")
                    .append("                        <hr>\n")
                    .append("                    </li>\n");
        }

        emailContent.append("                </ul>\n")
                .append("            </div>\n")
                .append("        </div>\n")
                .append("        <div class=\"thank\">\n")
                .append("            <p>Thank you for booking tickets on our website. Have a great event!</p>\n")
                .append("        </div>\n")
                .append("        <div class=\"footer\">\n")
                .append("            © 2024 Your Company. All rights reserved.\n")
                .append("        </div>\n")
                .append("    </div>\n")
                .append("</body>\n")
                .append("</html>");

        return emailContent.toString();
    }

}
