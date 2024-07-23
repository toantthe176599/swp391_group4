/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.event;

import helper.EmailSender;
import helper.randomToken;
import helper.sendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.queryAreaPosition;
import model.queryBooking;
import model.queryEvent;
import model.queryFooter;
import model.queryTicket;
import model.queryUser;
import schema.AreaEvent;
import schema.Booking;
import schema.Event;
import schema.Footer_client;
import schema.account;

/**
 *
 * @author HP
 */
@WebServlet(name = "PaymentCallback", urlPatterns = {"/PaymentCallback"})
public class PaymentCallback extends HttpServlet {

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
            out.println("<title>Servlet PaymentCallback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentCallback at " + request.getContextPath() + "</h1>");
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
    protected synchronized void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // check login 
        String token2 = "";
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            // Kiểm tra tên cookie để tìm token
            if ("token".equals(cookie.getName())) {
                // Lấy giá trị token từ cookie
                token2 = cookie.getValue();

            }
        }

        // footer
        queryFooter query = new queryFooter();
        List<Footer_client> footers = query.getAllFooter();
        request.setAttribute("footers", footers);
        //end

        queryUser qUser = queryUser.createQueryUSer();
        String idUser = qUser.getIdByToken(token2);
        //end 
        HttpSession session = request.getSession();
        if (idUser.isBlank()) {
            session.setAttribute("error", "Vui lòng đăng nhập");
            response.sendRedirect("/");
            return;
        }

        //end check login
        List<Booking> bookings = new ArrayList<>();
        queryEvent queryEventDao = queryEvent.createInstance();
        queryBooking bookingDao = queryBooking.createInstanceBooking();
        queryAreaPosition ereaDao = queryAreaPosition.createInstanceAreaPosition();
        List<AreaEvent> listArea = (List<AreaEvent>) session.getAttribute("listArea");
        String eventId = (String) session.getAttribute("eventId");
        bookings = (List<Booking>) session.getAttribute("bookings");
        Event event = queryEventDao.getAnEventById(eventId);
        String transactionStatus = request.getParameter("vnp_TransactionStatus");
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
        if ("00".equals(transactionStatus)) {
            for (Booking book : bookings) {
                String tokenBooking = randomToken.generateToken(25);
                book.setBookingId(tokenBooking);
                queryTicket qTicket = queryTicket.createInstance();
                String areaId = (book.getAreaId() + "");
                String eventIdString = (eventId + "");
                String idTicket = qTicket.addTicket(eventIdString, areaId);
                book.setTicketId(idTicket);
                bookingDao.insertBooking(book);
                ereaDao.decreaseQuantity(areaId, book.getQuantity());
            }
            sendMail sendMail = new sendMail();
            EmailSender emailSend = new EmailSender();
            String template = emailSend.emailConfirmBooking(bookings, "Xác nhận vé", event, accountLogin);
            sendMail.sendEmailToTicket(accountLogin.getEmail(), "Confirm Ticket", template);
            request.getRequestDispatcher("/views/client/homepage/booking-success.jsp").forward(req, res);
            session.removeAttribute("bookings");
            session.removeAttribute("listArea");
            session.removeAttribute("eventId");
            return;
        }

        request.getRequestDispatcher("/views/client/homepage/booking-success.jsp").forward(req, res);
        session.removeAttribute("bookings");
        session.removeAttribute("listArea");
        session.removeAttribute("eventId");
        request.getRequestDispatcher("/views/client/homepage/booking-fail.jsp").forward(req, res);
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
