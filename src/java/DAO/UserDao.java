/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.JDBCConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author User
 */
public class UserDao {

    public boolean checkEmail(String email) {
        Connection con = JDBCConnection.getJDBCConnection();
        String sql = "SELECT * FROM user WHERE email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                con.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean inseartUser(User u) {
        Connection con = JDBCConnection.getJDBCConnection();
        PreparedStatement ps = null;
        try {
            System.out.println(u.getUsername() + u.getEmail());
            String sql = "insert into user(user_name,user_password,email,admin) values(?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setLong(4, u.getAdmin());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public User login(String email, String password) {
        Connection con = JDBCConnection.getJDBCConnection();
        String sql = "SELECT * FROM user WHERE email='" + email + "' and user_password='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserID(rs.getLong("user_id"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("user_name"));
                u.setPassword(rs.getString("user_password"));
                u.setAdmin(rs.getLong("admin"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static User getUser(String userID){
        Connection con = JDBCConnection.getJDBCConnection();
        String sql = "SELECT * FROM user WHERE user_id='" + userID + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                User u = new User();
                u.setUserID(rs.getLong("user_id"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("user_name"));
                u.setPassword(rs.getString("user_password"));
                u.setAdmin(rs.getLong("admin"));
                con.close();
                System.out.println(u.getUserID());
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public static void follow(long followerID, String following) throws SQLException{
        Connection con = JDBCConnection.getJDBCConnection();
//        long followerID = Long.parseLong(follower);
        long followingID = Long.parseLong(following);
        String sql = "insert into relationship(follower_id, following_id) values(?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setLong(1, followerID);
        ps.setLong(2, followingID);
        ps.executeUpdate();
    }
    
    public static void unfollow(long followerID, String following) throws SQLException{
        Connection con = JDBCConnection.getJDBCConnection();
        System.out.println("kiem tra unfollow");
//       long followerID = Long.parseLong(follower);
//        long followingID = Long.parseLong(following);
        String sql = "DELETE FROM relationship WHERE follower_id = '" + followerID + "' AND following_id = '"+following+"'";
        Statement st = con.createStatement();
        st.executeUpdate(sql);
    }
    
        public static boolean checkFollow(long follower, long following){
        Connection con = JDBCConnection.getJDBCConnection();
        String sql = "SELECT * FROM relationship WHERE follower_id = '" + follower + "' AND following_id = '"+following+"'";
        System.out.println("3333");
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            System.out.println("6555555");
            while (rs.next()) {
                System.out.println("4444444");
                con.close();
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return true;
    }
    
}
