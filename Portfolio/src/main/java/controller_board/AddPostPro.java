package controller_board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_board.BoardDAO;

@WebServlet("/AddPostPro.do")
public class AddPostPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== addPost Pro ==");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("logId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		boolean check = false;
		try {
			check = BoardDAO.instance.addPost(writer, title, content);
//			request.setAttribute("addPostCheck", check); => 혹시 몰라서 넘겨둠
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (check) {
			String path = request.getContextPath();
			response.sendRedirect(path + "/BoardMain.do");
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("/Board/05_addPostPro.jsp");
			dis.forward(request, response);
		}
		
	}

}
