package controller_board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_board.BoardDAO;

@WebServlet("/EditPostPro.do")
public class EditPostPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== editPost Pro ==");
		
		request.setCharacterEncoding("UTF-8");
		
		String str = request.getParameter("postNum");
		int postNum = Integer.parseInt(str);
		String editSubject = request.getParameter("editSubject");
		String editContent = request.getParameter("editContent");
		boolean check = false;
		try {
			check = BoardDAO.instance.editPost(postNum, editSubject, editContent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (check) {
			String path = request.getContextPath();
			response.sendRedirect(path + "/Post.do" + "?boardNum=" + postNum);
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("09_editPost_failed.jsp");
			dis.forward(request, response);
		}
	}

}
