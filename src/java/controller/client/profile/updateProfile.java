/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.profile;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.queryFooter;
import model.queryUser;
import schema.Footer_client;
import schema.InformationUser;

/**
 *
 * @author linhl
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        // get data from client
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("dob");
        String imgUrl = request.getParameter("imgUrl");
        //end

        String redirect = "/client/homepage/updateProfileClient/form";
        //validate 
        HttpSession session = request.getSession();
        if (name == null || address == null || phone == null || birthday == null) {
            session.setAttribute("error", "Dữ liệu không được để trống");
            response.sendRedirect(redirect);
            return;
        }

        if (name.isBlank() || address.isBlank() || phone.isBlank() || birthday.isBlank()) {
            session.setAttribute("error", "Dữ liệu không được để trống");
            response.sendRedirect(redirect);
            return;
        }
        //end

        // get id user
        String token = "";
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            // Kiểm tra tên cookie để tìm token
            if ("token".equals(cookie.getName())) {
                // Lấy giá trị token từ cookie
                token = cookie.getValue();

            }
        }

        queryUser qUser = queryUser.createQueryUSer();

        String idUser = qUser.getIdByToken(token);

        if (idUser.isBlank()) {
            session.setAttribute("error", "Vui lòng đăng nhập");
            response.sendRedirect("/");
            return;
        }

        InformationUser inforUser = new InformationUser(idUser, name, phone, address, birthday, imgUrl);
        qUser.updateUserInformation(inforUser);
        queryFooter query = new queryFooter();
        List<Footer_client> footers = query.getAllFooter();
        request.setAttribute("footers", footers);

        //end 
        session.setAttribute("success", " Cập nhật thành công! ");
        response.sendRedirect(redirect);
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
