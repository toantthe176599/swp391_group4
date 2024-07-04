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
public class DeleteCategory extends HttpServlet {

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
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            // check permission
            HttpSession session = req.getSession();
            ServletContext servletContext = getServletContext();

            List<String> permission = (List<String>) servletContext.getAttribute("permission");
            if (!permission.contains("delete_category")) {
                res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
                return;
            }
            //end
            String urlRedirect = "/admin/category";

            // get id from url
            String pathInfo = req.getPathInfo();
            String[] pathSegments = pathInfo.split("/");
            String categoryId = pathSegments[pathSegments.length - 1];
            //end get url form url 

            queryCategory qCategory = queryCategory.createInstanceCategory();

            // delete category
            boolean deleteCategory = qCategory.removeCategory(categoryId);
            if (!deleteCategory) {
                session.setAttribute("error", "Đang có sự kiện hoạt động tại loại sự kiện này");
                res.sendRedirect(urlRedirect);
                return;
            }

            session.setAttribute("success", "Xóa loại sự kiện thành công");
            res.sendRedirect(urlRedirect);
            //end 
        } catch (Exception e) {
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
