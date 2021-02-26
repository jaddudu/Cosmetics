package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FilteringDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

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
	
	// 필터링한 성분 하나하나를 mem_element 테이블에 인서트
	// 만약 한 사람이 3개의 성분이 안 맞는 다면 mem_element 테이블에는 3줄이 들어간다.
	public int filterInsert(String id, String[] element) {
		conn();
		try {
			for(int i = 0; i<element.length; i++) {
				String sql = "INSERT INTO mem_element VALUES (?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, element[i]);
				cnt += psmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
		
	}
	
	// 필터링 한 성분 하나씩 리턴
	public ArrayList<String> filterSelect(String id) {
		ArrayList<String> array = new ArrayList<String>();
		conn();
		try {
			String sql = "SELECT element FROM mem_element WHERE id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				array.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return array;
		
	}
}
