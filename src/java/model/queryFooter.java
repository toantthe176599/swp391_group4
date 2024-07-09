/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.SQLException;
import helper.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import schema.Footer_client;

/**
 *
 * @author ADMIN
 */
public class queryFooter {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public List<Footer_client> getAllFooter() {
        List<Footer_client> list = new ArrayList<>();
        String query = "SELECT * from footer_info";

        try {
            // Sử dụng connection từ DBContext đã được khởi tạo
            conn = new DBContext().connection;

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và thêm vào list
                String id = rs.getString("id");
                String address = rs.getString("address");
                String useful_links = rs.getString("useful_links");
                String working_hours = rs.getString("working_hours");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String facebook = rs.getString("facebook");
                String zalo = rs.getString("zalo");
                Footer_client footer = new Footer_client(id, address, useful_links, working_hours, phone_number, email, facebook, zalo);
                list.add(footer);
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
    public void updateFooter(String id, String address, String useful_links, String working_hours, String phone_number, String email, String facebook, String zalo) {
    String query = "UPDATE footer_info SET address=?, useful_links=?, working_hours=?, phone_number=?, email=?, facebook=?, zalo=? WHERE id=?";
    
    try {
        conn = new DBContext().connection;
        ps = conn.prepareStatement(query);
        
        ps.setString(1, address);
        ps.setString(2, useful_links);
        ps.setString(3, working_hours);
        ps.setString(4, phone_number);
        ps.setString(5, email);
        ps.setString(6, facebook);
        ps.setString(7, zalo);
        ps.setString(8, id);
        
        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            System.out.println("Footer info updated successfully.");
        } else {
            System.out.println("Failed to update footer info.");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
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
}

    public void printAllFooter() {
        List<Footer_client> footers = getAllFooter();
        for (Footer_client footer : footers) {
            System.out.println(footer.toString());
        }
    }
     public static void main(String[] args) {
//        queryEvent queryEvent = new queryEvent();
//        queryEvent.printAllEvents();
        queryFooter queryfooter = new queryFooter();
        queryfooter.printAllFooter();
    }
}
