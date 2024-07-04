/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.util.List;

/**
 *
 * @author LENOVO
 */
public class ReportEventRevenue {

    private String idEvent;
    private double currentMoney, moneyForArtist, totalMoney;

    public ReportEventRevenue() {
    }

    public ReportEventRevenue(String idEvent, double currentMoney, double moneyForArtist, double totalMoney) {
        this.idEvent = idEvent;
        this.currentMoney = currentMoney;
        this.moneyForArtist = moneyForArtist;
        this.totalMoney = totalMoney;

    }

    public String getIdEvent() {
        return idEvent;
    }

    public double getCurrentMoney() {
        return currentMoney;
    }

    public double getMoneyForArtist() {
        return moneyForArtist;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setCurrentMoney(List<ReportArea> listArea) {
        double total = 0;
        for (ReportArea i : listArea) {
            total += i.getTotalMoney();
        }
        this.currentMoney = total;
    }

}
