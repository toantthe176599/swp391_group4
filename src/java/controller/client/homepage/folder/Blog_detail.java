/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.client.homepage.folder;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.queryBlog;
import model.queryFooter;
import schema.client.Blog_client;
import schema.Footer_client;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="Blog_detail", urlPatterns={"/blogdetail"})
public class Blog_detail extends HttpServlet {
   
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
            out.println("<title>Servlet Blog_detail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Blog_detail at " + request.getContextPath () + "</h1>");
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
    String blogId = request.getParameter("blog_id");
     queryFooter query = new queryFooter();
        
        List<Footer_client> footers = query.getAllFooter();

        request.setAttribute("footers", footers);
        if (blogId == null || blogId.isEmpty()) {
            // Nếu không có blog_id, gửi lỗi Bad Request
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Blog ID is missing.");
            return;
        }

        // Gọi model để lấy thông tin blog
        queryBlog queryBlog = new queryBlog();
        Blog_client blog = queryBlog.getBlogById(blogId);

        if (blog == null) {
            // Nếu không tìm thấy blog, không gửi lỗi 404 mà chỉ forward về JSP với thông báo
            request.setAttribute("errorMessage", "Blog not found for ID: " + blogId);
            request.getRequestDispatcher("/views/client/homepage/Blog_detail.jsp").forward(request, response);
            return;
        }

        // Nếu tìm thấy blog, set attribute và forward về JSP để hiển thị
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("/views/client/homepage/Blog_detail.jsp").forward(request, response);
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
        processRequest(request, response);
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
