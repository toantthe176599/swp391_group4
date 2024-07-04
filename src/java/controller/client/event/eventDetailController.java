/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.event;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.queryAreaPosition;
import model.queryEvent;
import schema.AreaEvent;
import schema.Event;

/**
 *
 * @author Admin
 */
public class eventDetailController extends HttpServlet {

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
            out.println("<title>Servlet eventDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet eventDetailController at " + request.getContextPath() + "</h1>");
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
//       String pathInfo = request.getPathInfo();
//            String[] pathSegments = pathInfo.split("/");
//            Stringe eventId = pathSegments[pathSegments.length - 1];
        //end

        //get detail event from db
        // Lấy eventId từ request parameter
        String eventId = request.getParameter("eventId");

      

            //get detail event from db
            queryEvent qEvent = queryEvent.createInstance();
            Event event = qEvent.getAnEventById(eventId);
            request.setAttribute("event", event);
            response.getWriter().print(event.getImg_event());
            response.getWriter().print(event.getImg_position());
            

            //get all area of event
            queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
            List<AreaEvent> listArea = qAreaPosition.getAllAreaOfAnEventById(eventId);
            request.setAttribute("area", listArea);
            //end

        // Chuyển tiếp yêu cầu tới JSP để hiển thị thông tin sự kiện và vùng
        request.getRequestDispatcher("/views/client/homepage/eventDetailClient.jsp").forward(request, response);
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
