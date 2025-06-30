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
		String pw = request.getParameter("inputPw");
		
		boolean check = false;
		int result = 0;
		
		boolean pwCheck;
		try {
			pwCheck = MemberDAO.instance.idAndPwCheck(id, pw);
			if (pwCheck) {
				boolean delCheck = MemberDAO.instance.delMember(id);
				if (delCheck) {
					check = true;
				}
			} else {
				result = 1; //비번 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		if (result == 1) {
			request.setAttribute("checkMent", "비밀번호가 틀립니다");
			RequestDispatcher dis = request.getRequestDispatcher("/Member/08_pwCheckForDel.jsp");
			dis.forward(request, response);	
			
		} else {
			if (check) {
				session.setAttribute("logId", null);
				session.setAttribute("logNick", null);
				
				request.setAttribute("delCheck", check);
			} else {
				request.setAttribute("checkMent", "시스템 오류");
			}
			RequestDispatcher dis = request.getRequestDispatcher("/Member/09_DelMemberPro.jsp");
			dis.forward(request, response);	
		}
		
	}
	
}
	

