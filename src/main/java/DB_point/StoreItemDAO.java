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
	
	public boolean buyCartList(String id, String[] itemNumList, String[] countList, String totalPrice) throws Exception {
		boolean check = false;
		
		//1. 상품 정보 업데이트
		boolean next = true;
		try {
			getConn();
			for (int i = 0; i < itemNumList.length; i++) {
				String itemNumber = itemNumList[i];
				String orderCount = countList[i];
				
				int intItemNum = Integer.parseInt(itemNumber);
				int intOrderCount = Integer.parseInt(orderCount);
				
				String sql = "UPDATE point_store SET item_total = item_total - ? WHERE item_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, intItemNum);
				pstmt.setInt(2, intOrderCount);
				
				int result = pstmt.executeUpdate();
				if (result < 1) {
					next = false;
					System.out.println("아이템 구매 중 시스템 오류 :: 상품 정보 확인");
					break;
				} 
			}
			
			//2. 유저 포인트 업데이트 (-> 히스토리)
			if (next) {
				int intTotalPrice = Integer.parseInt(totalPrice);
				
				check = PointDAO.instance.updatePointToId(id, intTotalPrice, false);
				if (check) {
					check = HistoryDAO.instance.addHistory(id, "포인트 상점", intTotalPrice, "minus");
				} else {
					System.out.println("아이템 구매 중 시스템 오류 :: 아이템 구매 중 포인트 정보 업데이트 실패");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean buyItem(String id, int itemNum, int totalPrice) throws Exception {
		boolean check = false;
		
		boolean next = false;
		//1.상품 정보 업데이트
		try {
			getConn();
			String sql = "UPDATE point_store SET item_total = item_total - 1 WHERE item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				next = true;
			} else {
				System.out.println("아이템 구매 중 시스템 오류 :: 상품 정보 확인");
			}
			
			if (next) {
				//2. 유저 포인트 업데이트 (-> 히스토리)
				check = PointDAO.instance.updatePointToId(id, totalPrice, false);
				if (check) {
					check = HistoryDAO.instance.addHistory(id, "포인트 상점", totalPrice, "minus");
				} else {
					System.out.println("아이템 구매 중 시스템 오류 :: 아이템 구매 중 포인트 정보 업데이트 실패");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return check;
	}
}
