/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import helper.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import schema.Blog_client;
import schema.Event_client;

/**
 *
 * @author ADMIN
 */
public class queryBlogClient {
     private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
     public List<Blog_client> getAllBlog() {
        List<Blog_client> list = new ArrayList<>();
        String query = "SELECT blog_id, title, content, publishDate, image, author FROM blog";

        try {
            // Sử dụng connection từ DBContext đã được khởi tạo
            conn = new DBContext().connection;

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và thêm vào list
               String blogId = rs.getString("blog_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date publishDate = rs.getDate("publishDate");
                String image = rs.getString("image");
                String author = rs.getString("author");

                // Tạo đối tượng Event_client và thêm vào danh sách
                Blog_client blog = new Blog_client(blogId, title, content, publishDate, image, author);
                list.add(blog);
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
     public Blog_client getBlogById(String blogId) {
    Blog_client blog = null;
    String query = "SELECT blog_id, title, content, publishDate, image, author FROM blog WHERE blog_id = ?";

    try {
        conn = new DBContext().connection;
        ps = conn.prepareStatement(query);
        ps.setString(1, blogId);
        rs = ps.executeQuery();

        if (rs.next()) {
            String title = rs.getString("title");
            String content = rs.getString("content");
            Date publishDate = rs.getDate("publishDate");
            String image = rs.getString("image");
            String author = rs.getString("author");

            blog = new Blog_client(blogId, title, content, publishDate, image, author);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    return blog;
}

      public void printAllBlog() {
        List<Blog_client> blogs = getAllBlog();
        for (Blog_client blog : blogs) {
            System.out.println(blog.toString());
        }
    }
     public static void main(String[] args) {

    }
}
