/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.authentication;

import config.GoogleInfomation;
import helper.GoogleAuthentication;
import helper.payload;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import model.queryPermission;
import model.queryUser;
import schema.GoogleUser;
import schema.account;

/**
 *
 * @author LENOVO
 */
public class loginWithGG extends HttpServlet {

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
            out.println("<title>Servlet loginWithGG</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginWithGG at " + request.getContextPath() + "</h1>");
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
            String code = req.getParameter("code");

            String accessToken = GoogleAuthentication.getToken(code, GoogleInfomation.GOOGLE_REDIRECT_URL_LOGIN);
            System.out.println(accessToken);
            GoogleUser user = GoogleAuthentication.getUserInfo(accessToken);
            queryUser querUser = queryUser.createQueryUSer();
            payload checkEmailStatus = querUser.checkEmail(user.getEmail());
            HttpSession session = req.getSession();
            if (checkEmailStatus.isIsSuccess() == false) {

                session.setAttribute("error", "Tài khoản không tồn tại!");
                res.sendRedirect("/form");
                return;
            }
            account informationUser = (account) checkEmailStatus.getObject();
            String token = informationUser.getToken();
            // check email exist if not go back send message else go to home page
            String status = querUser.checkStatusByToke(token);
            if (status.equals("inactive")) {

                session.setAttribute("error", "Tài khoản đã bị khóa!");
                res.sendRedirect("/form");
                return;
            }

            Cookie cookie = new Cookie("token", token);
            cookie.setMaxAge(-1);
            res.addCookie(cookie);
            String role = queryUser.createQueryUSer().checkRoleByToken(token);
            if (role != null && !role.trim().equals("customer")) {

                res.sendRedirect("/admin/account");
                return;
            }
            res.sendRedirect("/homepage");

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
     *
     *
     * /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
