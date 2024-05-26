/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.payload;
import helper.randomToken;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import schema.account;

/**
 *
 * @author LENOVO
 */
public class queryUser extends DBContext {

    private static queryUser queryUser;

    // constructor
    private queryUser() {
    }

    // create object
    public static queryUser createQueryUSer() {
        if (queryUser == null) {
            queryUser = new queryUser();
            return queryUser;
        }
        return queryUser;
    }

    //get all account
    public List<account> getAll() {
        List<account> result = new ArrayList<>();
        String sql = "select * from account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                account s = new account(rs.getString("id"), rs.getString("email"), rs.getString("password"), rs.getString("token"));
                result.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    // check login account
    public String checkLoginAccount(String email, String password) {
        String format = "select token from account where email = '%s' and password=%s";
        String sql = String.format(format, email, password);
        String token = "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                token = rs.getString("token");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return token;
    }

    // check email already exist
    public payload checkEmail(String email) {
        String format = "select * from account where email = '%s'";
        String sql = String.format(format, email);
        account save = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                save = new account(rs.getString("id"), rs.getString("email"), rs.getString("password"), rs.getString("token"));

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        if (save == null) {
            return new payload(false, "can not find this email", null);
        }

        return new payload(true, "Email is already used", save);

    }

    // find by 
    // check before insert account
    public payload prepareBeforeInsert(String email, String userName, String password) {
        payload result;
        payload checkEmailStatus = checkEmail(email);
        if (checkEmailStatus.isIsSuccess() == true) {

            result = new payload(false, "Account is already exist", null);
            return result;
        }
        String[] infor = insertAnAccount(email, userName, password);
        return new payload(true, "Successfully", new account(infor[0], email, password, infor[1]) );
    }

    // insert an account
    private String[] insertAnAccount(String email, String username, String password) {
        String token = randomToken.generateToken(30);
        String id = randomToken.generateToken(6);
        String format = " insert into account values ('%s', '%s', '%s', '%s')";
        String sql = String.format(format, id, email, password, token);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
        return new String[]{id, token};
    }

    // get token
    public payload getTokenOfAnEmail(String email) {
        payload checkEmail = checkEmail(email); // check email exist
        if (checkEmail.isIsSuccess() == false) {
            return new payload(false, "email does not exist", new account());
        }

        return new payload(true, "get token success", (account) checkEmail.getObject());
    }

    // change Password
    public payload chagenPassword(String token, String newPassword) {
        String format = "update account set password = '%s' where token = '%s'";
        String sql = String.format(format, newPassword, token);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {

            System.out.println(e);
            return new payload(false, "update password failed", new Object());
        }
        return new payload(true, "Password change successfully", new Object());
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
        queryUser test = queryUser.createQueryUSer();

         test.chagenPassword("emN6WVVqVXVxaUtsM3pYaGJjRTZIcjlLU2tWZEZV", "11111111111111111111111");
//        payload temp = test.getTokenOfAnEmail("vipboyxu2k3@gmail.com");
//        System.out.println(temp.getDescription());
//
//        account result = (account) temp.getObject();
//        System.out.println(result.getToken());
//  
//        System.out.println(result.getToken());
//        System.out.println(" ".isBlank());
        //        System.out.println(test.checkLoginAccount("vipboyxu2k3@.com", "111111"));

    }
}
