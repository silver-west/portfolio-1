package DB_member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	public static MemberDAO instance = new MemberDAO();
	
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
	
	public boolean findUser(String id) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			
			String sql = "SELECT * FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("id_해당 회원 존재");
				check = true;
			} else {
				System.out.println("id_해당 회원 없음");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean findNick(String nickName) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			
			String sql = "SELECT * FROM member WHERE nickname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("nick_해당 회원 존재");
				check = true;
			} else {
				System.out.println("nick_해당 회원 없음");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean idAndPwCheck(String id, String pw) throws Exception {
		boolean check = false;
		
		boolean idCheck = findUser(id);
		if (idCheck == false) {
			return check;
		}
		
		try {
			getConn();
			String sql = "SELECT * FROM member WHERE id = ? AND pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("아이디, 비번 일치");
				check = true;
			} else {
				System.out.println("아이디, 비번 불일치");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public Member getMember(String id, String pw) throws Exception {
		Member member = null;
		boolean memberCheck = idAndPwCheck(id, pw);
		
		if (memberCheck == false) {
			return member;
		}
		
		try {
			getConn();
			String sql = "SELECT * FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getString(1), rs.getString(2), rs.getString(3));
			} else {
				System.out.println("조회 실패 - 시스템 오류");
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return member;
		
	}
	
	public Member getMemberFromId(String id) throws Exception {
		Member member = null;
		
		try {
			getConn();
			String sql = "SELECT * FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getString(1), rs.getString(2), rs.getString(3));
			} else {
				System.out.println("조회 실패 - 시스템 오류");
				member = new Member("x", "x", "탈퇴회원");
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return member;
		
	}
	
	public int joinPro(String id, String pw, String nickName) throws Exception {
		int check = 0;
		
		boolean idCheck = findUser(id);
		if (idCheck) {
			check = 1;
			return check;
		}
		
		boolean nickCheck = findNick(nickName);
		if (nickCheck) {
			check = 2;
			return check;
		}
		
		try {
			getConn();
			
			String sql = "INSERT INTO member VALUES(? , ? , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nickName);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("DB insert complete");
				check = 4;
			} else {
				System.out.println("DB insert failed");
				check = 3;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	public boolean delMember(String id) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "DELETE FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("회원 탈퇴 성공");
				check = true;
			} else {
				System.out.println("회원 탈퇴 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean editMember(String id, String pw, String nickName) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "UPDATE member SET pw = ?, nickname = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, nickName);
			pstmt.setString(3, id);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("회원 정보 수정 성공");
				check = true;
			} else {
				System.out.println("회원 정보 수정 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	
}
