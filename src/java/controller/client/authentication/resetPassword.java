/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.authentication;

import helper.payload;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Optional;
import model.queryUser;

/**
 *
 * @author LENOVO
 */
public class resetPassword extends HttpServlet {

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
            out.println("<title>Servlet resetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPassword at " + request.getContextPath() + "</h1>");
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
        // get new password 
        String newPassword = req.getParameter("password");
        HttpSession session = req.getSession();
        //end

        //get token from cookie and check exist toke(false back to login page)
        Cookie[] cookie = req.getCookies();
        Cookie token = Arrays.stream(cookie).filter(item -> item.getName().equals("token")).findFirst().orElse(null);
        if (token == null) {
            session.setAttribute("error", "Hành động không hợp lệ!");
            res.sendRedirect("views/client/pages/authForm.jsp");
            return;
        }
        // end

        // change password in db
        queryUser querUser = queryUser.createQueryUSer();
        boolean changePasswordStatus = querUser.chagenPassword(token.getValue(), newPassword);
        if (changePasswordStatus == false) {
            session.setAttribute("error", "Đổi mật khẩu thất bại");
            res.sendRedirect("views/client/pages/resetPassword.jsp");
            return;
        }
        session.setAttribute("message", "Đổi mật khẩu thành công, vui lòng đăng nhập lại");
        //end 

        // change status if account provide by admin
        String status = querUser.checkStatusByToke(token.getValue());
        if (status.equals("changePassword")) {
            querUser.changeStatusByToken(token.getValue(), "active");
        }
        //end

        // delete token immediately after change password
        token = new Cookie("token", "");
        token.setMaxAge(0);
        res.addCookie(token);
        //end

        res.sendRedirect("/form");
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
