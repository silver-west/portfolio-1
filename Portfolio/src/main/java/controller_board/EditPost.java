package controller_board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_board.Board;
import DB_board.BoardDAO;

@WebServlet("/EditPost.do")
public class EditPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 게시글 수정 페이지 ==");
		
		String str = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(str);
		
		try {
			Board post = BoardDAO.instance.getPost(boardNum);
			request.setAttribute("editPost", post);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Board/08_editForm.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
