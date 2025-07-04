package DB_point;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CartDAO {
	public static CartDAO instance = new CartDAO();
	
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
	
	public boolean addCheck(String id, int itemNumber) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "SELECT * FROM point_cart WHERE user_id = ? AND item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, itemNumber);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("해당 아이템 장바구니에 있음");
				check = true;
			} else {
				System.out.println("해당 아이템 장바구니에 없음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean addCart(String id, int itemNumber, int orderCount) throws Exception {
		boolean check = false;
		
		boolean isUpdate = addCheck(id, itemNumber);
		String sql = null;
		if (isUpdate) {
			sql = "UPDATE point_cart SET orderCount = orderCount + ? WHERE user_id = ? AND item_num = ?";
		} else {
			sql = "INSERT INTO point_cart VALUES (?, ?, ?)";
		}
		
		try {
			getConn();
			pstmt = conn.prepareStatement(sql);
			
			if (isUpdate) {
				pstmt.setInt(1, orderCount);
				pstmt.setString(2, id);
				pstmt.setInt(3, itemNumber);
			} else {
				pstmt.setString(1, id);
				pstmt.setInt(2, itemNumber);
				pstmt.setInt(3, orderCount);
			}
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("장바구니 추가 성공");
				check = true;
			} else {
				System.out.println("장바구니 추가 중 오류");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public ArrayList<MyCart> getMyCart(String id) throws Exception  {
		ArrayList<MyCart> myCartList = new ArrayList<MyCart>();
		
		try {
			getConn();
			String sql = "";
			sql += "SELECT cart.user_id, cart.item_num, cart.orderCount, item.item_name , item.item_cmt, item.item_total, item.item_price, item.item_path ";
			sql += "FROM point_cart cart ";
			sql += "JOIN point_store item ON cart.item_num = item.item_num ";
			sql += "WHERE cart.user_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//String userId, int itemNumber, int orderCount, String itemName, String coment, String path
				MyCart myCart = new MyCart(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
				myCartList.add(myCart);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return myCartList;
	}
	
	public boolean delCart(String id, int itemNum) throws Exception {
		boolean check = false;
		
		try {
			getConn();
			String sql = "DELETE FROM point_cart WHERE user_id = ? AND item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, itemNum);
			
			int result = pstmt.executeUpdate();
			if (result > 0) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean delCartAll(String id, String[] itemNumList) throws Exception {
		boolean check = false;
		
		for (int i = 0; i < itemNumList.length; i++) {
			String number = itemNumList[i];
			int itemNumber = Integer.parseInt(number);
			
			check = delCart(id, itemNumber);
			if (!check) {
				System.out.println("장바구니 선택 아이템 삭제 중 시스템 오류");
				break;
			} 
		}
		
		return check;
	}
	
}
