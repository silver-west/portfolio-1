package controller_member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_member.AdminDAO;
import DB_member.MemberDAO;

@WebServlet("/NickCheck.do")
public class NickCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 닉네임 중복 체크 ==");
		request.setCharacterEncoding("UTF-8");
		
		String inputNick = request.getParameter("nick");
		
		boolean check = false;
		try {
			check = MemberDAO.instance.findNick(inputNick);
			if (check == false) {
				check = AdminDAO.instance.adminCheckFromNick(inputNick);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check) {
			out.print("duplicate");
		} else {
			out.print("pass");
		}
	}

}
