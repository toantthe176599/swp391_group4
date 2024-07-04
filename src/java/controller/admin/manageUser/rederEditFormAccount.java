/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.manageUser;

import helper.payload;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;
import model.queryPermission;
import model.queryUser;
import schema.account;

/**
 *
 * @author LENOVO
 */
public class rederEditFormAccount extends HttpServlet {

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
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // get id from url
        String pathInfo = req.getPathInfo();
        String[] pathSegments = pathInfo.split("/");
        String id = pathSegments[pathSegments.length - 1];
        //end get url form url 

        // find user by id (true: redirect to edit form with account; False: back to the account list)
        queryUser queUser = queryUser.createQueryUSer();
        payload findAccountById = queUser.findById(id);
        HttpSession session = req.getSession();
        if (!findAccountById.isIsSuccess()) {
            session.setAttribute("error", "Tài khoản không tồn tại!");
            res.sendRedirect("/admin/account");
            return;
        }

        // get all role
        queryPermission queryPer = queryPermission.getInstanceQueryPermision();
        Map<String, String> role = queryPer.getAllRole();
        //end get all role
        req.setAttribute("role", role);
        req.setAttribute("account", (account) findAccountById.getObject());
        req.getRequestDispatcher("/views/admin/pages/account/editUserForm.jsp").forward(req, res);
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
