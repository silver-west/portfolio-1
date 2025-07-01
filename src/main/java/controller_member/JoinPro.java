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
		
		boolean check = false;
		try {
			check = MemberDAO.instance.joinPro(joinId, joinPw, joinNick);
			request.setAttribute("joinCheck", check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("Member/02_joinPro.jsp");
		dis.forward(request, response);	
		
	}

}
