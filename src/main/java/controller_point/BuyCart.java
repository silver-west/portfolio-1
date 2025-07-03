package controller_point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_point.Point;
import DB_point.PointDAO;
import DB_point.StoreItemDAO;

@WebServlet("/BuyCart.do")
public class BuyCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 장바구니 아이템 구매 ==");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("logId");
		
		String[] itemNumList = request.getParameterValues("check");
		String[] orderCountList = request.getParameterValues("count");
		String totalPoint = request.getParameter("totalPoint");
		
		boolean check = false;
		try {
			check = StoreItemDAO.instance.buyCartList(logId, itemNumList, orderCountList, totalPoint);
			request.setAttribute("buyCheck", check);
			
			if (check) {
				Point user = PointDAO.instance.getPointInfo(logId);
				request.setAttribute("user", user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Point/11_buyCart.jsp");
		dis.forward(request, response);
		
	}

}
