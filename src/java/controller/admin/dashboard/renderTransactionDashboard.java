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
