package kr.consulting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;

public class RegisterFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer member_num = (Integer)session.getAttribute("member_num");
		
		//���ǿ� ����� ���� ������ �α��� ������ ȣ��
		if(member_num == null) {
			return "redirect:/member/memberLoginForm.do";
		}
		
		return "/WEB-INF/views/consulting/member/InsertConsultingMemberForm.jsp";
	}

}
