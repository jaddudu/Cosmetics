package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemHistoryDAO {
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
	
	// 회원 이력 insert 함수
	public int HisInsert(String id, MemHistoryDTO dto) {
		int cnt = 0;
		
		conn();
		try {
			String sql = "INSERT INTO mem_history VALUES (?,?,?,sysdate)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, dto.getProNum());
			psmt.setString(3, dto.getRating());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 회원 이력 조회 함수
	public ArrayList<MemHistoryDTO> HisSelect (String id) {
		ArrayList<MemHistoryDTO> array = new ArrayList<MemHistoryDTO>();
		conn();
		try {
			String sql = "SELECT c.pro_name pro_name,h.rating, c.pro_num FROM cosmetics c, mem_history h WHERE c.pro_num = h.pro_num AND id = ? ORDER BY sysdate";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String proName = rs.getString("pro_name");
//				System.out.println("dao에 들어오는 제품 이름"+proName);  잘 출력됨 제품이름을 잘 가지고 오는것
				String rating = rs.getString("rating");
				String proNum = rs.getString("pro_num");
				MemHistoryDTO dto = new MemHistoryDTO(proName, rating, proNum);
				array.add(dto);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return array;
		
	}
	
	// 화장품 조회 함수
	public ArrayList<MemHistoryDTO> CosSelect(String proName) {
		ArrayList<MemHistoryDTO> array = new ArrayList<MemHistoryDTO>();
		conn();
		try {
			String sql = "SELECT pro_num,pro_name,company, path FROM cosmetics WHERE pro_name LIKE ? order by pro_name";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+proName+"%");
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				String company = rs.getString("company");
				String pro_name = rs.getString("pro_name");
				String path = rs.getString("path");
				String proNum = rs.getString("pro_num");
				
				MemHistoryDTO dto = new MemHistoryDTO(company, pro_name, path, proNum);
				array.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		
		return array;
	}

}
