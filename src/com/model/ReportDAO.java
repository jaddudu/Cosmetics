package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReportDAO {
	
	
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
	
	// 제보 DAO
	public int insertAllergy(ReportDTO dto) {
		int cnt = 0;
		
		conn();
		try {
			String sql = "INSERT INTO allergy_list VALUES (?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,dto.getId());
			psmt.setString(2,dto.getCompany());
			psmt.setString(3,dto.getProName());
			psmt.setString(4,dto.getSymptom());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 사용자가 bad 라고 평가한 제품에 대해서 가져오는 DAO
	public ArrayList<ReportDTO> selectRating(String id) {
		ArrayList<ReportDTO> badArray = new ArrayList();
		conn();
		try {
			String sql = "SELECT company, pro_name FROM cosmetics where pro_num IN (select pro_num from mem_history WHERE id = ? AND rating ='BAD')";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				String company = rs.getString("company");
				String proName = rs.getString("pro_name");
				
				ReportDTO dto = new ReportDTO(company, proName);
				badArray.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return badArray;
	}
	
	public ArrayList<ReportDTO> selectAller(String id) {
		ArrayList<ReportDTO> alArray = new ArrayList();
		conn();
		
		try {
			String sql = "SELECT company,pro_name,symptom FROM allergy_list WHERE id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				String company = rs.getString("company");
				String proName = rs.getString("pro_name");
				String symptom = rs.getString("symptom");
				
				ReportDTO dto = new ReportDTO(company, proName, symptom);
				alArray.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return alArray;
	}
	
	
}
