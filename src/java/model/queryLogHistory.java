/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.payload;
import helper.randomToken;
import java.security.Timestamp;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import schema.Event;
import java.sql.ResultSet;
import schema.LogHistory;

/**
 *
 * @author LENOVO
 */
public class queryLogHistory extends DBContext {

    private static queryLogHistory qHistory;

    private queryLogHistory() {
    }

    public static synchronized queryLogHistory createInstance() {
        if (qHistory == null) {
            qHistory = new queryLogHistory();
        }
        return qHistory;
    }

    // test
    public void getAllLogOfAnEvent() {
        String sql = "select * from logHistory";

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("event_id"));
                System.out.println(rs.getString("account_id"));
                System.out.println(rs.getString("type"));
                java.sql.Timestamp timestamp = rs.getTimestamp("logTime");
                Date date = new Date(timestamp.getTime());
                SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                String formattedDate = formatter.format(date);
                System.out.println("Date: " + formattedDate);
            }
        } catch (Exception e) {
        }
    }
    //end

    // insert an logHistory 
    public void insertLogHistory(LogHistory log) {
        String sql = " insert into logHistory values ( ? ,? , ?, ?, GETDATE())";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, randomToken.generateToken(25));
            pt.setString(2, log.getEventId());
            pt.setString(3, log.getAccount_id());
            pt.setString(4, log.getTypeAction());
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at insertLogHistory in queryLoghistory");
        }
    }
    //end

    public static void main(String[] args) {
        queryLogHistory qHistory = queryLogHistory.createInstance();
        qHistory.insertLogHistory(new LogHistory("WmdycmFIeGxkVWQ0ZU9Qb1ZLVUVwV3BxUg==", "d2RwVzdKZWV6UXFOZzBYMXdjeVFtYXY3OVdPRDZj", "create"));
    }
}
