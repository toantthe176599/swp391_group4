/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.Category;

import helper.payload;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryCategory;
import schema.CategoryEvent;

/**
 *
 * @author LENOVO
 */
public class EditCategoryForm extends HttpServlet {

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
        String categoryId = pathSegments[pathSegments.length - 1];
        //end get url form url 

        //get category information
        queryCategory qCategory = queryCategory.createInstanceCategory();
        payload categoryExist = qCategory.getCategoryByID(categoryId);
        HttpSession session = req.getSession();
        if (categoryExist.isIsSuccess() == false) { // if category not exist
            session.setAttribute("error", categoryExist.getDescription());
            res.sendRedirect("/admin/category");
            return;
        }

        CategoryEvent category = (CategoryEvent) categoryExist.getObject();
        req.setAttribute("category", category);
        req.getRequestDispatcher("/views/admin/pages/category/Edit.jsp").forward(req, res);
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
