
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author LENOVO
 */
public class ReportTransaction {

    private String email;
    private String date;
    private String total;
    private String paymentMethod;
    private String areaName;
    private String quantity;
    private String price;

    public ReportTransaction(String email, String date, String total, String paymentMethod, String areaName, String quantity, String price) {
        this.email = email;
        this.date = date;
        this.total = total;
        this.paymentMethod = paymentMethod;
        this.areaName = areaName;
        this.quantity = quantity;
        this.price = price;
    }

    public ReportTransaction() {
    }

    public String getEmail() {
        return email;
    }

    public String getDate() {
        return date;
    }

    public String getTotal() {
        return total;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getAreaName() {
        return areaName;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getPrice() {
        return price;
    }

}
