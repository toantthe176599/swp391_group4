/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import schema.Role;

/**
 *
 * @author LENOVO
 */
public class queryPermission extends DBContext {

    private static queryPermission queryPermission;

    private queryPermission() {
    }

    public static synchronized queryPermission getInstanceQueryPermision() {
        if (queryPermission == null) {
            queryPermission = new queryPermission();
        }
        return queryPermission;

    }

    // get all permission
    public List<String> getAllPermisson() {
        String sql = "select * from Feature";
        List<String> permission = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                permission.add(rs.getString("Feature_name"));
            }
        } catch (Exception e) {
        }
        return permission;
    }

    // remove before update
    public void removeBeforeUpdate(String role) {
        String format = "delete from Role_Feature where role = '%s'";
        String sql = String.format(format, role);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // update permission in Role_Feature
    public void updatePermission(String newRole, String oldRole, String description, String[] newPermission) {
        String format = "('%s', '%s'),";
        String sql = "INSERT INTO Role_Feature values";
        for (String i : newPermission) {
            sql = sql + String.format(format, i, newRole);
        }
        sql = sql.substring(0, sql.length() - 1);
        System.out.println(sql);
        try {
            removeBeforeUpdate(oldRole);// remove all related feature to old role
            queryRole qRole = queryRole.createInstanceQueryRole();
            qRole.updateRoleForUserWhenRoleChange(newRole, oldRole);
            qRole.updateRole(newRole, oldRole, description); // update in table role
            PreparedStatement st = connection.prepareStatement(sql);
            if (newPermission.length != 0 && !newPermission[0].isBlank()) {
                st.execute();
            }
        } catch (Exception e) {
            System.out.println(e + "8888888888888888888888888888888888888");
        }
    }

    //get all role and description
    public Map<String, String> getAllRole() {
        Map<String, String> result = new HashMap<>();
        String sql = "select role, description from role";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("role"), rs.getString("description"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;

    }

    // check permisson exist
    public boolean checkPermissionExist(String permisson) {
        String format = "select top 1 * from Feature where Feature_name = '%s'";
        String sql = String.format(format, permisson);

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (!rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return true;
    }

    // get all permission of a role
    public String getAllPermissionARole(String role) {
        String format = "select Feature_name from Role_Feature where role = '%s'";
        String sql = String.format(format, role);
        String result = "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = result + " " + rs.getString("Feature_name");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static void main(String[] args) {
        queryPermission test = queryPermission.getInstanceQueryPermision();
        System.out.println(test.getAllPermissionARole("staff"));
    }
}
