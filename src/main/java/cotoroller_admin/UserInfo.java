package cotoroller_admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.Member;
import DB_point.Point;
import DB_point.PointDAO;

@WebServlet("/UserInfo.do")
public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 유저 정보 조회 ==");
		String str = request.getParameter("user");
		int userIdx = Integer.parseInt(str);
		
		HttpSession session = request.getSession();
		ArrayList<Member> memberList = (ArrayList<Member>)session.getAttribute("memberList");
		Member user = memberList.get(userIdx);
		
		try {
			Point pointInfo = PointDAO.instance.getPointInfo(user.getId());
			request.setAttribute("point", pointInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		request.setAttribute("userInfo", user);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/04_userInfo.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
