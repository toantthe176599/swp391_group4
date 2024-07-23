/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.event;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.queryBooking;
import model.queryEventClient;
import model.queryFooter;
import model.queryUser;
import schema.Booking;
import schema.Footer_client;
import schema.account;

/**
 *
 * @author HP
 */
@WebServlet(name = "HistoryTicketController", urlPatterns = {"/history-ticket"})
public class HistoryTicketController extends HttpServlet {

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
            out.println("<title>Servlet HistoryTicketController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HistoryTicketController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        queryFooter query = new queryFooter();
        List<Footer_client> footers = query.getAllFooter();
        request.setAttribute("footers", footers);

        try {
            Cookie cookie[] = request.getCookies();
            String token = "";
            for (Cookie i : cookie) {
                if (i.getName().equals("token")) {
                    token = i.getValue();
                }
            }
            queryUser queryUserDao = queryUser.createQueryUSer();
            String accountId = queryUserDao.getIdByToken(token);

            if (!accountId.isBlank()) {
                queryBooking bookingDao = queryBooking.createInstanceBooking();
                List<Booking> bookings = bookingDao.getAllBookingsByCustomer(accountId);

                request.setAttribute("booking", bookings);
                request.getRequestDispatcher("./views/client/homepage/history-ticket.jsp").forward(request, response);

            } else {
                session.setAttribute("error", "Vui lòng đăng nhập");
                response.sendRedirect("/");
            }
        } catch (Exception e) {
            session.setAttribute("error", "Vui lòng đăng nhập");
            response.sendRedirect("/");
            System.out.println(e);
        }
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
        processRequest(request, response);
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
