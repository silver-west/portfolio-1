package controller_board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_board.Board;
import DB_board.BoardDAO;

@WebServlet("/MyPostList.do")
public class MyPostList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 작성 글 관리 페이지로 이동 ==");
		
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("logId");
		
		try {
			ArrayList<Board> myPostList = BoardDAO.instance.getMyBoard(writer);
			request.setAttribute("myPostList", myPostList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Board/06_myPostList.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
