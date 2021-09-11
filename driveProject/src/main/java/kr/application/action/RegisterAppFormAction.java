package kr.application.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class RegisterAppFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//과정 목록 ----- 과정 파트 완성되면 추가
		
		
		
		return "/WEB-INF/views/application/registerAppForm.jsp";
	}
}