package kr.consulting.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.consulting.dao.ConsultingDAO;
import kr.consulting.vo.ConsultingVO;
import kr.controller.Action;


public class ListMemberAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer member_num = (Integer)session.getAttribute("member_num");
		
		//세션에 저장된 값이 없으면 로그인 페이지 호출
		if(member_num == null) {
			return "redirect:/member/memberLoginForm.do";
		}
		
		ConsultingDAO dao = ConsultingDAO.getIntance();
		List<ConsultingVO>list = null;
		list=dao.ListConsulting(member_num);
		int count = dao.getMemberConsulting(member_num);
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		return "/WEB-INF/views/consulting/member/ListConsultingMember.jsp";
	}

}
