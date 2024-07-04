/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 *
 * @author LENOVO
 */
public class ReportArea {

    private String nameArea;
    private int remainTicket, originQuantityTicket, soldTicket;
    private double price;
    private double percentSole;
    private double totalMoney;

    public ReportArea() {
    }

    public ReportArea(String nameArea, int remainTicket, int originQuantityTicket, double price) {
        this.nameArea = nameArea;
        this.remainTicket = remainTicket;
        this.originQuantityTicket = originQuantityTicket;
        this.price = price;
        this.soldTicket = originQuantityTicket - remainTicket;
        this.totalMoney = (double) price * soldTicket;

        double percentSold = (double) this.soldTicket / originQuantityTicket * 100;
        // Sử dụng BigDecimal để làm tròn số
        BigDecimal bd = new BigDecimal(Double.toString(percentSold));
        bd = bd.setScale(2, RoundingMode.HALF_UP);
        double roundedNumber = bd.doubleValue();
        this.percentSole = roundedNumber;
    }

    public String getNameArea() {
        return nameArea;
    }

    public int getOriginQuantityTicket() {
        return originQuantityTicket;
    }

    public double getPrice() {
        return price;
    }

    public double getPercentSole() {
        return percentSole;
    }

    public int getRemainTicket() {
        return remainTicket;
    }

    public int getSoldTicket() {
        return soldTicket;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

}
