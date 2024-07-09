/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.footer;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.queryFooter;
import schema.Footer_client;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="FooterServlet", urlPatterns={"/admin/footer"})
public class FooterServlet extends HttpServlet {
     private static final long serialVersionUID = 1L;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet FooterServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FooterServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         queryFooter queryFooter = new queryFooter();
        List<Footer_client> footers = queryFooter.getAllFooter();
        request.setAttribute("footers", footers);
        request.getRequestDispatcher("views/admin/pages/website/website.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String id = request.getParameter("id");
        String address = request.getParameter("address");
        String useful_links = request.getParameter("useful_links");
        String working_hours = request.getParameter("working_hours");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String facebook = request.getParameter("facebook");
        String zalo = request.getParameter("zalo");

        queryFooter queryFooter = new queryFooter();
        queryFooter.updateFooter(id, address, useful_links, working_hours, phone_number, email, facebook, zalo);

        // Redirect back to doGet to fetch updated data
        response.sendRedirect(request.getContextPath() + "/admin/footer");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
