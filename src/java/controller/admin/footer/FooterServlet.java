package controller.admin.footer;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.queryFooter;
import schema.Footer_client;

@WebServlet(name = "FooterServlet", urlPatterns = {"/admin/footer"})
public class FooterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FooterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FooterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        queryFooter queryFooter = new queryFooter();
        List<Footer_client> footers = queryFooter.getAllFooter();
        request.setAttribute("footers", footers);
        request.getRequestDispatcher("/views/admin/pages/website/website.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String address = request.getParameter("address");
        String useful_links = request.getParameter("useful_links");
        String working_hours = request.getParameter("working_hours");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String facebook = request.getParameter("facebook");
        String zalo = request.getParameter("zalo");
        String iframe = request.getParameter("map");

        queryFooter queryFooter = new queryFooter();
        queryFooter.updateFooter(id, address, useful_links, working_hours, phone_number, email, facebook, zalo, iframe);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Cập nhật thành công");
        response.sendRedirect(request.getContextPath() + "/admin/footer");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
