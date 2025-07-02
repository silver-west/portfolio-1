package controller_point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_point.StoreItemDAO;

@WebServlet("/BuyItem.do")
public class BuyItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 아이템 구매 ==");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("logId");
		
		String str = request.getParameter("itemNum");
		int itemNumber = Integer.parseInt(str);
		
		str = request.getParameter("orderPrice");
		int orderPrice = Integer.parseInt(str);
		
		try {
			boolean buyCheck = StoreItemDAO.instance.buyItem(logId, itemNumber, orderPrice);
			request.setAttribute("buyCheck", buyCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Point/07_order.jsp");
		dis.forward(request, response);
	}

}
