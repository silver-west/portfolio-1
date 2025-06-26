package controller_board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_board.BoardDAO;

@WebServlet("/DelPost.do")
public class DelPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 게시글 삭제 페이지 ==");
		
		String str = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(str);
		
		try {
			boolean check = BoardDAO.instance.delPost(boardNum);
			request.setAttribute("delPostCheck", check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Board/07_delComplete.jsp");
		dis.forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
