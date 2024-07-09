/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author ADMIN
 */
public class Footer_client {
    private String id;
    private String address;
    private String useful_links;
    private String working_hours;
    private String phone_number;
    private String email;
    private String facebook;
    private String zalo;
    public Footer_client() {
    }

    public Footer_client(String id, String address, String useful_links, String working_hours, String phone_number, String email, String facebook, String zalo) {
        this.id = id;
        this.address = address;
        this.useful_links = useful_links;
        this.working_hours = working_hours;
        this.phone_number = phone_number;
        this.email = email;
        this.facebook = facebook;
        this.zalo = zalo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUseful_links() {
        return useful_links;
    }

    public void setUseful_links(String useful_links) {
        this.useful_links = useful_links;
    }

    public String getWorking_hours() {
        return working_hours;
    }

    public void setWorking_hours(String working_hours) {
        this.working_hours = working_hours;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getZalo() {
        return zalo;
    }

    public void setZalo(String zalo) {
        this.zalo = zalo;
    }

    @Override
    public String toString() {
        return "Footer_client{" + "id=" + id + ", address=" + address + ", useful_links=" + useful_links + ", working_hours=" + working_hours + ", phone_number=" + phone_number + ", email=" + email + ", facebook=" + facebook + ", zalo=" + zalo + '}';
    }

    
}
