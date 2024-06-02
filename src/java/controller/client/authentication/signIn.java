/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryUser;

/**
 *
 * @author LENOVO
 */
public class signIn extends HttpServlet {

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
            out.println("<title>Servlet signIn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signIn at " + request.getContextPath() + "</h1>");
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
        String email = req.getParameter("Username");
        String password = req.getParameter("Password");
        String remember = req.getParameter("remember");
        queryUser qrUser = queryUser.createQueryUSer();
        String token = qrUser.checkLogintWithRegularAccount(email, password);
        HttpSession session = req.getSession();
        if (token.equals("")) {

            session.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            res.sendRedirect("/form");
            return;
        }

        // check account active
        String status = qrUser.checkStatusByToke(token);
        if (status.equals("inactive")) {

            session.setAttribute("error", "Tài khoản đã bị khóa!");
            res.sendRedirect("/form");
            return;
        }

        Cookie cookie = new Cookie("token", token);
        if (remember == null) {
            cookie.setMaxAge(-1);
        } else {
            cookie.setMaxAge(2592000);
        }
        res.addCookie(cookie);
        String role = queryUser.createQueryUSer().checkRoleByToken(token);
        if (role != null && !role.trim().equals("customer")) {
            res.sendRedirect("/admin/account");
            return;
        }
        
        res.sendRedirect("/homepage");
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
