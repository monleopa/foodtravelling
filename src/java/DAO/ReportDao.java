/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.JDBCConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Report;

/**
 *
 * @author User
 */
public class ReportDao {
    public static boolean addReport(Report report){
        Connection con = JDBCConnection.getJDBCConnection();
        PreparedStatement ps = null;
        String sql = "insert into report(report_content, user_id, user_name, post_id, report_status) values(?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, report.getReportContent());
            ps.setLong(2, report.getUserID());
            ps.setString(3, report.getUserName());  
            ps.setLong(4, report.getPostID());
            ps.setLong(5, report.getReportStatus());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
