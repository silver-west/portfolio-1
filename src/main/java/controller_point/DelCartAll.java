package controller_point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_point.CartDAO;

@WebServlet("/DelCartAll.do")
public class DelCartAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 장바구니 선택 삭제 ==");
		request.setCharacterEncoding("UTF-8");
		
		String[] itemNumList = request.getParameterValues("check");
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("logId");
		
		boolean check = false;
		try {
			check = CartDAO.instance.delCartAll(logId, itemNumList);
			request.setAttribute("delCartAll", check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (check) {
			String path = request.getContextPath();
			response.sendRedirect(path + "/Cart.do");
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("/Point/10_delCartFailed.jsp");
			dis.forward(request, response);
		}
	}

}
