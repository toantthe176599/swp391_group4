/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class ReportEvent {

    private String idEvent;
    private int ticketSold;
    private int totalTicket;
    private double percentSold;
    private List<ReportArea> listArea;
    private int dayLeft;
    private int ticketLeft;
    private String img;
    private String nameEvent;
    private String status;

    public ReportEvent() {
    }

    public ReportEvent(String idEvent, int ticketSold, int totalTicket, List<ReportArea> listArea, int dayLeft, String nameEvent, String status) {
        this.idEvent = idEvent;
        this.ticketSold = ticketSold;
        this.totalTicket = totalTicket;
        this.listArea = listArea;
        this.ticketLeft = totalTicket - ticketSold;
        this.dayLeft = dayLeft;
        this.nameEvent = nameEvent;

        double percentSold = (double) ticketSold / totalTicket * 100;
        // Sử dụng BigDecimal để làm tròn số
        BigDecimal bd = new BigDecimal(Double.toString(percentSold));
        bd = bd.setScale(2, RoundingMode.HALF_UP);

        double roundedNumber = bd.doubleValue();
        this.percentSold = roundedNumber;
        this.status = status;
    }

    public ReportEvent(String idEvent, int ticketSold, int totalTicket, int dayLeft, String img, String nameEvent, String status) {
        this.idEvent = idEvent;
        this.ticketSold = ticketSold;
        this.totalTicket = totalTicket;
        if (totalTicket == 0) {
            this.percentSold = 0;
        } else {
            double percentSold = (double) ticketSold / totalTicket * 100;
            // Sử dụng BigDecimal để làm tròn số
            BigDecimal bd = new BigDecimal(Double.toString(percentSold));
            bd = bd.setScale(2, RoundingMode.HALF_UP);

            double roundedNumber = bd.doubleValue();
            this.percentSold = roundedNumber;

        }

        this.ticketLeft = totalTicket - ticketSold;
        this.dayLeft = dayLeft;
        this.img = img;
        this.nameEvent = nameEvent;
        this.status = status;
    }

    public String getIdEvent() {
        return idEvent;
    }

    public int getTicketSold() {
        return ticketSold;
    }

    public int getDayLeft() {
        return dayLeft;
    }

    public int getTotalTicket() {
        return totalTicket;
    }

    public double getPercentSold() {
        return percentSold;
    }

    public List<ReportArea> getListArea() {
        return listArea;
    }

    public int getTicketLeft() {
        return ticketLeft;
    }

    public String getImg() {
        return img;
    }

    public String getNameEvent() {
        return nameEvent;
    }

    public String getStatus() {
        return status;
    }

}
