package DB_point;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StoreItemDAO {
	public static StoreItemDAO instance = new StoreItemDAO();
	
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
	
	public ArrayList<StoreItem> getItemList() throws Exception {
		ArrayList<StoreItem> itemList = new ArrayList<StoreItem>();
		
		try {
			getConn();
			String sql = "SELECT * FROM point_store";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreItem item = new StoreItem(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5));
				itemList.add(item);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return itemList;
	}
	
	public StoreItem getItem(int number) throws Exception {
		StoreItem item = null;
		
		try {
			getConn();
			String sql = "SELECT * FROM point_store WHERE item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("== 아이템 검색 완료 ==");
				//int number, String name, int price, String coment, int total
				item = new StoreItem(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getNString(4), rs.getInt(5));
			} else {
				System.out.println("시스템 오류 :: 아이템 조회 불가");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return item;
	}
}
