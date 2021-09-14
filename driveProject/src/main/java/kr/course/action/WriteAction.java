package kr.course.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.course.dao.CourseDAO;
import kr.course.vo.CourseVO;

public class WriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		Integer admin_auth = (Integer)session.getAttribute("admin_auth");
		if(admin_auth==null) { //로그인이 안된 경우
			mapAjax.put("result", "logout");
		}else if(admin_auth>=1){ //관리자인 경우
			CourseVO regist = new CourseVO();
			regist.setCourse_num(Integer.parseInt(request.getParameter("re_content")));
			regist.setCourse_name(request.getParameter("course_name"));
			regist.setTeacher_num(Integer.parseInt(request.getParameter("teacher_num")));
			regist.setTuition(Integer.parseInt(request.getParameter("tuition")));
			
			CourseDAO dao = CourseDAO.getInstance();
			dao.insertCourse(regist);
			
			mapAjax.put("result", "success");
		}else { //로그인했지만 관리자가 아닌 경우
			mapAjax.put("result", "notManager");
		}
		
		//JSON 데이터 생성
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/course/write.jsp";
	}

}
