package controller_point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB_point.HistoryDAO;
import DB_point.Point;
import DB_point.PointDAO;

@WebServlet("/SendPointPro.do")
public class SendPointPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== send Point pro ==");
		request.setCharacterEncoding("UTF-8");
		
		boolean check = false;
		
		//info 
		String sendUser = request.getParameter("sendUser");
		String search = request.getParameter("type");
		String recieve = request.getParameter("recieve");
		
		String str = request.getParameter("sendPoint");
		int sendPoint = Integer.parseInt(str);
		
		String comentSend = String.format("%s 님께 포인트 전송", recieve);
		String comentReceive = String.format("%s 님께 포인트 받음", sendUser);
		
		try {
			//1. pointUpdate
			boolean sendCheck = PointDAO.instance.sendPoint(sendUser, recieve, sendPoint, search);
			if (sendCheck) {
				//2. historyUpdate
				boolean addHisCheck = HistoryDAO.instance.addHistory(sendUser, comentSend, sendPoint, "minus");
				boolean addHisCheck2 = HistoryDAO.instance.addHistory(recieve, comentReceive, sendPoint, "plus");
				
				if (addHisCheck && addHisCheck2) {
					check = true;
					Point user = PointDAO.instance.getPointInfo(sendUser);
					
					request.setAttribute("sendCheck", check);
					request.setAttribute("user", user);
				}
			}
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Point/04_sendPointPro.jsp");
		dis.forward(request, response);
	}

}
