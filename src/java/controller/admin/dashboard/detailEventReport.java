/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.dashboard;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.queryReportEvent;
import schema.ReportEvent;
import schema.ReportEventRevenue;

/**
 *
 * @author LENOVO
 */
public class detailEventReport extends HttpServlet {

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

            // get id event from url
            String pathInfo = req.getPathInfo();
            String[] pathSegments = pathInfo.split("/");
            String eventId = pathSegments[pathSegments.length - 1];
            //end  

            // get detail report for an event
            queryReportEvent qReportEvent = queryReportEvent.createInstanceReportEvent(); // get detail
            ReportEvent reportEvent = qReportEvent.detailReportForAnEvent(eventId);

            ReportEventRevenue reportMoney = qReportEvent.getReportMoneyOfEvent(eventId);

            reportMoney.setCurrentMoney(reportEvent.getListArea());

            req.setAttribute("report", reportEvent);
            req.setAttribute("money", reportMoney);
            // end

            req.getRequestDispatcher("/views/admin/pages/Dashboard/detail.jsp").forward(req, res);
        } catch (Exception e) {
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
