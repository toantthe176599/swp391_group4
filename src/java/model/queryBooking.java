/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.randomToken;
import java.sql.Date;
import schema.Booking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import schema.ReportTransaction;

/**
 *
 * @author HP
 */
public class queryBooking extends DBContext {

    private static queryBooking qBooking;

    private queryBooking() {
    }

    public static synchronized queryBooking createInstanceBooking() {
        if (qBooking == null) {
            qBooking = new queryBooking();
        }
        return qBooking;
    }

    public boolean insertBooking(Booking booking) {
        String sql = "INSERT INTO Booking (account_id, ticket_id, total_amount, payment_method, booking_date, booking_id, quantity) VALUES (?, ?, ?, ?, GETDATE(), ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, booking.getAccountId());
            statement.setString(2, booking.getTicketId());
            statement.setString(3, booking.getTotalAmount() + "");
            statement.setString(4, booking.getPaymentMethod());
//            statement.setDate(5, new Date(System.currentTimeMillis()));
            statement.setString(5, booking.getBookingId());
            statement.setInt(6, booking.getQuantity());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Add booking: " + e);
        }
        return false;
    }

    public List<Booking> getAllBookings() {
        String sql = "SELECT * FROM Booking";
        List<Booking> bookings = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Booking booking = new Booking(
                        resultSet.getString("booking_id"),
                        resultSet.getString("account_id"),
                        resultSet.getString("ticket_id"),
                        resultSet.getDouble("total_amount"),
                        resultSet.getString("payment_method"),
                        resultSet.getDate("booking_date")
                );
                bookings.add(booking);
            }
        } catch (Exception e) {
            System.out.println("Get all booking: " + e);
        }
        return bookings;
    }

    public Map<Date, Double> getRevenuePerDay() {
        List<Booking> bookings = getAllBookings();
        Map<Date, Double> revenuePerDay = new HashMap<>();

        for (Booking booking : bookings) {
            Date bookingDate = booking.getBookingDate();
            double totalAmount = booking.getTotalAmount();
            revenuePerDay.put(bookingDate, revenuePerDay.getOrDefault(bookingDate, 0.0) + totalAmount);
        }

        return revenuePerDay;
    }

    // get detail booking by eventID
    public List<ReportTransaction> getBookingByEvent(String idEvent) {
        String sql = "select  b.booking_date, b.payment_method, b.quantity, b.total_amount,  a.area_name, a.price, a2.email from Booking b \n"
                + "join Ticket t on b.ticket_id = t.ticket_id \n"
                + "join Area_position a on a.area_id = t.area_id\n"
                + "join account a2 on a2.id = b.account_id\n"
                + "where b.ticket_id in(select ticket_id from ticket where \n"
                + "event_id = ?) order by b.booking_date desc";
        List<ReportTransaction> listReportBooking = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                // create ReportTransaction object
                String email = rs.getString("email");
                String date = rs.getString("booking_date");
                String total = rs.getString("total_amount");
                String paymenMethod = rs.getString("payment_method");
                String areaName = rs.getString("area_name");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
                ReportTransaction report = new ReportTransaction(
                        email,
                        date,
                        total,
                        paymenMethod,
                        areaName,
                        quantity,
                        price);
                //end
                listReportBooking.add(report); // add to list
            }
            return listReportBooking;
        } catch (Exception e) {
            System.out.println(e + " error at getBookingByEvent in queryBooking");
            return listReportBooking;
        }
    }
    //end

    public static void main(String[] args) {
        queryBooking qBooking = queryBooking.createInstanceBooking();
        List<ReportTransaction> list = qBooking.getBookingByEvent("bFJZcmRWMVdpM3VvMFNtbVE3Smh0NHdrVQ==");

    }
}
