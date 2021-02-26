package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BadEleDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void conn() {
		try {
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public BadEleDTO selectSym(String element_name) {
		BadEleDTO dto = null;
		conn();
		try {
				String sql = "SELECT symptom FROM bad_element WHERE element_name = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, element_name);
				rs = psmt.executeQuery();
				if(rs.next()) {
					String symptom = rs.getString("symptom");
					dto = new BadEleDTO(element_name, symptom);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
}
