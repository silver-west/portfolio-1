package controller_member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.MemberDAO;

@WebServlet("/EditInfoPro.do")
public class EditInfoPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== editinfoPro page ==");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("logId");
		String beforeNick = (String)session.getAttribute("logNick");
		String pw = request.getParameter("editPw");
		String editNick = request.getParameter("editNick");
		
		boolean check = false;
		boolean memberCheck = false;
		boolean nickCheck = false;
		String editMent = null;
		if (editNick.equals(beforeNick)) {
			System.out.println("닉네임 수정X");
			editMent = "현재 닉네임이랑 같습니다";
		} else {
			try {
				memberCheck = MemberDAO.instance.findNick(editNick); //있으면 true
				boolean adminCheck = MemberDAO.instance.nickCheck(editNick); //같으면 true
				if (memberCheck || adminCheck) {
					editMent = "중복된 닉네임 입니다.";
				} else {
					nickCheck = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (nickCheck) {
			try {
				boolean editcheck = MemberDAO.instance.editMember(id, pw, editNick);
				if (editcheck) {
					check = true;
					session.setAttribute("logNick", editNick);
				} else {
					editMent = "시스템 오류";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("editMent", editMent);
		request.setAttribute("infoEditCheck", check);
		RequestDispatcher dis = request.getRequestDispatcher("/Member/07_editInfoPro.jsp");
		dis.forward(request, response);

		
	}

}
