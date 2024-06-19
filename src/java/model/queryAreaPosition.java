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
    
    private static queryAreaPosition qAreaPosition;
    
    private queryAreaPosition() {
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

    //end
    //get all area of an event
    public List<AreaEvent> getAllAreaOfAnEventById(String idEvent) {
        String sql = "select * from Area_position where event_id = ?";
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
    
    public static void main(String[] args) {
        queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
        qAreaPosition.deleteAreaByEventId("RksxbGVqZHB6bnRuSWQ2OE9UazdvTk5JWg==");
//        AreaEvent a1 = new AreaEvent("a1", "100", "200", "200");
//        AreaEvent a2 = new AreaEvent("a1", "100", "200", "200");
//        AreaEvent a3 = new AreaEvent("a1", "100", "200", "200");
//        List<AreaEvent> list = new ArrayList<>();
//        Collections.addAll(list, a1, a2, a3);
//        qAreaPosition.insertArea(list, "V1lKd1RhSFhDMTIzdk84OTR4NmxIRDY0MGtDbmg4Rm5XRGg5RXkxUHViZXZFNnhuQVA=");

    }
}
