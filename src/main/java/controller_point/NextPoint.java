package controller_point;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/NextPoint.do")
public class NextPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 선택 페이지로 이동 ==");
		
		String str = request.getParameter("nextPage");
		int nextPage = Integer.parseInt(str);
		
		HttpSession session = request.getSession();
		session.setAttribute("currentPage", nextPage);
		
		String path = request.getContextPath();
		response.sendRedirect(path + "/PointMain.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
