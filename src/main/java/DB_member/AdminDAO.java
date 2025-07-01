package DB_member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDAO {
	public static AdminDAO instance = new AdminDAO();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConn() throws Exception {
		String jdbcUrl = "jdbc:mysql://localhost:3306/p_data?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
					
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		return conn;
	}
	
	public void closeDB() throws Exception{
		if (conn != null) {
			conn.close();
		}
		if (pstmt != null) {
			conn.close();
		}
		if (rs != null) {
			conn.close();
		}
	}
	
	public boolean adminCheck(String id, String pw) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "SELECT * FROM admin WHERE admin_id = ? AND admin_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("관리자 아이디, 비번 일치");
				check = true;
			} else {
				System.out.println("관리자 아이디, 비번 불일치");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public String getAdminNick() throws Exception {
		String nick = null;
		
		try {
			getConn();
			String sql = "SELECT * FROM admin";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				nick = rs.getString(3);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return nick;
	}
	
	public ArrayList<Member> getMemberList() throws Exception {
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		try {
			getConn();
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Member member = new Member(rs.getString(1), rs.getString(2), rs.getString(3));
				memberList.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;
	}
	
	public boolean adminCheckFromId(String id) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "SELECT * FROM admin WHERE admin_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				check = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean adminCheckFromNick(String nick) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "SELECT * FROM admin WHERE nickname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				check = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	
}
