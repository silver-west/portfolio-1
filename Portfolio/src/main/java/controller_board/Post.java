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
import DB_member.Member;
import DB_member.MemberDAO;

@WebServlet("/Post.do")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 게시글 정보로 이동  ==");
		
		String str = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(str);
		
		try {
			Board post = BoardDAO.instance.getPost(boardNum);
			request.setAttribute("post", post);
			
			Member writer = MemberDAO.instance.getMemberFromId(post.getWriter());
			request.setAttribute("writer", writer);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Board/03_postInfo.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
