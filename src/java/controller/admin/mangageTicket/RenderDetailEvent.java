/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.mangageTicket;

import jakarta.servlet.ServletContext;
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
 * @author LENOVO
 */
public class RenderDetailEvent extends HttpServlet {

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
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            // check permission
            ServletContext servletContext = getServletContext();
            List<String> permission = (List<String>) servletContext.getAttribute("permission");
            if (!permission.contains("view_ticket")) {
                res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
                return;
            }
            //end

            // get event id on the url
            String pathInfo = req.getPathInfo();
            String[] pathSegments = pathInfo.split("/");
            String eventId = pathSegments[pathSegments.length - 1];
            //end

            //get detail event from db
            queryEvent qEvent = queryEvent.createInstance();
            Event event = qEvent.getAnEventById(eventId);
            req.setAttribute("event", event);
            res.getWriter().print(event.getImg_event());
            //end

            //get all area of event
            queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
            List<AreaEvent> listArea = qAreaPosition.getAllAreaOfAnEventById(eventId);
            req.setAttribute("area", listArea);
            //end

            // render infor
            req.getRequestDispatcher("/views/admin/pages/event/detailEvent.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println(e);
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
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
