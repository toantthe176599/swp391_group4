/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.client.homepage.folder;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.queryEvent;
import model.queryEventClient;
import model.queryFooter;
import schema.Category_client;
import schema.Event_client;
import schema.Footer_client;

/**
 *
 * @author LENOVO
 */
public class homepage extends HttpServlet {

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
        queryEventClient queryEvent = new queryEventClient();
        List<Event_client> events = queryEvent.getAllEvent();
        String categoryId = request.getParameter("category_id");
        String monthParam = request.getParameter("month");
        queryFooter query = new queryFooter();
        List<Footer_client> footers = query.getAllFooter();
        request.setAttribute("footers", footers);

        // Lấy danh sách thể loại
        List<Category_client> categories = queryEvent.getAllCategory();
        request.setAttribute("categories", categories);

        if (categoryId != null && !categoryId.isEmpty() && monthParam != null && !monthParam.isEmpty()) {
            try {
                int month = Integer.parseInt(monthParam);
                events = queryEvent.getEventsByMonthAndCategory(month, categoryId);
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ nếu monthParam không phải số nguyên hợp lệ
                events = queryEvent.getAllEvent(); // Lấy tất cả sự kiện
            }
        } else if (categoryId != null && !categoryId.isEmpty()) {
            // Nếu chỉ có categoryId được chọn
            events = queryEvent.getAllEventsByCateID(categoryId);
        } else if (monthParam != null && !monthParam.isEmpty()) {
            // Nếu chỉ có month được chọn
            try {
                int month = Integer.parseInt(monthParam);
                events = queryEvent.getAllEventsByMonth(month);
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ nếu monthParam không phải số nguyên hợp lệ
                events = queryEvent.getAllEvent(); // Lấy tất cả sự kiện
            }
        }

        // Phân trang
        int page = 1;
        int eventsPerPage = 6; // Số lượng sự kiện trên mỗi trang
        int totalPages = (int) Math.ceil((double) events.size() / eventsPerPage);

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
                // Kiểm tra xem page có nằm trong khoảng từ 1 đến totalPages không
                if (page < 1 || page > totalPages) {
                    // Nếu không, chuyển hướng về trang chủ hoặc trang mặc định khác
                    request.getRequestDispatcher("/views/client/homepage/HomePage.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ nếu page không phải số nguyên hợp lệ
                page = 1; // Đặt lại page về 1
            }
        }

        // Tính toán chỉ số bắt đầu, kết thúc cho phân trang
        int startIndex = (page - 1) * eventsPerPage;
        int endIndex = Math.min(startIndex + eventsPerPage, events.size());

        // Đảm bảo startIndex và endIndex hợp lệ
        if (startIndex < 0) {
            startIndex = 0;
        }
        if (endIndex > events.size()) {
            endIndex = events.size();
        }

        // Lấy danh sách sự kiện cho trang hiện tại
        List<Event_client> eventsOnPage = events.subList(startIndex, endIndex);

        // Đặt các thuộc tính vào request để truyền sang JSP
        request.setAttribute("events", eventsOnPage);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Chuyển tiếp request và response sang JSP để hiển thị
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/client/homepage/HomePage.jsp");
        dispatcher.forward(request, response);
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
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        //        res.sendRedirect("/views/client/homepage/HomePage.jsp");
        //        req.getRequestDispatcher("/views/client/homepage/HomePage.jsp").forward(req, res);
        processRequest(req, res);
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
