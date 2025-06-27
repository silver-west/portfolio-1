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
}
