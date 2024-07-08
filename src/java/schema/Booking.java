/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class Booking {

    private String bookingId;
    private String accountId;
    private String ticketId;
    private int quantity;
    private double totalAmount;
    private String paymentMethod;
    private Date bookingDate;
    private String areaId;
    private AreaEvent detailArea;
    

    public Booking() {
    }

    public Booking(String bookingId, String accountId, String ticketId, double totalAmount, String paymentMethod, Date bookingDate) {
        this.bookingId = bookingId;
        this.accountId = accountId;
        this.ticketId = ticketId;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.bookingDate = bookingDate;
    }
    
    

    public String getAreaId() {
        return areaId;
    }

    public AreaEvent getDetailArea() {
        return detailArea;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

}
