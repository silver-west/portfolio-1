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
import DB_member.AdminDAO;
import DB_member.Member;
import DB_member.MemberDAO;

@WebServlet("/Post.do")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 게시글 정보로 이동  ==");
		
		String str = request.getParameter("boardNum");
		int boardNum = Integer.parseInt(str);
		int nextNum = 0;
		
		//조회수 올리기
		try {
			BoardDAO.instance.upReadCount(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//게시글 가져오기
		
		try {
			Board post = BoardDAO.instance.getPost(boardNum);
			request.setAttribute("post", post);
			
			if  (post.getWriter().equals("admin")) {
				String writer = AdminDAO.instance.getAdminNick();
				request.setAttribute("adminPost", writer);
				nextNum = 1;
			} else {
				Member writer = MemberDAO.instance.getMemberFromId(post.getWriter());
				request.setAttribute("writer", writer);
				nextNum = 2;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("nextNum", nextNum);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Board/03_postInfo.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
