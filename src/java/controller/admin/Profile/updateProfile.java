/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.Profile;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.queryUser;
import schema.InformationUser;

/**
 *
 * @author LENOVO
 */
public class updateProfile extends HttpServlet {

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
        // get data from client
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String birthday = req.getParameter("birthday");
        String imgUrl = req.getParameter("imgUrl");
        //end

        String redirect = "/admin/profile/update/form";
        //validate 
        HttpSession session = req.getSession();
        if (name == null || address == null || phone == null || birthday == null) {
            session.setAttribute("error", "Dữ liệu không được để trống");
            res.sendRedirect(redirect);
            return;
        }

        if (name.isBlank() || address.isBlank() || phone.isBlank() || birthday.isBlank()) {
            session.setAttribute("error", "Dữ liệu không được để trống");
            res.sendRedirect(redirect);
            return;
        }
        //end

        // get id user
        ServletContext servletContext = getServletContext();
        String token = (String) servletContext.getAttribute("token");
        queryUser qUser = queryUser.createQueryUSer();
        String idUser = qUser.getIdByToken(token);
        InformationUser inforUser = new InformationUser(idUser, name, phone, address, birthday, imgUrl);
        qUser.updateUserInformation(inforUser);
        //end 
        session.setAttribute("success", "Cập nhật thành công");
        res.sendRedirect(redirect);
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
