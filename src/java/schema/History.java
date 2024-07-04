/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author LENOVO
 */
public class History {

    private String email, action, time;

    public History() {
    }

    public History(String email, String action, String time) {
        this.email = email;
        this.action = action;
        this.time = time;
    }

    public String getEmail() {
        return email;
    }

    public String getAction() {
        return action;
    }

    public String getTime() {
        return time;
    }

}
