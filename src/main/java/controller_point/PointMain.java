package controller_point;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_point.History;
import DB_point.HistoryDAO;
import DB_point.Point;
import DB_point.PointDAO;

@WebServlet("/PointMain.do")
public class PointMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 포인트 메인으로 이동 ==");
		HttpSession session = request.getSession();
		
		String logId = (String)session.getAttribute("logId");
		System.out.println("--포인트 아이디 : " + logId);
		String sort = request.getParameter("sort");
		if (sort == null || !(sort.equals("ASC") || sort.equals("DESC"))) {
			sort = "ASC";
		}
		
		int totalHistory = 0;
		try {
			//1. ArrayList
			ArrayList<History> historyList = HistoryDAO.instance.getHistoryList(logId, sort);
			totalHistory = historyList.size();
			
			//2. Point
			Point pointInfo = PointDAO.instance.getPointInfo(logId);
			int totalPoint = pointInfo.getMyPoint();
			
			request.setAttribute("historyList", historyList);
			request.setAttribute("totalPoint", totalPoint);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		//3. 페이징
		int currentPage = (int)session.getAttribute("currentPage");
		int historyCount = (int)session.getAttribute("historyCount");
		int btnCount = (int)session.getAttribute("btnCount");
				
		//1. 게시글
		int startIdx = (currentPage - 1) * historyCount;
		int endIdx = startIdx + historyCount;
		if (endIdx > totalHistory) {
			endIdx = totalHistory;
		}
				
		//2. 버튼
		int startBtn = (currentPage - 1) / btnCount * btnCount + 1;
		int endBtn = startBtn + btnCount - 1;
		int lastBtn = totalHistory / historyCount;
		if (totalHistory % historyCount > 0) {
			lastBtn += 1;
		}
		if (endBtn > lastBtn) {
			endBtn = lastBtn;
		}
				
		request.setAttribute("startIdx", startIdx);
		request.setAttribute("endIdx", endIdx);
		request.setAttribute("startBtn", startBtn);
		request.setAttribute("endBtn", endBtn);
		request.setAttribute("lastBtn", lastBtn);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Point/01_main_point.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
