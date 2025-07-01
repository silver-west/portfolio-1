package cotoroller_admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.AdminDAO;

@WebServlet("/AdminLoginPro.do")
public class AdminLoginPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== Admin Login Pro ==");
		
		request.setCharacterEncoding("UTF-8");
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		boolean check = false;
		try {
			check = AdminDAO.instance.adminCheck(loginId, loginPw);
			if (check) {
				String adminNick = AdminDAO.instance.getAdminNick();
				HttpSession session = request.getSession();
				session.setAttribute("logId", loginId);
				session.setAttribute("logNick", adminNick);
			} else {
				System.out.println("관리자 로그인 시도");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		String path = request.getContextPath();
		response.sendRedirect(path + "/Admin.do");

	}

}
