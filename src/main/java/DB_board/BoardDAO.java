package DB_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DB_member.Member;
import DB_member.MemberDAO;



public class BoardDAO {
	public static BoardDAO instance = new BoardDAO();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConn() throws Exception {
		String jdbcUrl = "jdbc:mysql://localhost:3306/board_data?serverTimezone=UTC&useSSL=false";
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
	
	public ArrayList<Board> getMyBoard(String id) throws Exception {
		ArrayList<Board> myPostList = new ArrayList<Board>();
		
		try {
			getConn();
			String sql = "SELECT * FROM board WHERE boardWriter = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//id -> nick 변환
				Member writer = MemberDAO.instance.getMemberFromId(rs.getString(2));
				String wirterNick = writer.getNickName();
				
				Board board = new Board(rs.getInt(1), wirterNick, rs.getString(3), rs.getString(4), rs.getInt(5));
				myPostList.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return myPostList;
	}
	
	public ArrayList<Board> getBoard() throws Exception {
		ArrayList<Board> boardList = new ArrayList<Board>();
		
		try {
			getConn();
			String sql = "SELECT * FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//id -> nick 변환
				Member writer = MemberDAO.instance.getMemberFromId(rs.getString(2));
				String wirterNick = writer.getNickName();
				
				Board board = new Board(rs.getInt(1), wirterNick, rs.getString(3), rs.getString(4), rs.getInt(5));
				boardList.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return boardList;
	}
	
	public Board getPost(int number) throws Exception {
		Board post = null;
		
		try {
			getConn();
			String sql = "SELECT * FROM board WHERE boardNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("게시글 검색 성공");
				post = new Board(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
				
			} else {
				System.out.println("게시글 검색 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return post;
	}
	
	public int getPostMaxNum() throws Exception {
		int maxNum = 0;
		
		try {
			getConn();
			String sql = "SELECT MAX(boardNo) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return maxNum;
	}
	
	public boolean addPost(String writer, String subject, String content) throws Exception {
		boolean check = false;
		
		int postNum = getPostMaxNum() + 1;
		
		try {
			getConn();
			String sql = "INSERT INTO board VALUES(?, ?, ?, ?, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, writer);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("게시글 추가 성공");
				check = true;
			} else {
				System.out.println("게시글 추가 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public void upReadCount(int boardNum) throws Exception {
		try {
			getConn();
			String sql = "UPDATE board SET boardReadCount = boardReadCount + 1 WHERE boardNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("조회수 올리기 완료");
			} else {
				System.out.println("조회수 올리기 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	public boolean delPost(int boardNum) throws Exception {
		boolean check = false;
		try {
			getConn();
			String sql = "DELETE FROM board WHERE boardNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("게시글 삭제 완료");
				check = true;
			} else {
				System.out.println("게시글 삭제 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
	
	public boolean editPost(int boardNum, String subject, String content) throws Exception {
		boolean check = false;
		try {
			getConn();
			String sql = "UPDATE board SET boardSubject = ?, boardContent =? WHERE boardNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, boardNum);
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				System.out.println("게시글 수정 완료");
				check = true;
			} else {
				System.out.println("게시글 수정 실패");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return check;
	}
}
