package controller_member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.MemberDAO;

@WebServlet("/EditInfoPro.do")
public class EditInfoPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== editinfoPro page ==");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("logId");
		String editPw = request.getParameter("editPw");
		String editNick = request.getParameter("editNick");
		
		//확인용
		System.out.println("정보 수정 아이디 : " + id);
		System.out.println("-->수정 비번 : " + editPw);
		System.out.println("-->수정 닉넴 : " + editNick);
		
		boolean editcheck = false;
		try {
			editcheck = MemberDAO.instance.editMember(id, editPw, editNick);
			if (editcheck) {
				session.setAttribute("logNick", editNick);
			} 
			
			request.setAttribute("editcheck", editcheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Member/07_editInfoPro.jsp");
		dis.forward(request, response);

		
	}

}
