/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.Blog;

import helper.payload;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryBlog;
import schema.Blog;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author LENOVO
 */
public class EditBlogForm extends HttpServlet {

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
        String blogId = pathSegments[pathSegments.length - 1];
        //end get url form url 
        res.getWriter().print(blogId);

        // get detail blog
        HttpSession session = req.getSession();
        queryBlog qBlog = queryBlog.createInstance();
        payload detailBlog = qBlog.getBlogById(blogId);
        if (detailBlog.isIsSuccess() == false) {
            session.setAttribute("error", "Bài viết không tồn tại");
            res.sendRedirect("/admin/blog");
            return;
        }
        //end

        Blog blog = (Blog) detailBlog.getObject();
        // Định dạng ban đầu
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        // Định dạng đầu ra
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Chuyển đổi chuỗi sang LocalDate
        LocalDate date = LocalDate.parse(blog.getStartDate(), inputFormatter);

        // Chuyển đổi LocalDate sang chuỗi với định dạng mới
        String formattedDate = date.format(outputFormatter);
        blog.setStartDate(formattedDate);
        req.setAttribute("blog", blog);
        req.getRequestDispatcher("/views/admin/pages/blog/EditBlog.jsp").forward(req, res);
        //end
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
