/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import helper.DBContext;
import schema.AreaEvent;
import schema.ReportArea;
import schema.ReportEvent;
import schema.ReportEventRevenue;

/**
 *
 * @author LENOVO
 */
public class queryReportEvent extends DBContext {

    private static queryReportEvent qReportEvent;

    private queryReportEvent() {
    }

    public static synchronized queryReportEvent createInstanceReportEvent() {
        if (qReportEvent == null) {
            qReportEvent = new queryReportEvent();
        }
        return qReportEvent;
    }

    // get all event report
    public List<ReportEvent> listReport() {
        String sql = "select event_id, name, image_event from event";
        List<ReportEvent> listReport = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                // create an object report
                String idEvent = rs.getString("event_id");
                int currentTicket = sumCurTicket(idEvent); // get current ticket
                int totalTicket = sumAllTicket(idEvent); // get total ticket
                int dayleft = calDayLeft(idEvent); // get day left 
                String name = rs.getString("name"); // get name event
                String img = rs.getString("image_event"); // get img
                ReportEvent report = new ReportEvent(idEvent, totalTicket - currentTicket, totalTicket, dayleft, img, name);
                listReport.add(report);
                //end
            }
            return listReport;
        } catch (Exception e) {
            System.out.println(e + " error at listReport in queryReportEvent");
            return null;
        }

    }
    //end

    // get all event report
    public List<ReportEvent> listReportByUserId(String accountId) {

        // update status event 
        queryEvent qEvent = queryEvent.createInstance();
        qEvent.updateStatusEventExpired();
        //end

        String sql = "select event_id, name, image_event from event where event_id in (select event_id from logHistory where account_id = ? "
                + "and type = 'create') and status <> 'inactive' ";
        List<ReportEvent> listReport = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, accountId);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                // create an object report
                String idEvent = rs.getString("event_id");
                int currentTicket = sumCurTicket(idEvent); // get current ticket
                int totalTicket = sumAllTicket(idEvent); // get total ticket
                int dayleft = calDayLeft(idEvent); // get day left 
                String name = rs.getString("name"); // get name event
                String img = rs.getString("image_event"); // get img
                ReportEvent report = new ReportEvent(idEvent, totalTicket - currentTicket, totalTicket, dayleft, img, name);
                listReport.add(report);
                //end
            }
            return listReport;
        } catch (Exception e) {
            System.out.println(e + " error at listReport in queryReportEvent");
            return null;
        }

    }
    //end

    // calculate current ticket  of an event
    private int sumCurTicket(String idEvent) {
        String sql = "SELECT \n"
                + "    SUM(CAST(quantity AS INT)) AS current_quantity\n"
                + "    FROM \n"
                + "    Area_position\n"
                + "    WHERE \n"
                + "    event_id = ? ;";

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return rs.getInt("current_quantity");
            }
        } catch (Exception e) {
            System.out.println(e + " error at sumCurTicket in queryReportEvent");
        }
        return 0;
    }
    //end

    // calculate ticket of an event
    private int sumAllTicket(String idEvent) {
        String sql = "SELECT \n"
                + "    SUM(CAST(origin_quantity AS INT)) AS total_origin_quantity\n"
                + "    FROM \n"
                + "    Area_position\n"
                + "    WHERE \n"
                + "    event_id = ? ;";

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return rs.getInt("total_origin_quantity");
            }
        } catch (Exception e) {
            System.out.println(e + " error at sumAllTicket in queryReportEvent");
        }
        return 0;
    }

    //end 
    // calculate day left
    private int calDayLeft(String idEvent) {
        String sql = "SELECT \n"
                + "    DATEDIFF(DAY, GETDATE(), start_date) AS days_until_start\n"
                + "FROM \n"
                + "    event\n"
                + "where event_id = ? ";

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return rs.getInt("days_until_start");
            }
        } catch (Exception e) {
            System.out.println(e + " error at calDayLeft in queryReportEvent");
        }
        return 0;
    }
    //end

    // calculate ticket for each area of an event
    private List<ReportArea> getAllReportAreas(String eventId) {
        String sql = "select * from Area_position where event_id = ? ORDER BY CAST(price AS FLOAT) DESC";
        List<ReportArea> listReport = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, eventId);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                // create areaEvent object
                String nameArea = rs.getString("area_name"); // get name
                double price = rs.getDouble("price"); // get price
                int currentQuantity = rs.getInt("quantity"); // get remain ticket
                int originQunatity = rs.getInt("origin_quantity"); // get origin quantity
                ReportArea area = new ReportArea(nameArea, currentQuantity, originQunatity, price);
                listReport.add(area);
                //end
            }
            return listReport;
        } catch (Exception e) {
            System.out.println(e + " error at getAllAreaEvents in queryReportEvent");
            return null;
        }
    }
    //end

    // get detail report of an event
    public ReportEvent detailReportForAnEvent(String idEvent) {
        String sql = "select * from event where event_id = ?";

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                // create an object report
                int currentTicket = sumCurTicket(idEvent); // get current ticket
                int totalTicket = sumAllTicket(idEvent); // get total ticket
                int dayleft = calDayLeft(idEvent); // get day left 
                String nameEvent = rs.getString("name"); // get name event
                List<ReportArea> areaReport = getAllReportAreas(idEvent); // get area detail
                ReportEvent report = new ReportEvent(idEvent,
                        totalTicket - currentTicket,
                        totalTicket,
                        areaReport,
                        dayleft,
                        nameEvent);
                return report;
                //end
            }

        } catch (Exception e) {
            System.out.println(e + " error at detailReportForAnEvent in queryReportEvent");
        }
        return null;
    }
    //end

    // get report money of an event
    public ReportEventRevenue getReportMoneyOfEvent(String idEvent) {
        String sql = "Select * from manage_money where event_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                // get report money event
                double currentMoney = rs.getDouble("current_money"); // curren money
                double moneyForArtist = Double.parseDouble(rs.getString("money_for_artist")); // money for artist
                double totalMoney = rs.getDouble("total_money"); // total
                ReportEventRevenue report = new ReportEventRevenue(idEvent, currentMoney, moneyForArtist, totalMoney);
                return report;

            }
        } catch (Exception e) {
            System.out.println(e + " error at ReportEventRevenue in queryReportEvent");

        }
        return new ReportEventRevenue();
    }
    //end

    // insert money for artist for an event 
    public void insertMoneyForArtist(String idEvent, String money) {
        String sql = "insert into manage_money values (? , 0, ?, 0)";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            pt.setString(2, money);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at insertMoneyForArtist in queryReportEvent");
        }
    }
    //end

    // update money for artist for an event 
    public void updateMoneyForArtist(String idEvent, String money) {
        String sql = "update manage_money set money_for_artist = ? where event_id = ? ";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, money);
            pt.setString(2, idEvent);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at updateMoneyForArtist in queryReportEvent");
        }
    }
    //end

    // get money for artsit
    public String getMoneyForArtist(String idEvent) {
        String sql = "select money_for_artist from manage_money where event_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return rs.getString("money_for_artist");
            }
        } catch (Exception e) {
            System.out.println(e + " error at getMoneyForArtist in queryReportEvent");
        }
        return "0";
    }
    //end

    public static void main(String[] args) {
        queryReportEvent qReportEvent = queryReportEvent.createInstanceReportEvent();

        System.out.println(qReportEvent.getMoneyForArtist("WmdycmFIeGxkVWQ0ZU9Qb1ZLVUVwV3BxUg=="));
    }
}
