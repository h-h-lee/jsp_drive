<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#write').on('click', function() {
			var choice = confirm('과정을 등록하시겠습니까?');
			if(choice){
				var course_num = $(this).attr('id');
				location.replace('writeCourse.do?course_num='+course_num);
			}else {
				return false;
			}
  		});
 	});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div id="main-width">
	<div id="menuinfo">과정 목록</div>
	<c:if test="${admin_auth >= 1}">
		<div>
			<input type="button" onclick="location.href='writeForm.jsp'" value="과정 등록">
		</div>
	</c:if>
	<c:if test='${count == 0}'>
		<div class="card my-3">
			<div class="card-body my-5 text-center">
				<div class="text-danger" style="font-size: 18px; font-weight: bold;">등록된 과정이 없습니다.</div>
			</div>
		</div>
	</c:if>

	<c:if test="${count > 0}">
		<div class="row card-text">
			<c:forEach var="course" items="${list}">
				<div class="col-3 mb-4">
				<br><br><br>
					<tr>
						<td>과정번호 : ${course.course_num}<br></td>
						<td>과정명 : ${course.course_name}<br></td>
						<td>강사번호 : ${course.teacher_num}<br></td>
						<td>수강료 : <fmt:formatNumber value="${course.tuition}" pattern="#,###"/> 원<br></td>
					</tr>
				<br><br><br>
				</div>
			</c:forEach>
		</div>
		<div class="align-center">
			${pagingHtml}
		</div>
	</c:if>
</div>
</body>
</html>