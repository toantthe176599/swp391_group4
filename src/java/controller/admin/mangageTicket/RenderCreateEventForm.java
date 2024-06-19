/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.mangageTicket;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Locale;
import model.queryCategory;
import schema.CategoryEvent;

/**
 *
 * @author LENOVO
 */
public class RenderCreateEventForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // get all category
        queryCategory qCategory = queryCategory.createInstanceCategory();
        List<CategoryEvent> category = qCategory.getAllCategory();
        req.setAttribute("category", category);
        //end

        req.getRequestDispatcher("/views/admin/pages/event/createTicket.jsp").forward(req, res);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
