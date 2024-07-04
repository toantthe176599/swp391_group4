/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.mangageTicket;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.queryAreaPosition;
import model.queryCategory;
import model.queryEvent;
import model.queryReportEvent;
import schema.AreaEvent;
import schema.CategoryEvent;
import schema.Event;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class editEventForm extends HttpServlet {

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

        //get idevent
        String pathInfo = req.getPathInfo();
        String[] pathSegments = pathInfo.split("/");
        String eventId = pathSegments[pathSegments.length - 1];
        //end

        // get event
        queryEvent qEvent = queryEvent.createInstance();
        Event event = qEvent.getAnEventById(eventId);
        req.setAttribute("event", event);
        //end

        //get  money for artist
        queryReportEvent qReportEvent = queryReportEvent.createInstanceReportEvent();
        String money = qReportEvent.getMoneyForArtist(eventId);
        req.setAttribute("money", money);
        //end

        // get all category event
        queryCategory qCategory = queryCategory.createInstanceCategory();
        List<CategoryEvent> category = qCategory.getAllCategory();
        req.setAttribute("category", category);
        //end

        //get all area of event
        queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
        List<AreaEvent> listArea = qAreaPosition.getAllAreaOfAnEventById(eventId);
        req.setAttribute("area", listArea);
        //end

        req.getRequestDispatcher("/views/admin/pages/event/editEvent.jsp").forward(req, res);
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
