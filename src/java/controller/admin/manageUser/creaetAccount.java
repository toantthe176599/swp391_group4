/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.manageUser;

import helper.payload;
import helper.sendMail;
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
public class creaetAccount extends HttpServlet {

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
            out.println("<title>Servlet creaetAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet creaetAccount at " + request.getContextPath() + "</h1>");
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
        String username = req.getParameter("userName");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String role = req.getParameter("role");
        HttpSession session = req.getSession();
        // check mail exist
        queryUser queryUs = queryUser.createQueryUSer();
        payload checkEmailExist = queryUs.checkEmail(email);
        if (checkEmailExist.isIsSuccess()) {

            session.setAttribute("error", "Email này đã được sử dụng");
            res.sendRedirect("/admin/account/create/form");
            return;
        }
        payload createAccount = queryUs.insertByAdmin(email, username, password, role);
        if (!createAccount.isIsSuccess()) {

            session.setAttribute("error", "Tạo tài khoản thất bại!");
            res.sendRedirect("/admin/account/create/form");
            return;
        }
        sendMail.sendEmailTo(email, "Tài khoản được cấp của bạn", "Tên đăng nhập: " + username + " <br/> Mật khẩu: " + password);
        session.setAttribute("success", "Tạo tài khoản thành công");
        res.sendRedirect("/admin/account/create/form");
//        res.getWriter().print(role);
//        res.getWriter().print(username);
//        res.getWriter().print(password);
//        res.getWriter().print(email);

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
