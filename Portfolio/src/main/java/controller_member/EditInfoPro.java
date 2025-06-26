package controller_member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB_member.Member;
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
		String pw = request.getParameter("editPw");
		String nickName = request.getParameter("editNick");
		
		
		String beforeNick = null;
		boolean nickCheck = false;
		try {
			Member member = MemberDAO.instance.getMemberFromId(id);
			beforeNick = member.getNickName();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (nickName.equals(beforeNick)) {
			System.out.println("닉네임 수정X");
		} else {
			try {
				nickCheck = MemberDAO.instance.findNick(nickName);
				if (nickCheck) {
					request.setAttribute("editMent2", "닉네임 중복");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (nickCheck == false) {
			try {
				boolean check = MemberDAO.instance.editMember(id, pw, nickName);
				if (check) {
					session.setAttribute("logNick", nickName);
				}
				request.setAttribute("infoEditCheck", check);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("/Member/07_editInfoPro.jsp");
		dis.forward(request, response);
	}

}
