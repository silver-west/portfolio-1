package controller_member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.Member;
import DB_member.MemberDAO;

@WebServlet("/LoginPro.do")
public class LoginPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=== login Pro ===");
		
		request.setCharacterEncoding("UTF-8");
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		try {
			boolean logCheck = MemberDAO.instance.idAndPwCheck(loginId, loginPw);
			if (logCheck) {
				Member member = MemberDAO.instance.getMember(loginId, loginPw);
				HttpSession session = request.getSession();
				session.setAttribute("logId", loginId);
				session.setAttribute("logNick", member.getNickName());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Member/04_loginPro.jsp");
		dis.forward(request, response);
		
	}

}
