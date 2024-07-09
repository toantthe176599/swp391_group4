@@ -1,58 +1,90 @@
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
import java.util.ArrayList;
import java.util.List;
import model.queryBooking;
import schema.ReportTransaction;
/**
 *
 * @author LENOVO
 */
public class renderTransactionDashboard extends HttpServlet {
   
    
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
   
      String pathInfo = req.getPathInfo();
        String[] pathSegments = pathInfo.split("/");
        String eventId = pathSegments[pathSegments.length - 1];
        
        // get detail transaction
        queryBooking qBooking = queryBooking.createInstanceBooking();
        List<ReportTransaction> reportTran = qBooking.getBookingByEvent(eventId);
               
         // Phân trang
        int pageSize = 3; // Số lượng bản ghi trên mỗi trang
        int page;
        String pageStr = req.getParameter("page");
        if (pageStr == null) {
            page = 1; // Mặc định là trang đầu tiên
        } else {
            page = Integer.parseInt(pageStr);
        }
        int totalRecords = reportTran.size();
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, totalRecords);
        List<ReportTransaction> paginatedList = reportTran.subList(start, end);
        req.setAttribute("report", paginatedList);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/views/admin/pages/Dashboard/transaction.jsp").forward(req, res);
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
