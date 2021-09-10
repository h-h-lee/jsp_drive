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

public class ModifyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		Integer admin_auth = (Integer)session.getAttribute("admin_auth");
		if(admin_auth==null) { //로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(admin_auth!=null && admin_auth >= 1) { //로그인이 되어있고 관라자인경우
			//자바빈(VO) 생성
			CourseVO update = new CourseVO();
			update.setCourse_num(Integer.parseInt(request.getParameter("course_num")));
			update.setCourse_name(request.getParameter("course_name"));
			update.setTeacher_num(Integer.parseInt(request.getParameter("teacher_num")));
			update.setTuition(Integer.parseInt(request.getParameter("tuition")));
			
			CourseDAO dao = CourseDAO.getInstance();
			dao.updateCourse(update);
			
			mapAjax.put("result", "success");
			
		}else { //로그인했지만 관리자가 아닌경우
			mapAjax.put("result", "notManager"); //wrongAccess 지우기
		}
		
		//JSON 데이터로 변환
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}



