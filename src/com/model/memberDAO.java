package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	memberDTO list = null;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void close() {
		
			try {
				if (rs!=null)
					rs.close();
				if (psmt!=null)
					psmt.close();
				if (conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public int join(memberDTO dto) {
		conn();
		try {
			String sql = "insert into COS_MEM values (?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public memberDTO login(memberDTO dto) {
		conn();
		
		try {
			String sql = "select * from COS_MEM where id=? and pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String COS_MEM_name = rs.getString(3);
				String COS_MEM_phone = rs.getString(4);
				String COS_MEM_email = rs.getString(5);
				
				list = new memberDTO(dto.getId(), dto.getPw(), COS_MEM_name, COS_MEM_phone, COS_MEM_email);
					
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
