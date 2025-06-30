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

@WebServlet("/EditForm.do")
public class EditForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("=== 비밀번호 체크 ===");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("logId");
		String pw = request.getParameter("inputPw");
		
		boolean next = false;
		
		try {
			boolean check = MemberDAO.instance.idAndPwCheck(id, pw);
			if (check) {
				next = true;
			} else {
				next = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (next) {
			try {
				Member member = MemberDAO.instance.getMember(id, pw);
				request.setAttribute("member", member);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("/Member/06_editInfo.jsp");
			dis.forward(request, response);
		} else {
			request.setAttribute("checkMent", "틀린 비밀번호 입니다");
			
			RequestDispatcher dis = request.getRequestDispatcher("/Member/05_pwCheck.jsp");
			dis.forward(request, response);
			
		}
	}

}
