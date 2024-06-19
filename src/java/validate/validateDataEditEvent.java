/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package validate;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class validateDataEditEvent implements Filter {

    private static final boolean debug = true;

    private static final Pattern LETTER_PATTERN = Pattern.compile(".*[a-zA-Z].*");

    public static boolean isValidString(String input) {
        // Check if the string contains at least one letter
        boolean containsLetter = LETTER_PATTERN.matcher(input).matches();
        // Check if the string contains at least one number

        // A valid string must contain at least one letter
        // It should not contain only numbers and special characters
        return containsLetter;
    }
    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public validateDataEditEvent() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("validateDataEditEvent:DoBeforeProcessing");
        }

    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("validateDataEditEvent:DoAfterProcessing");
        }

    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("validateDataEditEvent:doFilter()");
        }

        doBeforeProcessing(request, response);

        // validate here------------------------------------------------------------------
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        // check permission
        ServletContext servletContext = filterConfig.getServletContext();
        List<String> permission = (List<String>) servletContext.getAttribute("permission");
        if (!permission.contains("edit_ticket")) {
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
            return;
        }
        //end
        String id = req.getParameter("id");
        String redirect = "/admin/edit/form/" + id;

        // check validate data
        String namevent = req.getParameter("eventname");
        String title = req.getParameter("title");
        String artist = req.getParameter("artist");
        String description = req.getParameter("description");
        String startTime = req.getParameter("start_time");
        String startDate = req.getParameter("start_date");
        String destination = req.getParameter("destination");
        String status = req.getParameter("status");
        String category = req.getParameter("category");
        String areaQuantity = req.getParameter("area_quantity");
        HttpSession session = req.getSession();
        System.out.println(namevent);
        // data is  null
        if (namevent == null || title == null || artist == null || description == null || startDate == null || startTime == null || destination == null || category == null) {
            session.setAttribute("error", "Dữ liệu không được để trống!");
            res.sendRedirect(redirect);
            return;
        }
        //end 
        String typeBug = "";
        if (!isValidString(namevent)) {
            typeBug = "Tên sự kiện không hợp lệ";

        } else if (!isValidString(title)) {
            typeBug = "Tiêu đề sự kiện không hợp lệ (phải có ít nhất 1 chữ cái)";
        }
        if (!typeBug.isBlank()) {
            session.setAttribute("error", typeBug);
            res.sendRedirect(redirect);
            return;
        }

        //data is empty
        if (namevent.isBlank() || title.isBlank() || artist.isBlank() || description.isBlank() || startDate.isBlank() || startTime.isBlank() || destination.isBlank()) {
            session.setAttribute("error", "Dữ liệu không hợp lệ!");
            res.sendRedirect(redirect);
            return;
        }

        //end
        // status != active and inactive
        if (!status.equals("active") && !status.equals("inactive")) {
            session.setAttribute("error", "Dữ liệu không hợp lệ!");
            res.sendRedirect(redirect);
            return;
        }

        //end
        // status != active and inactive
        if (!status.equals("active") && !status.equals("inactive")) {
            session.setAttribute("error", "Dữ liệu không hợp lệ!");
            res.sendRedirect(redirect);
            return;
        }

        //end
        // area is not correct
        try {
            int area = Integer.parseInt(areaQuantity);
            if (area < 1 || area > 100) {
                session.setAttribute("error", "Số khu vực phải lớn hơn 0 và nhỏ hơn 100");
                res.sendRedirect(redirect);
                return;
            }
        } catch (Exception e) {
            session.setAttribute("error", "Số khu vực ít nhất là 1 và phải là dạng số");
            res.sendRedirect(redirect);
            return;
        }
        //end

        // check date is correct
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate futureDate = LocalDate.parse(startDate, formatter);

        LocalDate today = LocalDate.now();

        long daysBetween = ChronoUnit.DAYS.between(today, futureDate);
        if (daysBetween < 3 || daysBetween > 60) {
            session.setAttribute("error", "Ngày diễn ra ít nhất sau 3 ngày nhiều nhất sau 2 tháng");
            res.sendRedirect(redirect);
            return;
        }
        //enc check date

        // end ------------------------------------------------------------------
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("validateDataEditEvent:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("validateDataEditEvent()");
        }
        StringBuffer sb = new StringBuffer("validateDataEditEvent(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
