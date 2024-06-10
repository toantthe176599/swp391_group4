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
    public static synchronized queryUser createQueryUSer() {
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
                account s = new account(rs.getString("id"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("token"), rs.getString("role"), rs.getString("status"));
                s.setPassword("");
                result.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    // check  account to login
    public String checkLogintWithRegularAccount(String userName, String password) {
        String format = "select token from account where username = '%s' and password='%s'";
        String sql = String.format(format, userName, password);
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

                save = new account(rs.getString("id"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("token"), rs.getString("role"), rs.getString("status"));

            }

        } catch (Exception e) {

            System.out.println(e);
        }

        if (save == null) {
            return new payload(false, "Không thể tìm thấy email này", null);
        }

        return new payload(true, "Email này đã tồn tại", save);

    }

    // check  username was used
    public boolean checkUserNameExist(String userName) {
        String format = "select username from account where username = '%s'";
        String sql = String.format(format, userName);
        boolean nameExist = false;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                nameExist = rs.getString("username") == null ? false : true;
                if (nameExist == true) {
                    break;
                }
            }

        } catch (Exception e) {

            System.out.println(e);
        }
        return nameExist;
    }

    // check user name already use
    // find by 
    // check before insert account
    public payload prepareBeforeInsert(String email, String userName, String password) {
        if (userName == null || userName.trim().isEmpty()) {
            userName = email;
        }
        payload checkEmailStatus = checkEmail(email);
        if (checkEmailStatus.isIsSuccess() == true) {
            return new payload(false, "Email is already exist", new Object());
        }
        if (checkUserNameExist(userName)) {
            return new payload(false, "Username is already used", new Object());
        }
        String[] infor = insertAnAccount(email, userName, password, "customer");
        if (infor == null) {
            return new payload(false, "Tên tài khoản đã được sử dụng!", new Object());
        }
        return new payload(true, "Thành công", new account(infor[0], email, userName, password, infor[1], null, "active"));

    }

    // insert an account
    private String[] insertAnAccount(String email, String username, String password, String role) {
        String token = randomToken.generateToken(30);
        String id = randomToken.generateToken(30);

        String format = " insert into account values ('%s', '%s', '%s', '%s', '%s', '%s', 'active')";
        String sql = String.format(format, id, email, username, password, token, role);

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return new String[]{id, token};
    }

    // get token
    public payload getTokenOfAnEmail(String email) {
        payload checkEmail = checkEmail(email); // check email exist
        if (checkEmail.isIsSuccess() == false) {
            return new payload(false, "email does not exist", new account());
        }

        return new payload(true, "Lấy mã token thành công", (account) checkEmail.getObject());
    }

    // get role by token
    public String checkRoleByToken(String token) {
        String format = "select role from account where token = '%s'";
        String sql = String.format(format, token);
        String role = "";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                role = rs.getString("role");
            }

        } catch (Exception e) {

            System.out.println(e);
        }

        return role;
    }

    // change Password
    public boolean chagenPassword(String token, String newPassword) {
        String format = "update account set password = '%s' where token = '%s'";
        String sql = String.format(format, newPassword, token);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // insert by admin
    public payload insertByAdmin(String email, String userName, String password, String role) {

        payload checkEmailStatus = checkEmail(email);
        if (checkEmailStatus.isIsSuccess() == true) {
            return new payload(false, "Email đã được đăng ký", new Object());
        }
        if (checkUserNameExist(userName)) {
            return new payload(false, "Tên đăng nhập đã được sử dụng", new Object());
        }
        String[] infor = insertAnAccount(email, userName, password, role);

        if (infor == null) {
            return new payload(false, "Tạo tài khoản thất bại", new Object());
        }
        changeStatusById(infor[0], "changePassword");
        return new payload(true, "Successfully", new account(infor[0], email, userName, password, infor[1], " ", " "));

    }

    // delete account by id
    public boolean deleteAccountById(String id) {
        String format = "delete from account where id = '%s'";
        String sql = String.format(format, id);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // search account by id
    public payload findById(String id) {
        account result = null;
        String format = "select * from account where id = '%s'";
        String sql = String.format(format, id);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = new account(rs.getString("id"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("token"), rs.getString("role"), rs.getString("status"));
            }

        } catch (Exception e) {
            System.out.println(e);
            return new payload(false, "Tài khoản không tồn tại", null);
        }
        return new payload(true, "Tìm kiếm thành công", result);
    }

    // update account by id (notice: this update only work for email)
    public boolean updateAccountById(String id, String username, String password, String role) {

        String format = "";
        String sql = "";
        if (!password.isEmpty()) {
            format = "update account set username = coalesce('%s', username), password = coalesce('%s', password), role = coalesce('%s', role)  where id = '%s'";
            sql = String.format(format, username, password, role, id);

        } else {
            format = "update account set username = coalesce('%s', username), password = coalesce(null, password), role = coalesce('%s', role)  where id = '%s'";
            sql = String.format(format, username, role, id);

        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    //change status account by id
    public boolean changeStatusById(String id, String status) {
        String format = "update account set status = '%s' where id = '%s'";
        String sql = String.format(format, status, id);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    //check status by token
    public String checkStatusByToke(String token) {
        String format = "select status from account where token = '%s'";
        String sql = String.format(format, token);
        String status = "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                status = rs.getString("status");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;

    }

    //change status by token 
    public boolean changeStatusByToken(String token, String status) {
        String format = "update account set status = '%s' where token = '%s'";
        String sql = String.format(format, status, token);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        queryUser test = queryUser.createQueryUSer();
        payload temp = test.insertByAdmin("abc@gmail", "123456", "123456", "admin");
        System.out.println(temp.getDescription());
    }
}
