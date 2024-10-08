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
public class validateCreatEvent implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public validateCreatEvent() {
    }

    private static final Pattern LETTER_PATTERN = Pattern.compile(".*[a-zA-Z].*");

    public static boolean isValidString(String input) {
        // Check if the string contains at least one letter
        boolean containsLetter = LETTER_PATTERN.matcher(input).matches();
        // Check if the string contains at least one number

        // A valid string must contain at least one letter
        // It should not contain only numbers and special characters
        return containsLetter;
    }

    //end
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("validateCreatEvent:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("validateCreatEvent:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
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
            log("validateCreatEvent:doFilter()");
        }

        doBeforeProcessing(request, response);
        //_------------------------------------

        // private router /admin/ticket/create
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        // check permission
        ServletContext servletContext = filterConfig.getServletContext();
        List<String> permission = (List<String>) servletContext.getAttribute("permission");
        if (!permission.contains("add_ticket")) {
            res.sendRedirect("http://localhost:8080/views/client/404Page/404Page.html");
            return;
        }
        //end

        // check validate data
        String namevent = req.getParameter("eventname");
        String title = req.getParameter("title");
        String artist = req.getParameter("artist");
        String description = req.getParameter("description");
        String startTime = req.getParameter("start_time");
        String startDate = req.getParameter("start_date");
        String destination = req.getParameter("destination");
        String money = req.getParameter("money");
        String category = req.getParameter("category");
        String areaQuantity = req.getParameter("area_quantity");
        HttpSession session = req.getSession();
        String rediect = "/admin/event/create/form";
        // data is  null
        if (namevent == null
                || title == null
                || artist == null
                || description == null
                || startDate == null
                || startTime == null
                || destination == null
                || category == null
                || money == null) {
            session.setAttribute("error", "Dữ liệu không được để trống!");
            res.sendRedirect(rediect);
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
            res.sendRedirect(rediect);
            return;
        }

        //data is empty
        if (namevent.isBlank()
                || title.isBlank()
                || artist.isBlank()
                || description.isBlank()
                || startDate.isBlank()
                || startTime.isBlank()
                || destination.isBlank()
                || money.isBlank()) {
            session.setAttribute("error", "Dữ liệu không hợp lệ!");
            res.sendRedirect(rediect);
            return;
        }

        //end
        // area is not correct
        try {
            int area = Integer.parseInt(areaQuantity);
            if (area < 1 || area > 100) {
                session.setAttribute("error", "Số khu vực phải lớn hơn 0 và nhỏ hơn 100");
                res.sendRedirect(rediect);
                return;
            }

        } catch (Exception e) {
            session.setAttribute("error", "Số khu vực ít nhất là 1 và phải là dạng số");
            res.sendRedirect(rediect);
            return;
        }
        //end

        // handle money for artist
        try {
            double moneyForArtist = Double.parseDouble(money);
            if (moneyForArtist <= 0 || moneyForArtist > 100000000000.0) {
                session.setAttribute("error", "Số tiền cho nghệ sĩ phải lớn hơn 0 và nhỏ hơn 100 tỉ");
                res.sendRedirect(rediect);
                return;
            }
        } catch (Exception e) {
            session.setAttribute("error", "Số tiền cho nghệ sĩ không hợp lệ");
            res.sendRedirect(rediect);
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
            res.sendRedirect(rediect);
            return;
        }
        //enc check date

        // check image
//        String imageEvent = req.getParameter("image_event");
//        String imagePosition = req.getParameter("image_position");
//        if (imageEvent == null || imagePosition == null) {
//            session.setAttribute("error", "Bạn chưa nhập đủ ảnh vui lòng nhập lại thông tin");
//            res.sendRedirect("/admin/event/create/form");
//            return;
//        }
        //end
        //end 
        //e-------------------------------------
        //--------------------------------------
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
                log("validateCreatEvent:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("validateCreatEvent()");
        }
        StringBuffer sb = new StringBuffer("validateCreatEvent(");
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
