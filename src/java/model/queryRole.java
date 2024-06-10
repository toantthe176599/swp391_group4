/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import java.util.List;
import schema.Role;
import helper.DBContext;
import helper.payload;
import helper.randomToken;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import schema.account;

/**
 *
 * @author LENOVO
 */
public class queryRole extends DBContext {

    private static queryRole query;

    private queryRole() {
    }

    // function create queryRole object
    public static queryRole createInstanceQueryRole() {
        if (query == null) {
            query = new queryRole();
        }
        return query;
    }
    //end

    // get all role
    public List<Role> getAllRole() {
        String sql = "select * from role";
        List<Role> roles = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role data = new Role(rs.getString("role"), rs.getString("description"));
                roles.add(data);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return roles;
    }
    //end

    // check role exist
    public boolean checkRoleExist(String role) {
        String format = "select top 1 role from role where role = '%s'";
        String sql = String.format(format, role);
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
    //end

    //add a new role 
    public boolean addRole(String role, String description) {
        String format = "insert into role values( N'%s', N'%s' )";
        String sql = String.format(format, role, description);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

        return true;
    }
    //end

    // remove all account has role already remove
    private void removeAllAccountOwnRole(String role) {
        String format = "update account set role = 'customer' where role = '%s'";
        String sql = String.format(format, role);
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    // end

    // remove role
    public boolean removeRole(String role) {

        // remove roll in table role
        String format = "delete from role where role = '%s'";

        String sql = String.format(format, role);

        try {
            // remove all account relate to this role
            removeAllAccountOwnRole(role);
            queryPermission qPermission = queryPermission.getInstanceQueryPermision();
            qPermission.removeBeforeUpdate(role);
            //end

            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        //end

        return true;
    }
    // end

    //get role 
    public Role getARole(String role) {
        String format = "select * from role where role = '%s'";
        String sql = String.format(format, role);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Role(rs.getString("role"), rs.getString("description"));
            }
        } catch (Exception e) {
        }
        return null;
    }
    //end

    //update role
    public void updateRole(String newRole, String oldRole, String description) {
        String format = "update role set role = '%s', description = N'%s' where role = '%s'";
        String sql = String.format(format, newRole, description, oldRole);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e + "9999999999999999999999999999999");
        }
    }
    //end

    // update role for user
    public void updateRoleForUserWhenRoleChange(String newrole, String oldrole) {
        String format = "update account set role = '%s' where role = '%s'";
        String sql = String.format(format, "customer", oldrole);
        String sql2 = String.format(format, newrole, "customer");

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.execute();
        } catch (Exception e) {
            System.out.println(e + "111111111111111111111111111111111");
        }

    }
    //end

    public static void main(String[] args) {
        queryRole test = createInstanceQueryRole();
        test.updateRoleForUserWhenRoleChange("admin", "staff");
    }
}
