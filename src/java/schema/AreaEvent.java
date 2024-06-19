/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author LENOVO
 */
public class AreaEvent {

    private String id, nameArea, price, quantityTicketCurrent, quantityTicketOrigin;

  
    public AreaEvent() {
    }

    public AreaEvent(String nameArea, String price, String quantityTicketCurrent, String quantityTicketOrigin) {
        this.nameArea = nameArea;
        this.price = price;
        this.quantityTicketCurrent = quantityTicketCurrent;
        this.quantityTicketOrigin = quantityTicketOrigin;
    }
 
    public AreaEvent(String id, String nameArea, String price, String quantityTicketCurrent, String quantityTicketOrigin) {
        this.id = id;
        this.nameArea = nameArea;
        this.price = price;
        this.quantityTicketCurrent = quantityTicketCurrent;
        this.quantityTicketOrigin = quantityTicketOrigin;
    }

    public String getNameArea() {
        return nameArea;
    }

    public String getQuantityTicketCurrent() {
        return quantityTicketCurrent;
    }

    public String getQuantityTicketOrigin() {
        return quantityTicketOrigin;
    }

    public String getPrice() {
        return price;
    }
    public String getId() {
        return id;
    }

}
