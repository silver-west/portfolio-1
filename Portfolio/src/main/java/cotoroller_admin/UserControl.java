package cotoroller_admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_member.Member;
import DB_member.MemberDAO;

@WebServlet("/UserControl.do")
public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 유저 관리 페이지 ==");
		
		try {
			ArrayList<Member> memberList = MemberDAO.instance.getMemberList();
			request.setAttribute("memberList", memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/03_userControl.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
