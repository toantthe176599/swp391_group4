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
public class Permissions {

    private String role;
    private List<String> listPermission;

    public Permissions() {
    }

    public Permissions(String role, List<String> listPermission) {
        this.role = role;
        this.listPermission = listPermission;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<String> getListPermission() {
        return listPermission;
    }

    public void setListPermission(List<String> listPermission) {
        this.listPermission = listPermission;
    }

}
