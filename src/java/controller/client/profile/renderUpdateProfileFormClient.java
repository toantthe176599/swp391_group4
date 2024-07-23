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
import java.util.List;
import model.queryFooter;
import model.queryUser;
import schema.Footer_client;
import schema.InformationUser;

/**
 *
 * @author linhl
 */
public class renderUpdateProfileFormClient extends HttpServlet {

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
            out.println("<title>Servlet renderUpdateProfileFormClient</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet renderUpdateProfileFormClient at " + request.getContextPath() + "</h1>");
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
        //end 

        //get user information
        InformationUser inforUser = qUser.getInforByID(idUser);

        request.setAttribute("infor", inforUser);
        //end

        queryFooter query = new queryFooter();
        List<Footer_client> footers = query.getAllFooter();
        request.setAttribute("footers", footers);

        request.getRequestDispatcher("/views/client/homepage/update-information.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
