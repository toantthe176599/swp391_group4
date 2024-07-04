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
public class EditCategory extends HttpServlet {

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
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // check permission
        HttpSession session = req.getSession();
        ServletContext servletContext = getServletContext();
        List<String> permission = (List<String>) servletContext.getAttribute("permission");
        if (!permission.contains("edit_category")) {
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
            return;
        }
        //end

        // validate data
        String idCategory = req.getParameter("categoryId");
        String description = req.getParameter("description");
        String urlRedirect = "/admin/category/edit/form/" + idCategory;
        //end
        if (description.isBlank()) {
            session.setAttribute("error", "Loại sự kiện không được để trống");
            res.sendRedirect(urlRedirect);
            return;
        }

        queryCategory qCategory = queryCategory.createInstanceCategory();
        // check exist cat 
        boolean checkExistCat = qCategory.checkExistCategory(description);
        if (checkExistCat) { // exist
            session.setAttribute("error", "Loại sự kiện đã tồn tại");
            res.sendRedirect(urlRedirect);
            return;
        }
        //end 

        // update cat
        boolean updateCategory = qCategory.editCategory(idCategory, description);
        if (!updateCategory) {
            session.setAttribute("error", "Update không thành công");
            res.sendRedirect(urlRedirect);
            return;
        }
        //end

        session.setAttribute("success", "Cập nhật thành công");
        res.sendRedirect(urlRedirect);

    }

}
