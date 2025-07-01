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

@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 아이디 중복 체크 ==");
		
		request.setCharacterEncoding("UTF-8");
		//1. 데이터 받아오기
		String inputId = request.getParameter("id");
		
		//2. 중복체크
		boolean check = false;
		try {
			check = MemberDAO.instance.findUser(inputId);
			//3. adminCheck
			if (check == false) {
				check = AdminDAO.instance.adminCheckFromId(inputId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//3. 응답 설정 + 결과 보내기
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check) {
			out.print("duplicate");
		} else {
			out.print("pass");
		}
	}

}
