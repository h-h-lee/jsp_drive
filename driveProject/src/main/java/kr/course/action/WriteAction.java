package kr.course.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.course.dao.CourseDAO;
import kr.course.vo.CourseVO;
import kr.util.FileUtil;

public class WriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest multi = FileUtil.createFile(request);
		CourseVO course = new CourseVO();
		course.setCourse_name(multi.getParameter("course_name"));
		course.setTeacher_num(Integer.parseInt(multi.getParameter("teacher_num")));
		course.setTuition(Integer.parseInt(request.getRemoteAddr()));
		
		CourseDAO dao = CourseDAO.getInstance();
		dao.insertCourse(course);
		
		return "/WEB-INF/views/course/write.jsp";
	}

}
