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

    public static queryPermission getInstanceQueryPermision() {
        if (queryPermission == null) {
            queryPermission = new queryPermission();
        }
        return queryPermission;

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

    //      public List<account> getAll() {
//        List<account> list = new ArrayList<>();
//        String sql = "select * from account";
//        //chay lenhj truy van
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                account s = new account(rs.getString("id"), rs.getString("userName"), rs.getString("password"), rs.getString("isAdmin"), rs.getString("verification"));
//                list.add(s);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return list;
//    } 
//   
    public static void main(String[] args) {
        queryPermission test = queryPermission.getInstanceQueryPermision();
        Map<String, String> role = test.getAllRole();
        for (Map.Entry<String, String> entry : role.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}
