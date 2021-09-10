package kr.course.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.course.dao.CourseDAO;

public class DeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//인코딩처리
		request.setCharacterEncoding("utf-8");
		
		//전송된 데이터 반환
		int course_num = Integer.parseInt(request.getParameter("course_num"));
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		Integer admin_auth = (Integer)session.getAttribute("admin_auth");
		if(admin_auth==null) { //로그인이 안된 경우
			mapAjax.put("result","logout");
		}else if(admin_auth!=null && admin_auth >= 1) { //관리자인 경우
			CourseDAO dao = CourseDAO.getInstance();
			dao.deleteCourse(course_num);
			
			mapAjax.put("result", "success");
		}else { //로그인했지만 관리자가 아닌 경우
			mapAjax.put("result", "wrongAccess");
		}
		
		//JSON 데이터로 변환
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
	
}
