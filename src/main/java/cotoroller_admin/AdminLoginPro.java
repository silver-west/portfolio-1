package cotoroller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		
		boolean next = false;
		try {
			boolean check = AdminDAO.instance.adminCheck(loginId, loginPw);
			if (check) {
				request.setAttribute("adminMent", null);
				next = true;
			} else {
				request.setAttribute("adminCheck", check);
				request.setAttribute("adminMent", "관리자 정보와 불일치 합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (next) {
			try {
				String adminNick = AdminDAO.instance.getAdminNick();
				HttpSession session = request.getSession();
				session.setAttribute("logId", loginId);
				session.setAttribute("logNick", adminNick);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String path = request.getContextPath();
			response.sendRedirect(path + "/Admin.do");
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("/Admin/01_login_admin.jsp");
			dis.forward(request, response);
		}
	}

}
