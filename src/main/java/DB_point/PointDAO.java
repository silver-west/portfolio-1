package DB_point;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PointDAO {
	public static PointDAO instance = new PointDAO();
	
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
	
	public Point getPointInfo(String id) throws Exception {
		Point pointInfo = null;
		
		try {
			getConn();
			String sql = "SELECT * FROM point_table WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pointInfo = new Point(rs.getInt(1), rs.getString(2));
			} else {
				System.out.println("검색 결과 없음");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return pointInfo;
	}
	
	public boolean updatePointToId(String id, int point, boolean opt) throws Exception {
		boolean check = false;
		
		String option = opt ? "+" : "-";
		String sql = String.format("UPDATE point_table SET myPoint = myPoint %s %d", option, point)
					+ " WHERE id = ?";
		
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				System.out.println("포인트 업데이트 성공");
				check = true;
			} else {
				System.out.println("포인트 업데이트 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean updatePointToNick(String nick, int point, boolean opt) throws Exception {
		boolean check = false;
		
		String option = opt ? "+" : "-";
		String sql = "UPDATE point_table p JOIN member m ON p.id = m.id"
		+ String.format(" SET p.myPoint = p.myPoint %s %d WHERE m.nickname = '%s'", option, point, nick);
		
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				System.out.println("포인트 업데이트 성공");
				check = true;
			} else {
				System.out.println("포인트 업데이트 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean sendPoint(String sendUser, String receive, int sendPoint, String search) throws Exception {
		boolean check = false;
		boolean sendCheck = false;
		boolean receiveCheck = false;
		
		//1. 보내기
		sendCheck = updatePointToId(sendUser, sendPoint, false);
		
		if (sendCheck) {
			//2. 받기
			if (search.equals("id")) {
				receiveCheck = updatePointToId(receive, sendPoint, true);
			} else {
				receiveCheck = updatePointToNick(receive, sendPoint, true);
			}
		}
			
		if (sendCheck && receiveCheck) {
			check = true;
		}
		
		return check;
	}
	
	
}
