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

@WebServlet("/AddCart.do")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 장바구니 추가 ==");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("logId");
		
		String str = request.getParameter("itemNum");
		int itemNum = Integer.parseInt(str);
		
		str = request.getParameter("orderCount");
		int orderCount = Integer.parseInt(str);
		
		boolean addCheck = false;
		try {
			addCheck = CartDAO.instance.addCart(logId, itemNum, orderCount);
			request.setAttribute("addCheck", addCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (addCheck) {
			String path = request.getContextPath();
			response.sendRedirect(path + "/Cart.do");
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("/Point/09_addCartFailed.jsp");
			dis.forward(request, response);
		}
		
		
	}

}
