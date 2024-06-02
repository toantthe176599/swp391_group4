/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.manageUser;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryUser;

/**
 *
 * @author LENOVO
 */
public class deleteAccount extends HttpServlet {

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
            out.println("<title>Servlet deleteAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteAccount at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String[] pathSegments = pathInfo.split("/");
        String id = pathSegments[pathSegments.length - 1];

        queryUser queryUS = queryUser.createQueryUSer();
        boolean deleteAccount = queryUS.deleteAccountById(id);
        HttpSession session = req.getSession();
        if (!deleteAccount) {
            session.setAttribute("error", "Không thể xóa tài khoản này!");
            res.sendRedirect("/admin/account");
            return;
        }
        
        session.setAttribute("success", "Xóa tài khoản thành công!");
        res.sendRedirect("/admin/account");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
