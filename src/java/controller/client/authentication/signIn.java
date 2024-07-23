/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.authentication;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import model.queryPermission;
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
        // get data from client 
        String email = req.getParameter("Username");
        String password = req.getParameter("Password");
        String remember = req.getParameter("remember");
        //end

        // check username and password is correct
        queryUser qrUser = queryUser.createQueryUSer();

        String token = qrUser.checkLogintWithRegularAccount(email, password);
        HttpSession session = req.getSession();
        if (token.equals("")) { // false redirect to login page with message
            session.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
            res.sendRedirect("/form");
            return;
        }

        //end
        // check account active
        String status = qrUser.checkStatusByToke(token);
        if (status.equals("inactive")) { // inacvie redirect back

            session.setAttribute("error", "Tài khoản đã bị khóa!");
            res.sendRedirect("/form");
            return;
        }

        if (status.equals("deleted")) { // deleted account

            session.setAttribute("error", "Tài khoản đã bị xóa!");
            res.sendRedirect("/form");
            return;
        }

        // handle remember me
        Cookie cookie = new Cookie("token", token);
        if (remember == null) {
            cookie.setMaxAge(-1);
        } else {
            cookie.setMaxAge(2592000);
        }
        res.addCookie(cookie);
        //end

        // check status changepassowrd
        if (status.equals("changePassword")) {
            req.getRequestDispatcher("/views/client/pages/resetPassword.jsp").forward(req, res);
            return;
        }

        //end
        // check role
        String role = queryUser.createQueryUSer().checkRoleByToken(token);

        if (role != null && !role.trim().equals("customer")) {

            res.sendRedirect("/admin/dashboard");
            return;
        }
        // end

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
