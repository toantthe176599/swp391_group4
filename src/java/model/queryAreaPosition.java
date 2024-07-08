/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.randomToken;
import java.util.List;
import schema.AreaEvent;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.sql.ResultSet;

/**
 *
 * @author LENOVO
 */
public class queryAreaPosition extends DBContext {

    public static queryAreaPosition qAreaPosition;

    public queryAreaPosition() {
    }

    public static synchronized queryAreaPosition createInstanceAreaPosition() {
        if (qAreaPosition == null) {
            qAreaPosition = new queryAreaPosition();
        }
        return qAreaPosition;
    }

    // insert area 
    public List<String> insertArea(List<AreaEvent> areas, String event_id) {

        List<String> areaId = new ArrayList<>();

        String sql = "insert into Area_position values";
        String format = "('%s', '%s', N'%s', '%s', '%s', '%s'),";

        // use loop to write sql query
        for (AreaEvent i : areas) {
            String idArea = randomToken.generateToken(50);
            areaId.add(idArea);
            String value = String.format(format, idArea, event_id, i.getNameArea(), i.getPrice(), i.getQuantityTicketCurrent(), i.getQuantityTicketOrigin());
            sql = sql + value;
        }
        sql = sql.substring(0, sql.length() - 1);// remove last comma
        //end

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " Lỗi tại queryAreaposition hàm insertArea");
        }

        return areaId;
    }

    public boolean decreaseQuantity(String areaId, int quantity) {
        String sql = "UPDATE Area_position SET quantity = quantity - ? WHERE area_id = ? AND quantity >= ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, quantity);
            statement.setString(2, areaId);
            statement.setInt(3, quantity);
            return statement.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Decrease quantity: " + e);
        }
        return false;
    }

    //end
    //get all area of an event
    public List<AreaEvent> getAllAreaOfAnEventById(String idEvent) {
        String sql = "select * from Area_position where event_id = ? ORDER BY CAST(price AS INT) DESC;";
        List<AreaEvent> listArea = new ArrayList<>();

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                AreaEvent area = new AreaEvent(rs.getString("area_id"),
                        rs.getString("area_name"),
                        rs.getString("price"),
                        rs.getString("quantity"),
                        rs.getString("origin_quantity"));
//                        rs.getString("origin_quantity"));
                listArea.add(area);
            }
        } catch (Exception e) {
            System.out.println(e + "lỗi tại getAllAreaOfanevent queryArea");
        }
        return listArea;

    }
    //end

    public void deleteAreaByEventId(String eventId) {
        String sql = "DELETE FROM [dbo].[Area_position]\n"
                + "      WHERE event_id = ? ";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, eventId);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + "error at deleteAreaByEventID queryArea");
        }
    }

    public AreaEvent getAreaById(String areaId) {
        String sql = "SELECT * FROM [dbo].[Area_position] WHERE area_id = ?";
        AreaEvent areaPosition = null;
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, areaId);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                areaPosition = new AreaEvent();
                areaPosition.setId(rs.getString("area_id"));
                areaPosition.setNameArea(rs.getString("Area_name"));
                areaPosition.setPrice(rs.getString("price"));
                // Add other fields as necessary
            }
        } catch (Exception e) {
            System.out.println(e + " error at getAreaById");
        }
        return areaPosition;
    }

    public static void main(String[] args) {

        queryAreaPosition area = new queryAreaPosition();
        String idEvent = "1"; // Replace with the actual event ID you want to query
        List<AreaEvent> areaEvents = area.getAllAreaOfAnEventById(idEvent);
        for (AreaEvent areaEvent : areaEvents) {
            System.out.println(areaEvent);
//        queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
//        qAreaPosition.deleteAreaByEventId("RksxbGVqZHB6bnRuSWQ2OE9UazdvTk5JWg==");
//        AreaEvent a1 = new AreaEvent("a1", "100", "200", "200");
//        AreaEvent a2 = new AreaEvent("a1", "100", "200", "200");
//        AreaEvent a3 = new AreaEvent("a1", "100", "200", "200");
//        List<AreaEvent> list = new ArrayList<>();
//        Collections.addAll(list, a1, a2, a3);
//        qAreaPosition.insertArea(list, "V1lKd1RhSFhDMTIzdk84OTR4NmxIRDY0MGtDbmg4Rm5XRGg5RXkxUHViZXZFNnhuQVA=");

        }
    }
}
