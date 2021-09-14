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

</head>

<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div id="main-width">
<div id="menuinfo">
	과정 관리
</div>
<div>
	<input type="button" value="과정 등록" onclick="location.href='writeForm.do'" class="btn btn-primary">
	<br><br>
</div>
<c:if test='${count == 0}'>
	<div class="card my-3">
		<div class="card-body my-5 text-center">
			<br><br><br><br><br><br><br><br>
			<div class="text-danger" style="font-size: 18px; font-weight: bold;">등록된 과정이 없습니다.</div>
			<br><br><br><br><br><br><br><br>
		</div>
	</div>
</c:if>

<c:if test='${count > 0}'>
	<div class="row card-text">
		<c:forEach var="course" items="${list}">
	 		<div class="col-3 mb-4" >
				<div class="card card-width">
					<div class="card-body card-body-height">
	              			<br>
	           				<p>과정번호: ${course.course_num}</p>
	               			<p>과정명: ${course.course_name}</p>
	              			<p>강사번호: ${course.teacher_num}</p>
	              			<p>수강료: <fmt:formatNumber value="${course.tuition}" pattern="#,###"/> 원</p>
	              			<br>
	              		<input type="button" class="btn btn-info" value="수정" onclick="location.href='updateForm.do?course_num=${course.course_num}'">
	              		<input type="button" class="btn btn-danger deleteBtn" value="삭제" id="delete_${course.course_num}">
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<br><br><br>
	<div class="align-center">
		${pagingHtml}
	</div>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>