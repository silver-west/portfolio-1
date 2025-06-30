package controller_member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.MemberDAO;

@WebServlet("/PwCheck.do")
public class PwCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 비밀번호 확인 ==");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String inputPw = request.getParameter("pw");
		String logId = (String)session.getAttribute("logId");
		
		boolean check = false;
		try {
			check = MemberDAO.instance.idAndPwCheck(logId, inputPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/pain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check) {
			out.print("pass");
		} else {
			out.print("no");
		}
	
	}

}
