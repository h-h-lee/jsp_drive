package kr.course.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.course.dao.CourseDAO;
import kr.course.vo.CourseVO;
import kr.util.StringUtil;

public class DetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//과정번호 반환
		int course_num = Integer.parseInt(request.getParameter("course_num"));
		
		CourseDAO dao = CourseDAO.getInstance();
		
		CourseVO course = dao.getCourse(course_num);
		
		//HTML를 허용하지 않음
		course.setCourse_name(StringUtil.useNoHtml(course.getCourse_name()));
		
		course.setTuition(course.getTuition());
		
		request.setAttribute("course", course);
		
		return "/WEB-INF/views/course/detail.jsp";
	}

}
