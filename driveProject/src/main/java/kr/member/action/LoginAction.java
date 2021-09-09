package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

/**
 * FileName : LoginAction.java
 * @date :2021. 9. 9.
 * @author: 최유정
 * @description :
 */
public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
//		int member_num = Integer.parseInt(request.getParameter("member_num"));
		
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO memberVO = memberDAO.memberLogin(id);
		
		boolean check = false;
		
			
		if(passwd!=null) {
			check = memberVO.isCheckPassword(passwd);
		}
		
		if(check) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member_num", memberVO.getMember_num());
			session.setAttribute("member_id", memberVO.getId());
			session.setAttribute("member_passwd", memberVO.getPasswd());
			session.setAttribute("member_auth", memberVO.getAuth());
			
			System.out.println("멤버넘 세션 뭐지....?"+session.getAttribute("member_num"));
			//인증 성공시 호출
			return "redirect:/main/main.do";
		}
		
		
		//인증 실패시 호출
		return "/WEB-INF/views/memberLogin.jsp";
	}
}
