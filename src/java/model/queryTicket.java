/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.randomToken;
import java.util.List;
import java.sql.PreparedStatement;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class queryTicket extends DBContext {

    private static queryTicket qTicket;

    private queryTicket() {
    }

    public static synchronized queryTicket createInstance() {
        if (qTicket == null) {
            qTicket = new queryTicket();

        }
        return qTicket;
    }

    // insert ticket
    public void insertTicket(List<String> areaId, String eventId) {
        // format sql query and use for loop write sql query
        String sql = "insert into Ticket values";
        String format = "('%s', '%s', '%s'),";

        for (String i : areaId) {
            String idTicket = randomToken.generateToken(25);
            String data = String.format(format, idTicket, eventId, i);
            sql = sql + data;
        }
        sql = sql.substring(0, sql.length() - 1); // remove last comma
        //end
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at insertTicket in queryTicket");
        }

    }
    
    public String addTicket(String eventId, String areaId) {
        String sql = "INSERT INTO Ticket (ticket_id, event_id, area_id) VALUES (?, ?, ?)";
        String idTicket = randomToken.generateToken(25);

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setString(1, idTicket);
            pt.setString(2, eventId);
            pt.setString(3, areaId);
            pt.executeUpdate();
            return idTicket;
        } catch (Exception e) {
            System.out.println(e + " lỗi tại queryticket hàm insert ticket");
        }
        return null;
    }
    //end

    // delete ticket by event id
    public void deleteTicketByIdEvent(String idEvent) {
        String sql = "delete from Ticket where event_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at deleteTicketByIdEvent queryTicket");
        }
    }
    //end

    public static void main(String[] args) {
        queryTicket qTicket = queryTicket.createInstance();
        List<String> temp = new ArrayList<>();
        temp.add("ZmZSUHZpMWNiTE5OR3JLamJpNVRNeURleWhPamVlcXhPcWN6SjlWRjFNZ2I2SFdCaGQ=");
        qTicket.insertTicket(temp, "Y1dDNmc2MEdhMWRpSW5qRWljTThrMmN2bQ==");
    }

}
