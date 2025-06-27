package DB_point;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HistoryDAO {
	public static HistoryDAO instance = new HistoryDAO();
	
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
	
	public ArrayList<History> getHistoryList(String id, String sort) throws Exception {
		ArrayList<History> historyList = new ArrayList<History>();
		
		try {
			getConn();
			String sql = "SELECT * FROM point_history WHERE history_id = ? ORDER BY history_num " + sort;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				History history = new History(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
				historyList.add(history);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return historyList;
	}
}
