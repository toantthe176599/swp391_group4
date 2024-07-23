/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.authentication;

import helper.payload;
import helper.randomToken;
import helper.sendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryOTP;
import model.queryUser;

/**
 *
 * @author LENOVO
 */
public class signUp extends HttpServlet {

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
            out.println("<title>Servlet signUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signUp at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        //get data from request
        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // check whether the account detail is valid (already used)
        queryUser queryUs = queryUser.createQueryUSer();
        payload checkEmail = queryUs.checkEmail(email);
        boolean checkUserNameExist = queryUser.createQueryUSer().checkUserNameExist(userName);
        if (checkEmail.isIsSuccess() == true || checkUserNameExist == true) {
            HttpSession session = req.getSession();
            String messageError = checkEmail.isIsSuccess() == true ? "Email đã được sử dụng" : "Tên tài khoản đã được sử dụng";
            session.setAttribute("error", messageError);
            req.getRequestDispatcher("/views/client/pages/authForm.jsp").forward(req, res);
            return;
        }

        // send OTP to gmail user
        queryOTP otp = queryOTP.createInstance();
        final String OTP = randomToken.generateRandomDigitString(8);

        otp.addOtp(userName, email, password, OTP);
        sendMail.sendEmailTo(email, "Your OTP", "your OTP is " + OTP + " it will be exprired in 3 minutes");
        req.getRequestDispatcher("/views/client/pages/OTPFormSignUp.jsp").forward(req, res);
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
