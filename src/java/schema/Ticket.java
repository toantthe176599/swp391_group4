/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author LENOVO
 */
public class Ticket {

    private String id_Ticket, id_event, id_area;
    private Event event;
    private AreaEvent area;

    public Ticket() {
    }

    public Ticket(String id_Ticket, String id_event, String id_area) {
        this.id_Ticket = id_Ticket;
        this.id_event = id_event;
        this.id_area = id_area;
    }

    public String getId_Ticket() {
        return id_Ticket;
    }

    public void setId_Ticket(String id_Ticket) {
        this.id_Ticket = id_Ticket;
    }

    public String getId_event() {
        return id_event;
    }

    public void setId_event(String id_event) {
        this.id_event = id_event;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public AreaEvent getArea() {
        return area;
    }

    public void setArea(AreaEvent area) {
        this.area = area;
    }
}
