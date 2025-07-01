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

@WebServlet("/DelMemberPro.do")
public class DelMemberPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=== 탈퇴 전 비밀번호 체크 ===");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("logId");
		
		boolean delCheck = false;
		try {
			delCheck = MemberDAO.instance.delMember(id);	
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		if (delCheck) {
			session.setAttribute("logId", null);
			session.setAttribute("logNick", null);	
		}
		
		request.setAttribute("delCheck", delCheck);
		RequestDispatcher dis = request.getRequestDispatcher("/Member/09_DelMemberPro.jsp");
		dis.forward(request, response);	
	}
		
}
	

	

