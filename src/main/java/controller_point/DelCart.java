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


@WebServlet("/DelCart.do")
public class DelCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 장바구니 삭제 ==");
		request.setCharacterEncoding("UTF-8");
		
		String str = request.getParameter("itemNum");
		int itemNum = Integer.parseInt(str);
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("logId");
		
		boolean delCheck = false;
		try {
			delCheck = CartDAO.instance.delCart(logId, itemNum);
			request.setAttribute("delCheck", delCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (delCheck) {
			System.out.println("== 장바구니 삭제 성공 ==");
			String path = request.getContextPath();
			response.sendRedirect(path + "/Cart.do");
		} else {
			System.out.println("장바구니 삭제 중 시스템 오류");
			RequestDispatcher dis = request.getRequestDispatcher("/Point/10_delCartFailed.jsp");
			dis.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
