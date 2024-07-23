package model;

import helper.DBContext;
import schema.Event_client;
import java.text.Normalizer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;
import schema.Category_client;

public class queryEventClient {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Event_client> getAllEvent() {
        List<Event_client> list = new ArrayList<>();
        String query = "select event_id, name, title, start_time, start_date, location, image_event from event where status = 'active'";

        try {
            // Sử dụng connection từ DBContext đã được khởi tạo
            conn = new DBContext().connection;

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và thêm vào list
                String event_id = rs.getString("event_id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                Date start_time = rs.getTime("start_time");
                Date start_date = rs.getDate("start_date");
                String location = rs.getString("location");
                String image_event = rs.getString("image_event");

                // Tạo đối tượng Event_client và thêm vào danh sách
                Event_client event = new Event_client(event_id, name, title, start_time, start_date, location, image_event);
                list.add(event);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Xử lý lỗi theo ý của bạn
        } finally {
            try {
                // Đóng các đối tượng ResultSet, PreparedStatement và Connection
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Xử lý lỗi theo ý của bạn
            }
        }

        return list;
    }

    public List<Event_client> searchEvents(String searchTerm) {
        List<Event_client> list = new ArrayList<>();
        String query = "SELECT event_id, name, title, start_time, start_date, location, image_event "
                + "FROM event WHERE LOWER(name) LIKE ? and  status = 'active'";

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);

            // Kiểm tra nếu searchTerm là null thì gán giá trị mặc định là chuỗi rỗng ""
            if (searchTerm == null) {
                searchTerm = "";
            }

            ps.setString(1, "%" + searchTerm.toLowerCase() + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                String event_id = rs.getString("event_id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                Date start_time = rs.getTime("start_time");
                Date start_date = rs.getDate("start_date");
                String location = rs.getString("location");
                String image_event = rs.getString("image_event");

                Event_client event = new Event_client(event_id, name, title, start_time, start_date, location, image_event);
                list.add(event);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }

        return list;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Hoặc xử lý lỗi theo ý của bạn
        }
    }

    public List<Category_client> getAllCategory() {
        List<Category_client> list = new ArrayList<>();
        String query = "select * from category";

        try {
            // Sử dụng connection từ DBContext đã được khởi tạo
            conn = new DBContext().connection;

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và thêm vào list
                String category_id = rs.getString("category_id");
                String category_name = rs.getString("category_name");
                Category_client category = new Category_client(category_id, category_name);
                list.add(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Xử lý lỗi theo ý của bạn
        } finally {
            try {
                // Đóng các đối tượng ResultSet, PreparedStatement và Connection
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Xử lý lỗi theo ý của bạn
            }
        }

        return list;
    }

    public List<Event_client> getAllEventsByCateID(String category_id) {
        List<Event_client> list = new ArrayList<>();
        String query = "select * from event\n"
                + "where category = ? and  status = 'active'";

        try {
            // Sử dụng connection từ DBContext đã được khởi tạo
            conn = new DBContext().connection;

            ps = conn.prepareStatement(query);
            ps.setString(1, category_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và thêm vào list
                String event_id = rs.getString("event_id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                Date start_time = rs.getTime("start_time");
                Date start_date = rs.getDate("start_date");
                String location = rs.getString("location");
                String image_event = rs.getString("image_event");

                Event_client event = new Event_client(event_id, name, title, start_time, start_date, location, image_event);
                list.add(event);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Xử lý lỗi theo ý của bạn
        } finally {
            try {
                // Đóng các đối tượng ResultSet, PreparedStatement và Connection
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Xử lý lỗi theo ý của bạn
            }
        }

        return list;
    }

    public List<Event_client> getEventsByMonthAndCategory(int month, String categoryId) {
        List<Event_client> list = new ArrayList<>();
        String query = "SELECT event_id, name, title, start_time, start_date, location, image_event "
                + "FROM event "
                + "WHERE MONTH(start_date) = ? AND category = ? and  status = 'active'";

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, month);
            ps.setString(2, categoryId);
            rs = ps.executeQuery();

            while (rs.next()) {
                String event_id = rs.getString("event_id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                Date start_time = rs.getTime("start_time");
                Date start_date = rs.getDate("start_date");
                String location = rs.getString("location");
                String image_event = rs.getString("image_event");

                Event_client event = new Event_client(event_id, name, title, start_time, start_date, location, image_event);
                list.add(event);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Đóng các đối tượng ResultSet, PreparedStatement và Connection
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return list;
    }

    public List<Event_client> getAllEventsByMonth(int month) {
        List<Event_client> list = new ArrayList<>();
        String query = "SELECT event_id, name, title, start_time, start_date, location, image_event "
                + "FROM event WHERE MONTH(start_date) = ? and  status = 'active'";

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, month);
            rs = ps.executeQuery();

            while (rs.next()) {
                String event_id = rs.getString("event_id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                Date start_time = rs.getTime("start_time");
                Date start_date = rs.getDate("start_date");
                String location = rs.getString("location");
                String image_event = rs.getString("image_event");

                Event_client event = new Event_client(event_id, name, title, start_time, start_date, location, image_event);
                list.add(event);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return list;
    }

    public String getStatusEvent(String eventId) {
        String sql = "select status from event where event_id = ?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(sql);
            ps.setString(1, eventId);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("status");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "";
    }

    public void printAllEvents() {
        List<Event_client> events = getAllEvent();
        for (Event_client event : events) {
            System.out.println(event.toString());
        }
    }

    public void printCategory() {
        List<Category_client> cates = getAllCategory();
        for (Category_client cate : cates) {
            System.out.println(cate.toString());
        }
    }

    public static void main(String[] args) {
        queryEventClient qClient = new queryEventClient();
        System.out.println(qClient.getStatusEvent("aFREMzR0ZHRwa0gwcmZ1UGZ1MHJaU2ZhdQ=="));
    }
}
