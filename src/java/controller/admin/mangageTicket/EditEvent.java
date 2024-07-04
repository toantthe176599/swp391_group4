package controller.admin.mangageTicket;

import helper.CloudinaryConfig;
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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class EditEvent extends HttpServlet {

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
            String id = req.getParameter("id");
            String namevent = req.getParameter("eventname");
            String title = req.getParameter("title");
            String artist = req.getParameter("artist");
            String organizer = req.getParameter("organizer");
            String description = req.getParameter("description");
            String startTime = req.getParameter("start_time");
            String startDate = req.getParameter("start_date");
            String destination = req.getParameter("destination");
            String status = req.getParameter("status");
            String category = req.getParameter("category");
            String area_quantity = req.getParameter("area_quantity");
            String image_potition_change = req.getParameter("image_potition_change");
            String image_event_change = req.getParameter("image_event_change");
            String money = req.getParameter("money");
            int OriginLength = Integer.parseInt(req.getParameter("originLength"));
            //end
            CloudinaryConfig cloudinary = CloudinaryConfig.createInstance();
            String urlImgEvent = "";

            // upload image if change image
            if (image_event_change.equals("true")) { // change image
                File imageEvent = cloudinary.createFileToUpload(req, "image_event");
                urlImgEvent = cloudinary.uploadImageToCloud(imageEvent);
            }
            String urlImgPosition = "";
            if (image_potition_change.equals("true")) { // change image
                File imageposition = cloudinary.createFileToUpload(req, "image_position");
                urlImgPosition = cloudinary.uploadImageToCloud(imageposition);
            }
            // end 

            // get all area position
            List<AreaEvent> areas = new ArrayList<>();
            int temp = Integer.parseInt(area_quantity);
            int lengthArea = temp > OriginLength ? temp : OriginLength;
            for (int i = 1; i <= lengthArea; i++) {
                String areaName = req.getParameter("name_area_" + i);
                if (areaName != null) {
                    AreaEvent area = new AreaEvent(areaName, req.getParameter("price_" + i), req.getParameter("quantity_" + i), req.getParameter("quantity_" + i));
                    areas.add(area);
                }
            }
            //end 

            // create event object
            Event event = new Event.buildEvent()
                    .setId(id)
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

            //update event
            queryEvent qEvent = queryEvent.createInstance();
            try {
                qEvent.updateEvent(event);
            } catch (ParseException ex) {
                res.getWriter().print(ex);
            }
            //end

            // intialize query area and ticket
            queryAreaPosition qAreaPosition = queryAreaPosition.createInstanceAreaPosition();
            queryTicket qTicket = queryTicket.createInstance();
            //end

            if (status.equals("inactive")) {
                // remove all old ticket and oldarea
                qTicket.deleteTicketByIdEvent(id);
                qAreaPosition.deleteAreaByEventId(id);
                //end

                List<String> idAreas = qAreaPosition.insertArea(areas, id);//update area
                qTicket.insertTicket(idAreas, id);//update ticket

                // update money for artist
                queryReportEvent qReportEvent = queryReportEvent.createInstanceReportEvent();
                qReportEvent.updateMoneyForArtist(id, money);
                //end
            }

            // add log history
            ServletContext servletContext = getServletContext();
            String token = (String) servletContext.getAttribute("token");
            queryLogHistory qHistory = queryLogHistory.createInstance();
            queryUser qUser = queryUser.createQueryUSer();
            qHistory.insertLogHistory(new LogHistory(id, qUser.getIdByToken(token), "update"));
            //end

            // response
            HttpSession session = req.getSession();
            session.setAttribute("success", "Cập nhật thành công");
            res.sendRedirect("/admin/event/edit/form/" + id);
            //end

        } catch (Exception e) {
            res.getWriter().print(e);
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
