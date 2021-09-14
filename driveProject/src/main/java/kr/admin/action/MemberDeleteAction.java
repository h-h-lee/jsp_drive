package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

public class MemberDeleteAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		String admin_id = (String)session.getAttribute("admin_id"); //로그인되 최고관리자		
		
		if(admin_num==null) { //로그인이 안됐을때
			return "redirect:/admin/adminLoginForm.do";
		}
		
		String id2 = request.getParameter("id2");
		String passwd = request.getParameter("passwd1");
		int member_num2 = Integer.parseInt(request.getParameter("member_num2"));
		System.out.println("제대로 다 찍히는지...?"+id2+"\t"+passwd+"\t"+member_num2);

		boolean check = false;
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		AdminVO adminVO = adminDAO.adminLogin(admin_id);
		
		if(adminVO!=null&& admin_id !=null) {
			check = adminVO.isCheckPassword(passwd);
		}		
		System.out.println("2비밀번호체크 true넘어와야 성공....."+check);
		
		if(check) {
			adminDAO.memberDelete(member_num2);
		}
		
		
		return "redirect:/admin/memberManageListForm.do";
	}
}
