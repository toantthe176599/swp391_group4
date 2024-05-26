/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.authentication;

import config.GoogleInfomation;
import helper.GoogleAuthentication;
import helper.payload;
import helper.randomToken;
import helper.sendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryOTP;
import model.queryUser;
import schema.GoogleUser;
import schema.account;

/**
 *
 * @author LENOVO
 */
public class SignUpwithGoogle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpwithGoogle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpwithGoogle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            // Send google authentication
            String code = req.getParameter("code");
            String accessToken = GoogleAuthentication.getToken(code, GoogleInfomation.GOOGLE_REDIRECT_URL_SIGNUP);
            System.out.println(accessToken);
            GoogleUser user = GoogleAuthentication.getUserInfo(accessToken);

            // check email exist
            queryUser queryUs = queryUser.createQueryUSer();
            payload checkEmail = queryUs.checkEmail(user.getEmail());
            if (checkEmail.isIsSuccess() == true) {
                HttpSession session = req.getSession();
                session.setAttribute("error", "account already used");
                res.sendRedirect("/views/client/pages/authForm.jsp");
                return;
            }

            queryOTP otp = queryOTP.createInstance();
            final String OTP = randomToken.generateRandomDigitString(8);
            otp.addOtp("", user.getEmail(), user.getId(), OTP);
            sendMail.sendEmailTo(user.getEmail(), "Your OTP", "your OTP is " + OTP + " it will be exprired in 3 minutes");
            res.sendRedirect("/views/client/pages/OTPFormSignUp.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
