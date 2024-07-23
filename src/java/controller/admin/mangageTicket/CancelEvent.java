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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.queryEvent;
import model.queryLogHistory;
import model.queryUser;
import schema.LogHistory;

/**
 *
 * @author LENOVO
 */
public class CancelEvent extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // private router /admin/ticket/create

        // check permission
        ServletContext servletContext = getServletContext();
        List<String> permission = (List<String>) servletContext.getAttribute("permission");
        if (!permission.contains("delete_ticket")) {
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
            return;
        }
        //end

        // get id event
        String idEvent = req.getParameter("eventID");
        //end

        // get user id
        String token = (String) servletContext.getAttribute("token");
        queryUser qUser = queryUser.createQueryUSer();
        String userId = qUser.getIdByToken(token);
        //end 

        // check event really belong to user
        queryEvent qEvent = queryEvent.createInstance();
        boolean belongEvent = qEvent.checkBelongEvent(idEvent, userId);
        if (!belongEvent) { // not belong to
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
            return;
        }
        //end

        // cancel event
        String redirect = "http://localhost:8080/admin/dashboard/detail/" + idEvent;
        boolean cancelSuccess = qEvent.cancelEvent(idEvent);
        HttpSession session = req.getSession();
        if (cancelSuccess) {
            //add log history
            queryLogHistory qHistory = queryLogHistory.createInstance();
            qHistory.insertLogHistory(new LogHistory(idEvent, userId, "cancel"));
            session.setAttribute("success", "Hủy sự kiện thành công");
            //end
            res.sendRedirect(redirect);
            return;
        }

        session.setAttribute("error", "Hủy sự kiện thất bại");
        //end
        res.sendRedirect(redirect);
        //end

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
