package kr.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.admin.dao.AdminDAO;
import kr.admin.vo.AdminVO;
import kr.controller.Action;

public class AdminManageListForm implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Integer admin_num = (Integer)session.getAttribute("admin_num");
		
		if(admin_num==null) {
			return "redirect:/admin/adminLoginForm.do";
		}
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		List<AdminVO> list = adminDAO.adminList();
		
		request.setAttribute("adminList", list);
		return "/WEB-INF/views/admin/adminManageListForm.jsp";
	}

}
