package kr.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class AdminDeleteFormAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("으악");
		int admin_num2 = Integer.parseInt(request.getParameter("admin_num2"));
		
		System.out.println("아무것도."+admin_num2);
		request.setAttribute("admin_num2", admin_num2);
		
		
		return "/WEB-INF/views/admin/adminDeleteForm.jsp";
	}
}
