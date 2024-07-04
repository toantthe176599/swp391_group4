/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.Blog;

import helper.CloudinaryConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import model.queryBlog;
import schema.Blog;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class EditBlog extends HttpServlet {

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
        try {
            // get data from client

            HttpSession session = req.getSession();
            String idBlog = req.getParameter("id");
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            String author = req.getParameter("author");
            String startDate = req.getParameter("start_date");
            String status = req.getParameter("status");
            String redirect = "/admin/blog/edit/form/" + idBlog;
            boolean changeImage = Boolean.parseBoolean(req.getParameter("image_blog_change"));
            //end

            //upimg to cloudinary 
            String urlImgEvent = "";
            if (changeImage) {
                CloudinaryConfig cloudinary = CloudinaryConfig.createInstance();
                File imageEvent = cloudinary.createFileToUpload(req, "image_blog");
                urlImgEvent = cloudinary.uploadImageToCloud(imageEvent);
            }

            // end   
            // check blog exist
            queryBlog qBlog = queryBlog.createInstance();
            boolean existBlog = qBlog.checkExistBlog(idBlog);
            if (!existBlog) {
                session.setAttribute("error", "Bài viết không tồn tại");
                res.sendRedirect("/admin/blog");
                return;
            }
            //end

            // update blog
            Blog blog = new Blog(idBlog, title, content, author, startDate, urlImgEvent, status, "");
            qBlog.updateBlog(blog);
            session.setAttribute("success", "Cập nhật thành công");
            res.sendRedirect(redirect);
            //end
        } catch (Exception e) {
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
        }
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
