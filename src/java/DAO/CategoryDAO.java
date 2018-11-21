/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.util.ArrayList;
import model.Category;
import connect.JDBCConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class CategoryDAO {
    public ArrayList<Category> getListCategory() throws SQLException{
        Connection con = JDBCConnection.getJDBCConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while(rs.next()){
            Category category = new Category();
            category.setCateID(rs.getInt("category_id"));
            category.setCateName(rs.getString("category_name"));
            list.add(category);
        }
        return list;
    }
    
    public static void main(String[] args) {
        System.out.println(5%10);
    }
}
