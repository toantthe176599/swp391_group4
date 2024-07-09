/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.mangageTicket;

import helper.CloudinaryConfig;
import helper.payload;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.queryAreaPosition;
import model.queryEvent;
import model.queryLogHistory;
import model.queryReportEvent;
import model.queryTicket;
import model.queryUser;
import schema.AreaEvent;
import schema.Event;
import schema.LogHistory;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class createEvent extends HttpServlet {

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
        try {
            // get data from client
            String namevent = req.getParameter("eventname");
            String title = req.getParameter("title");
            String artist = req.getParameter("artist");
            String organizer = req.getParameter("organizer");
            String description = req.getParameter("description");
            String startTime = req.getParameter("start_time");
            String startDate = req.getParameter("start_date");
            String destination = req.getParameter("destination");
            String category = req.getParameter("category");
            String area_quantity = req.getParameter("area_quantity");
            String status = req.getParameter("status");
            String moneyForArtist = req.getParameter("money");
            //upimg to cloudinary 
            CloudinaryConfig cloudinary = CloudinaryConfig.createInstance();
            File imageEvent = cloudinary.createFileToUpload(req, "image_event");
            String urlImgEvent = cloudinary.uploadImageToCloud(imageEvent);
            File imageposition = cloudinary.createFileToUpload(req, "image_position");
            String urlImgPosition = cloudinary.uploadImageToCloud(imageposition);
            // end    

            // get all area position
            List<AreaEvent> areas = new ArrayList<>();
            for (int i = 1; i <= Integer.parseInt(area_quantity); i++) {
                AreaEvent area = new AreaEvent(req.getParameter("name_area_" + i), req.getParameter("price_" + i), req.getParameter("quantity_" + i), req.getParameter("quantity_" + i));
                areas.add(area);
            }
            //end 

            // create event
            Event event = new Event.buildEvent()
                    .setName(namevent)
                    .setTitle(title)
                    .setArtist(artist)
                    .setOrganizer(organizer)
                    .setDescription(description)
                    .setStartTime(startTime)
                    .setStartDate(startDate)
                    .setDestination(destination)
                    .setStatus(status)
                    .setCategory(category)
                    .setArea_quantity(area_quantity)
                    .setAreas(areas)
                    .setImgEvent(urlImgEvent)
                    .setImgPosition(urlImgPosition)
                    .build();
            //end

            //insert event to db
            queryEvent qEvent = queryEvent.createInstance();
            payload resultCreateEvent = qEvent.createEvent(event);
            //end

            //insert area to db
            String eventId = (String) resultCreateEvent.getObject();
            queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
            List<String> listIdArea = qAreaPosition.insertArea(areas, eventId);
            //end

            // insert ticket 
            queryTicket qTicket = queryTicket.createInstance();
            qTicket.insertTicket(listIdArea, eventId);
            //end

            // insert money for artsit
            queryReportEvent qReportEvent = queryReportEvent.createInstanceReportEvent();
            qReportEvent.insertMoneyForArtist(eventId, moneyForArtist);
            //end

            //send message and redirect
            HttpSession session = req.getSession();
            if (resultCreateEvent.isIsSuccess()) {
                // add log history
                ServletContext servletContext = getServletContext();
                String token = (String) servletContext.getAttribute("token");
                queryLogHistory qHistory = queryLogHistory.createInstance();
                queryUser qUser = queryUser.createQueryUSer();
                qHistory.insertLogHistory(new LogHistory(eventId, qUser.getIdByToken(token), "create"));
                //end
                if (status.equals("inactive")) {
                    session.setAttribute("success", resultCreateEvent.getDescription());
                } else {
                    session.setAttribute("success", "Tạo sự kiện thành công");
                }
                res.sendRedirect("/admin/event/create/form");
                return;
            }

            session.setAttribute("error", resultCreateEvent.getDescription());
            res.sendRedirect("/admin/event/create/form");
            //end
        } catch (Exception e) {
            // error
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
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
