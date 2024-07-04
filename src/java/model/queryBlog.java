/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import helper.DBContext;
import helper.payload;
import helper.randomToken;
import schema.Blog;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class queryBlog extends DBContext {

    private static queryBlog qBlog;

    private queryBlog() {
    }

    public static queryBlog createInstance() {
        if (qBlog == null) {
            qBlog = new queryBlog();

        }
        return qBlog;
    }

    // create new blog
    public void createBlog(Blog newBlog) {
        String sql = "insert into blog values (?, ?, ?, ?, ?, ?, ?, ?)";
        // Chuyển đổi chuỗi ngày thành LocalDate
        LocalDate localDate = LocalDate.parse(newBlog.getStartDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // Chuyển đổi LocalDate thành java.sql.Date
        Date sqlDate = Date.valueOf(localDate);
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, randomToken.generateToken(20));
            pt.setString(2, newBlog.getTitle());
            pt.setString(3, newBlog.getContent());
            pt.setDate(4, sqlDate);
            pt.setString(5, newBlog.getImage());
            pt.setString(6, newBlog.getAuthor());
            pt.setString(7, newBlog.getStatus());
            pt.setString(8, newBlog.getCreator());
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at createBlog in queryblog");
        }

    }
    //end

    //get all blog 
    public List<Blog> getAllBlog() {
        String sql = "select * from blog";
        List<Blog> listBlog = new ArrayList<>();

        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getString("blog_id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("publishDate").substring(0, 10),
                        rs.getString("image"),
                        rs.getString("status"),
                        rs.getString("creator"));
                // Chuyển đổi chuỗi ngày thành LocalDate

                LocalDate localDate = LocalDate.parse(blog.getStartDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

                // Định dạng lại ngày từ LocalDate thành chuỗi với định dạng dd-MM-yyyy
                String formattedDate = localDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                blog.setStartDate(formattedDate);
                listBlog.add(blog);
            }
        } catch (Exception e) {
            System.out.println(e + " error at getAllBlog in queryBlog");
        }
        return listBlog;
    }
    //end

    // get blog by id
    public payload getBlogById(String id) {
        String sql = "select * from blog where blog_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getString("blog_id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getString("publishDate").substring(0, 10),
                        rs.getString("image"),
                        rs.getString("status"),
                        rs.getString("creator"));
                // Chuyển đổi chuỗi ngày thành LocalDate
                LocalDate localDate = LocalDate.parse(blog.getStartDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

                // Định dạng lại ngày từ LocalDate thành chuỗi với định dạng dd-MM-yyyy
                String formattedDate = localDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                blog.setStartDate(formattedDate);
                return new payload(true, "success", blog);
            }
        } catch (Exception e) {
            System.out.println(e + " error at getBlogById in queryBlog");
        }
        return new payload(false, "Bài viết không tồn tại", null);

    }
    //end

    // check exist blog
    public boolean checkExistBlog(String idBlog) {
        String sql = "select * from blog where blog_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idBlog);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return true;

            }
        } catch (Exception e) {
            System.out.println(e + " error at checkExistBlog");
        }
        return false;
    }
    //end

    // update an blog
    public void updateBlog(Blog newBlog) {
        String sql = "UPDATE [dbo].[blog] set\n"
                + "      [title] = ? \n"
                + "      ,[content] = ? \n"
                + "      ,[publishDate] = ? \n"
                + "      ,[author] = ? \n"
                + "      ,[status] = ? \n"
                + " WHERE blog_id = ?";

        // Chuyển đổi chuỗi ngày thành LocalDate
        LocalDate localDate = LocalDate.parse(newBlog.getStartDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // Chuyển đổi LocalDate thành java.sql.Date
        Date sqlDate = Date.valueOf(localDate);

        try {
            PreparedStatement pt = connection.prepareStatement(sql);

            pt.setString(1, newBlog.getTitle());
            pt.setString(2, newBlog.getContent());
            pt.setDate(3, sqlDate);
            pt.setString(4, newBlog.getAuthor());
            pt.setString(5, newBlog.getStatus());
            pt.setString(6, newBlog.getId());
            pt.execute();
            if (!newBlog.getImage().isBlank()) {
                pt = connection.prepareStatement("update blog set image = ? where blog_id = ?");
                pt.setString(1, newBlog.getImage());
                pt.setString(2, newBlog.getId());
                pt.execute();
            }
        } catch (Exception e) {
            System.out.println(e + " error at updateBlog in queryBlog");
        }
    }
    //end

    // delete a blog 
    public void deleteBlog(String idBlog) {
        String sql = "delete from blog where blog_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idBlog);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at deleteBlog in queryBlog");
        }
    }
    //end

    public static void main(String[] args) {
        queryBlog qBlog = queryBlog.createInstance();
        payload temp = qBlog.getBlogById("dkZmZ3cxODRFVGI5RVUyYzNkbzU=");
        System.out.println(qBlog.checkExistBlog("dkZmZ3cxODRFVGI5RVUyYzNkbzU="));

    }
}
