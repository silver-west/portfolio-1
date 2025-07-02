package controller_point;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_point.Point;
import DB_point.PointDAO;

@WebServlet("/PointCheck.do")
public class PointCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 보유 포인트 체크 ==");
		request.setCharacterEncoding("UTF-8");
		
		String str = request.getParameter("vsPoint");
		int vsPoint = Integer.parseInt(str);
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("logId");
		
		boolean check = false;
		try {
			Point user = PointDAO.instance.getPointInfo(logId);
			if (user.getMyPoint() > vsPoint) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check) {
			System.out.println("포인트 체크 완료 : pass");
			out.print("pass");
		} else {
			System.out.println("포인트 체크 완료 : no");
			out.print("no");
		}
		
	}

}
