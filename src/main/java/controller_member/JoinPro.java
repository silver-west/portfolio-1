package controller_member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_member.MemberDAO;

@WebServlet("/JoinPro.do")
public class JoinPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("=== joinPro ===");
		
		request.setCharacterEncoding("UTF-8");
		String joinId = request.getParameter("joinId");
		String joinPw = request.getParameter("joinPw");
		String joinNick = request.getParameter("joinNick");
		
		int check = 0;
		boolean next = false;
		int adminCheck = 0;
		try {
			adminCheck = MemberDAO.instance.adminCheck(joinId, joinNick);
			if (adminCheck == 0) {
				next = true;
				check = MemberDAO.instance.joinPro(joinId, joinPw, joinNick);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String joinMent = null;
		Boolean joinCheck = false;
		if (next) {
			switch (check) {
			case 1:
				joinMent = "아이디 중복";
				break;
			case 2:
				joinMent = "닉네임 중복";
				break;
			case 3:
				joinMent = "시스템 오류";
				break;
			case 4:
				joinMent = "member 추가까지는 완료";
				break;	
			default:
				joinCheck = true;
				break;
			}	
		} else {
			if (adminCheck == 1) {
				joinMent = "아이디 중복";
				check = 1;
			} else {
				joinMent = "닉네임 중복";
				check = 2;
			}
		}
		request.setAttribute("joinCheck", joinCheck);
		request.setAttribute("joinMent", joinMent);
		
		if (check == 1 || check == 2) {
			RequestDispatcher dis = request.getRequestDispatcher("Member/01_join.jsp");
			dis.forward(request, response);	
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("Member/02_joinPro.jsp");
			dis.forward(request, response);	
		}
	}

}
