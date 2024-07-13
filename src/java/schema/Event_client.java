/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Event_client {

    private String event_id;
    private String name;
    private String title;
    private Date start_time;
    private Date start_date;
    private String location;
    private String image_event;

    public Event_client() {
    }

    public Event_client(String event_id, String name, String title, Date start_time, Date start_date, String location, String image_event) {
        this.event_id = event_id;
        this.name = name;
        this.title = title;
        this.start_time = start_time;
        this.start_date = start_date;
        this.location = location;
        this.image_event = image_event;
    }

    public String getEvent_id() {
        return event_id;
    }

    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date strat_date) {
        this.start_date = start_date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImage_event() {
        return image_event;
    }

    public void setImage_event(String image_event) {
        this.image_event = image_event;
    }

    @Override
    public String toString() {
        return "Event_client{" + "event_id=" + event_id + ", name=" + name + ", title=" + title + ", start_time=" + start_time + ", start_date=" + start_date + ", location=" + location + ", image_event=" + image_event + '}';
    }

}
