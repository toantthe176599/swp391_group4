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
import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;
import model.queryAreaPosition;
import model.queryUser;
import schema.AreaEvent;
import schema.Booking;
import schema.account;

/**
 *
 * @author HP
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        String eventId = request.getParameter("eventId");
        try {
            queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
            List<AreaEvent> listArea = qAreaPosition.getAllAreaOfAnEventById(eventId);
            HttpSession session = request.getSession();
            int totalPay = 0;
            int index = 0;
            List<Booking> bookings = new ArrayList<>();
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            Cookie cookie[] = request.getCookies();

            String token = "";
            for (Cookie i : cookie) {
                if (i.getName().equals("token")) {
                    token = i.getValue();
                }
            }
            queryUser queryUserDao = queryUser.createQueryUSer();
            account accountLogin = queryUserDao.getUserByToken(token);
            for (AreaEvent areaEvent : listArea) {
                String quantity = request.getParameter("quantityInput-" + index);
                int quantityNumber = Integer.parseInt(quantity);
                if (quantityNumber > 0) {
                    Booking book = new Booking();
                    int price = Integer.parseInt(areaEvent.getPrice());
                    int totalInBook = price * quantityNumber;
                    book.setAccountId(Integer.parseInt(accountLogin.getId()));
                    book.setQuantity(quantityNumber);
                    book.setTotalAmount(totalInBook);
                    book.setAreaId(Integer.parseInt(areaEvent.getId()));
                    book.setPaymentMethod("vnpay");
                    totalPay += (price * quantityNumber);
                    bookings.add(book);
                }
                index++;
            }
            session.setAttribute("bookings", bookings);
            session.setAttribute("listArea", listArea);
            session.setAttribute("eventId", eventId);
            response.sendRedirect("vnpay?amount=" + totalPay);
        } catch (Exception e) {
            response.sendRedirect("areaDetailController?eventId=" + eventId);
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
