/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import helper.DBContext;
import helper.payload;
import helper.randomToken;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import schema.Event;
import java.sql.ResultSet;
import schema.CategoryEvent;

/**
 *
 * @author LENOVO
 */
public class queryCategory extends DBContext {

    private static queryCategory qCategory;

    private queryCategory() {
    }

    // singeton
    public static synchronized queryCategory createInstanceCategory() {
        if (qCategory == null) {
            qCategory = new queryCategory();
        }
        return qCategory;
    }

    // get all category
    public List<CategoryEvent> getAllCategory() {
        List<CategoryEvent> listCategoryEvents = new ArrayList<>();

        String sql = "select * from category";
        try {
            PreparedStatement pt = connection.prepareCall(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                CategoryEvent category = new CategoryEvent(rs.getString("category_id"), rs.getString("category_name"));
                listCategoryEvents.add(category);
            }
        } catch (Exception e) {
            System.out.println(e + "error at getallcategory query category");
        }
        return listCategoryEvents;
    }
    //end

    // add a new category
    public void addNewCat(String description) {
        String sql = "insert into category values (?, ?)";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, randomToken.generateRandomDigitString(15));
            pt.setString(2, description);
            pt.execute();
        } catch (Exception e) {
            System.out.println(e + " error at addNewCat queryCategory");
        }
    }
    //

    //check exist category
    public boolean checkExistCategory(String description) {
        String sql = "select * from category where LOWER(category_name) = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, description.toLowerCase());
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("category_id"));
                return true;
            }
        } catch (Exception e) {
            System.out.println(e + " error at checkExistCategory at queryCategory");
        }
        return false;
    }
    //end

    // get a category by id
    public payload getCategoryByID(String idCategory) {
        String sql = "select * from category where category_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idCategory);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return new payload(true, "Lấy thông tin loại sự kiện thành công", new CategoryEvent(rs.getString("category_id"), rs.getString("category_name")));
            }
        } catch (Exception e) {
            System.out.println(e + " error at getCategoryByID querycategory");
        }
        return new payload(false, "Loại sự kiện không tồn tại", null);
    }
    //end

    // edit category 
    public boolean editCategory(String id, String newDescription) {
        String sql = "update category set category_name = ? where category_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, newDescription);
            pt.setString(2, id);
            pt.execute();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    //end

    // remove a category
    public boolean removeCategory(String idCat) {
        String sql = "delete from category where category_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, idCat);
            pt.execute();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    //end
    public static void main(String[] args) {
        queryCategory qCategory = queryCategory.createInstanceCategory();
        qCategory.editCategory("1", "ca nhạc");
    }
}
