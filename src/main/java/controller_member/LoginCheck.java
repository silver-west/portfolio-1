package controller_member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_member.MemberDAO;

@WebServlet("/LoginCheck.do")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== login Check ==");
		request.setCharacterEncoding("UTF-8");
		
		String inputId = request.getParameter("id");
		String inputPw = request.getParameter("pw");
		
		boolean loginCheck = false;
		try {
			loginCheck = MemberDAO.instance.idAndPwCheck(inputId, inputPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (loginCheck) {
			out.print("pass");
		} else {
			out.print("no");
		}
	}

}
