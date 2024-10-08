/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.permissions;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryPermission;
import model.queryRole;

/**
 *
 * @author LENOVO
 */
public class updatePermission extends HttpServlet {

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
            String[] permission = req.getParameter("permissionlist").split(" ");
            String newrole = req.getParameter("namerole");
            String description = req.getParameter("description");
            String oldRole = req.getParameter("oldrole");
            //end
            
            // get db query and session
            queryPermission qPermission = queryPermission.getInstanceQueryPermision();
            queryRole qRole = queryRole.createInstanceQueryRole();
            HttpSession session = req.getSession();
            //
            
            // check newrole exist
            if (!oldRole.equalsIgnoreCase(newrole)) {
                if (qRole.checkRoleExist(newrole)) {
                    session.setAttribute("error", "Tên nhóm quyền đã tồn tại");
                    res.sendRedirect("/admin/role/edit/form/" + oldRole);
                    return;
                }
            }
            //end

            // update permission to database
            qPermission.updatePermission(newrole, oldRole, description, permission);
            session.setAttribute("success", "Cập nhật thành công!");
            res.sendRedirect("/admin/role/edit/form/" + newrole);
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
