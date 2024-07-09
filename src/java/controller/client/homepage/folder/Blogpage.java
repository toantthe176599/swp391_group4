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
import java.util.ArrayList;
import java.util.List;
import model.queryBlog;
import model.queryBlogClient;
import model.queryFooter;
import schema.Blog_client;
import schema.Footer_client;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Blogpage", urlPatterns = {"/blog"})
public class Blogpage extends HttpServlet {

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
        int BLOGS_PER_PAGE = 6;

        // Lấy tham số "page" từ request, nếu không có thì mặc định là 1
        String pageStr = request.getParameter("page");
        int page = 1;
        if (pageStr != null) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                // Nếu không thể parse thành số, giữ giá trị mặc định là 1
                page = 1;
            }
        }

        // Tính toán chỉ số bắt đầu cho trang hiện tại
        int start = (page - 1) * BLOGS_PER_PAGE;

        queryBlogClient qb = new queryBlogClient();
        List<Blog_client> blogs = qb.getAllBlog();
        queryFooter query = new queryFooter();
        List<Footer_client> footers = query.getAllFooter();

        request.setAttribute("footers", footers);

        // Xử lý phân trang
        List<Blog_client> blogsPage = new ArrayList<>();
        if (blogs != null && !blogs.isEmpty()) {
            int end = Math.min(start + BLOGS_PER_PAGE, blogs.size());
            if (start < end) {
                blogsPage = blogs.subList(start, end);
            }
        }

        request.setAttribute("blogsPage", blogsPage);

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) blogs.size() / BLOGS_PER_PAGE);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("/views/client/homepage/Blog_event.jsp").forward(request, response);

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
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
