package controller_point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_point.StoreItem;
import DB_point.StoreItemDAO;

@WebServlet("/ItemInfo.do")
public class ItemInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 상품 정보 페이지로 이동 ==");
		
		String str = request.getParameter("itemNum");
		int itemNum = Integer.parseInt(str);
		
		try {
			StoreItem item = StoreItemDAO.instance.getItem(itemNum);
			request.setAttribute("item", item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Point/06_itemInfo.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
