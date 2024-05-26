/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

/**
 *
 * @author LENOVO
 */
public class randomToken {
     private static final String ALLOWED_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    public static String generateToken(int length) {
        SecureRandom random = new SecureRandom();
        Random r = new Random();
        StringBuilder token = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = r.nextInt(ALLOWED_CHARACTERS.length());
            token.append(ALLOWED_CHARACTERS.charAt(index));
        }

        return Base64.getUrlEncoder().encodeToString(token.toString().getBytes());
    }
    
    // random OTP
      public static String generateRandomDigitString(int length) {
        Random random = new Random();
        StringBuilder digitString = new StringBuilder();

        for (int i = 0; i < length; i++) {
            digitString.append(random.nextInt(10));
        }

        return digitString.toString();
    }

    public static void main(String[] args) {
        System.out.println(generateToken(20));
//        int tokenLength = 10; // Đặt độ dài token mong muốn
//
//        String token = generateToken(20);
//        System.out.println("Token ngẫu nhiên: " + token);

    }
}
