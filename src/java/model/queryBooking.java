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
/**
 *
 * @author HP
 */
public class queryBooking extends DBContext {

    private static queryBooking qBooking;

    private queryBooking() {
    }
    
    public static queryBooking createInstanceBooking() {
        if (qBooking == null) {
            qBooking = new queryBooking();
        }
        return qBooking;
    }
    
    
    public boolean insertBooking(Booking booking) {
        String sql = "INSERT INTO Booking (account_id, ticket_id, total_amount, payment_method, booking_date, booking_id, quantity) VALUES (?, ?,?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, booking.getAccountId());
            statement.setString(2, booking.getTicketId());
            statement.setString(3, booking.getTotalAmount() + "");
            statement.setString(4, booking.getPaymentMethod());
            statement.setDate(5, new Date(System.currentTimeMillis()));
            statement.setString(6, booking.getBookingId());
            statement.setInt(7, booking.getQuantity());
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Add booking: " + e);
        }
        return false;
    }


    public List<Booking> getAllBookings(){
        String sql = "SELECT * FROM Booking";
        List<Booking> bookings = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Booking booking = new Booking(
                        resultSet.getString("booking_id"),
                        resultSet.getInt("account_id"),
                        resultSet.getString("ticket_id"),
                        resultSet.getDouble("total_amount"),
                        resultSet.getString("payment_method"),
                        resultSet.getDate("booking_date")
                );
                bookings.add(booking);
            }
        }catch(Exception e) {
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
    
}
