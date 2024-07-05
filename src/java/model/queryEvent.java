/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.payload;
import helper.randomToken;
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
import schema.History;

/**
 *
 * @author LENOVO
 */
public class queryEvent extends DBContext {

    private static queryEvent otp;

    //-------------------------------
    private queryEvent() {
    }

    public static synchronized queryEvent createInstance() {
        if (otp == null) {
            otp = new queryEvent();
        }
        return otp;
    }
    // ------------------------------

    // get all event
    //end
    //create an event
    public payload createEvent(Event event) throws ParseException {

        // convert date and time to correct format
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        List<String> list = Arrays.asList(event.getStartDate().split("-"));
        Collections.reverse(list);
        String date = String.join("/", list);
        Date temp = dateFormat.parse(date);
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        Date time = timeFormat.parse(event.getStartTime());
        //end

        String idEvent = randomToken.generateToken(25); // id event
        String sql = "insert into event  values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // write sql query and execute
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, idEvent);
            st.setString(2, event.getName());
            st.setString(3, event.getTitle());
            st.setString(4, event.getArtist());
            st.setString(5, event.getDescription());
            st.setTime(6, new java.sql.Time(time.getTime()));
            st.setDate(7, new java.sql.Date(temp.getTime()));
            st.setString(8, event.getDestination());
            st.setString(9, event.getImg_event());
            st.setString(10, event.getImg_position());
            st.setString(11, event.getStatus());
            st.setString(12, event.getCategory());
            st.setString(13, event.getOrganizer());

