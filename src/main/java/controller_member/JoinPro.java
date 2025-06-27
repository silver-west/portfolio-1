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
		
		try {
			check = MemberDAO.instance.joinPro(joinId, joinPw, joinNick);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String joinMent = null;
		Boolean joinCheck = false;
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
		default:
			joinCheck = true;
			break;
		}
		request.setAttribute("joinCheck", joinCheck);
		request.setAttribute("joinMent", joinMent);
		
		RequestDispatcher dis = request.getRequestDispatcher("Member/02_joinPro.jsp");
		dis.forward(request, response);	
	}

}
