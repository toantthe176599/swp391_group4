/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.payload;
import helper.randomToken;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import schema.OTP;
import schema.account;

/**
 *
 * @author LENOVO
 */
public class queryOTP extends DBContext {

    private static queryOTP otp;

    private queryOTP() {
    }

    public static synchronized queryOTP createInstance() {
        if (otp == null) {
            otp = new queryOTP();
        }
        return otp;
    }

    // remove otp over 3 minute
    private void removerOTPOT(String nameTable) {
        String sql = "delete  from " + nameTable + " where  DATEDIFF(MINUTE, created_at, GETDATE()) >= 3";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // remove otp after used
    private void removeOTPUsed(String nameTable, String otp) {
        String sql = "delete  from " + nameTable + " where OTP = '" + otp + "'";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // add otp for signup
    public void addOtp(String username, String email, String password, String OTP) {
        String format = "INSERT INTO accountSignUp (username, email, password, OTP) VALUES ('%s', '%s', '%s', '%s')";
        String sql = String.format(format, username, email, randomToken.md5(password), OTP);
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // compare otp sign up
    public payload compareOTP(String OTP) {
        removerOTPOT("accountSignUp");
        String format = "select * from accountSignUp where OTP = '%s'";
        String sql = String.format(format, OTP);
        OTP result = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = new OTP(rs.getString("username"), rs.getString("email"), rs.getString("password"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if (result == null) {
            return new payload(false, "OTP is not correct", new OTP());
        }
        removeOTPUsed("accountSignUp", OTP);
        return new payload(true, "correct", result);
    }

    // insert OTP forgot Password
    public payload inserOTPForgotPasword(String email, String OTP) {
        queryUser querUser = queryUser.createQueryUSer();
        payload checkEmail = querUser.checkEmail(email); // check email exist
        account account = (account) checkEmail.getObject();
        if (checkEmail.isIsSuccess() == false) { // email does not exist
            return checkEmail;
        }
        removerOTPOT("ForgotPassword"); // remove last otp if it expired
        String format = "INSERT INTO ForgotPassword(token, OTP) VALUES ('%s', '%s')";
        String sql = String.format(format, account.getToken(), OTP);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
            return new payload(false, "OTP was send", new Object());
        }

        return new payload(true, "successfully", account.getToken());
    }

    // compare otp forgot password
    public payload compareOtpForgotPass(String OTP) {
        removerOTPOT("ForgotPassword");
        String token = "";
        String sql = "select * from ForgotPassword where OTP = " + OTP;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                token = rs.getString("token");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if (token.isBlank()) {
            return new payload(false, "OTP is not correct or expried", new Object());
        }

        removeOTPUsed("ForgotPassword", OTP);
        return new payload(true, "correct", token);
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
        queryOTP test = queryOTP.createInstance();

        test.addOtp("aaa", "aaaa", "aaa", "aaa");
    }

    // add otp for forgot password
}
