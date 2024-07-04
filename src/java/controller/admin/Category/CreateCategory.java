/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.Category;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.queryCategory;

/**
 *
 * @author LENOVO
 */
public class CreateCategory extends HttpServlet {

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

        // check permission
        HttpSession session = req.getSession();
        ServletContext servletContext = getServletContext();
        List<String> permission = (List<String>) servletContext.getAttribute("permission");
        if (!permission.contains("add_category")) {
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
            return;
        }
        //end

        // get category from client
        String category = req.getParameter("categoryDescription");
        //end
        // validate category
        if (category.isBlank()) {
            session.setAttribute("error", "Tên sự kiện không được để trống");
            res.sendRedirect("/admin/category/create/form");
            return;
        }
        //end

        // check exist category
        queryCategory qCategory = queryCategory.createInstanceCategory();
        boolean existCategory = qCategory.checkExistCategory(category);
        //end

        // send message if category exist
        if (existCategory) {
            session.setAttribute("error", "Loại sự kiện đã tồn tại");
            res.sendRedirect("/admin/category/create/form");
            return;
        }
        //end

        // insert new category to db and send success message
        qCategory.addNewCat(category);
        session.setAttribute("success", "Tạo loại sự kiện thành công");
        //end
        res.sendRedirect("/admin/category/create/form");
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
