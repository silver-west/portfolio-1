package controller_board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_board.Board;
import DB_board.BoardDAO;

@WebServlet("/BoardMain.do")
public class BoardMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== 게시판으로 이동합니다 ==");
		
		int totalPost = 0;
		try {
			ArrayList<Board> boardList = BoardDAO.instance.getBoard();
			request.setAttribute("boardList", boardList);
			totalPost = boardList.size();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		//페이징
		HttpSession session = request.getSession();
		int currentPage = (int)session.getAttribute("currentPage");
		int postCount = (int)session.getAttribute("postCount");
		int btnCount = (int)session.getAttribute("btnCount");
		
		//1. 게시글
		int startIdx = (currentPage - 1) * postCount;
		int endIdx = startIdx + postCount;
		if (endIdx > totalPost) {
			endIdx = totalPost;
		}
		
		//2. 버튼
		int startBtn = (currentPage - 1) / btnCount * btnCount + 1;
		int endBtn = startBtn + btnCount - 1;
		int lastBtn = totalPost / postCount;
		if (totalPost % postCount > 0) {
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
		
		
		RequestDispatcher dis = request.getRequestDispatcher("/Board/01_main_board.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