            st.execute();
        } catch (Exception e) {
            System.out.println(e + "lỗi tại queryEvent hàm insert event");
            return new payload(false, "Không thể tạo sự kiện đã có lỗi hệ thống", null);
        }
        return new payload(true, "tạo sự kiên thành công! Để bắt đầu sự kiện vui lòng vào phần chỉnh sửa", idEvent);
    }
    //end

    // get a part of detail ticket
    public List<Event> getAPartEvent() {

        // update event status
        updateStatusEventExpired();
        //end

        String sql = "select e.*, c.category_name from event e left join category c on e.category = c.category_id order by start_date desc";
        List<Event> listEvent = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Event event = new Event.buildEvent().setId(rs.getString("event_id"))
                        .setName(rs.getString("name"))
                        .setCategory(rs.getString("category_name"))
                        .setImgEvent(rs.getString("image_event"))
                        .setStartDate(rs.getString("start_date"))
                        .setStatus(rs.getString("status"))
                        .setOrganizer(rs.getString("organizer"))
                        .build();
                listEvent.add(event);
            }
        } catch (Exception e) {
            System.out.println(e + "lỗi tại getApartEvent queryevent");
        }
        return listEvent;
    }

    //end
    // get all event by creator Id 
    public List<Event> getEventByCreator(String creatorId) {

        // update event status
        updateStatusEventExpired();
        //end

        String sql = "select e.*, c.category_name from event e left join category c on e.category = c.category_id where event_id in (select event_id from"
                + " logHistory where account_id = ? "
                + " and type = 'create')\n"
                + " order by start_date desc";
        List<Event> listEvent = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, creatorId);
            System.out.println(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Event event = new Event.buildEvent().setId(rs.getString("event_id"))
                        .setName(rs.getString("name"))
                        .setCategory(rs.getString("category_name"))
                        .setImgEvent(rs.getString("image_event"))
                        .setStartDate(rs.getString("start_date"))
                        .setStatus(rs.getString("status"))
                        .setOrganizer(rs.getString("organizer"))
                        .build();
                listEvent.add(event);
            }
        } catch (Exception e) {
            System.out.println(e + "lỗi tại getApartEvent queryevent");
        }
        return listEvent;
    }

    //end
    // get a specific event by ID
    public Event getAnEventById(String id) {
        String sql = "  select e.*, c.category_name from event e left join category c on e.category = c.category_id where e.event_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return new Event.buildEvent().
                        setId(rs.getString("event_id"))
                        .setName(rs.getString("name"))
                        .setTitle(rs.getString("title"))
                        .setArtist(rs.getString("artist"))
                        .setDescription(rs.getString("description"))
                        .setStartTime(rs.getString("start_time"))
                        .setStartDate(rs.getString("start_date"))
                        .setDestination(rs.getString("location"))
                        .setImgEvent(rs.getString("image_event"))
                        .setImgPosition(rs.getString("image_position"))
                        .setStatus(rs.getString("status"))
                        .setCategory(rs.getString("category_name"))
                        .setOrganizer(rs.getString("organizer"))
                        .build();
            }
        } catch (Exception e) {
            System.out.println(e + "lỗi tại getAnEventById queryEvent");
        }
        return null;
    }

    //end
    //update iamgeEvent 
    public void updateImageEvent(String idEvent, String url, String nameImage) {
        // specific kind of image
        String kindImage = "";
        if (nameImage.equals("event")) { // event img
            kindImage = "[image_event]";
        } else {
            kindImage = "[image_position]"; // position img
        }
        //end

        // sql and update to database
        String sql = "UPDATE [dbo].[event]\n"
                + "   SET " + kindImage
                + " = ? where event_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, url);
            pt.setString(2, idEvent);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at updateImageEvent queryEvent");
        }
    }
    //end 

    // update event
    public void updateEvent(Event newEvent) throws ParseException {

        // update event status
        updateStatusEventExpired();
        //end

        // convert date and time to correct format
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        List<String> list = Arrays.asList(newEvent.getStartDate().split("-"));
        Collections.reverse(list);
        String date = String.join("/", list);
        Date dateStart = dateFormat.parse(date);
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        Date time = timeFormat.parse(newEvent.getStartTime());
        //end

        // sql query and update to db new event information
        String sql = "UPDATE [dbo].[event]\n"
                + "   SET "
                + "      [name] =  ? \n"
                + "      ,[title] = ? \n"
                + "      ,[artist] = ? \n"
                + "      ,[description] = ? \n"
                + "      ,[start_time] = ? \n"
                + "      ,[start_date] =  ? \n"
                + "      ,[location] = ? \n"
                + "      ,[status] = ? \n"
                + "      ,[category] = ? \n"
                + "      ,[organizer] = ? \n"
                + " WHERE event_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newEvent.getName());
            st.setString(2, newEvent.getTitle());
            st.setString(3, newEvent.getArtist());
            st.setString(4, newEvent.getDescription());
            st.setTime(5, new java.sql.Time(time.getTime()));
            st.setDate(6, new java.sql.Date(dateStart.getTime()));
            st.setString(7, newEvent.getDestination());
            st.setString(8, newEvent.getStatus());
            st.setString(9, newEvent.getCategory());
            st.setString(10, newEvent.getOrganizer());
            st.setString(11, newEvent.getId());
            st.execute();

            // update image if exist
            if (!newEvent.getImg_event().isBlank()) { // check if image event url exist 
                updateImageEvent(newEvent.getId(), newEvent.getImg_event(), "event");
            }

            if (!newEvent.getImg_position().isBlank()) {// check if image position url exist
                updateImageEvent(newEvent.getId(), newEvent.getImg_position(), "position");
            }
            //end
        } catch (Exception e) {
            System.out.println(e + "error in updateEvent query event");
        }
    }
    //end












































































































  // query loghistory of an event
    public List<History> getHistoryEvent(String idEvent) {
        String sql = "  select * from logHistory l join account a on l.account_id = a.id where l.event_id = ?  ORDER BY logTime ASC";
        List<History> listHistory = new ArrayList<>();
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idEvent);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                History history = new History(rs.getString("email"), rs.getString("type"), rs.getString("logTime"));
                listHistory.add(history);
            }
        } catch (Exception e) {
            System.out.println(e + " error in getHistoryEvent query event");
        }
        return listHistory;
    }

    //end
    // update event when event expired
    public void updateStatusEventExpired() {
        String sql = "  UPDATE event\n"
                + "SET status = 'expired'\n"
                + "WHERE start_date <= CAST(GETDATE() - 1 AS DATE)";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error in updateStatusEventExpired query event");
        }
    }

    // end
  
    
}
