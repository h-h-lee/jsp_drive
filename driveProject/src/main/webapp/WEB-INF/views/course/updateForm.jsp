<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
//유효성 체크
	$(document).ready(function(){
		$('#update_form').submit(function(){
			if($('#course_name').val().trim()==''){
				alert('과정명을 입력하세요');
				$('course_name').val('').focus();
				return false;
			}
			if($('#tuition').val().trim()==''){
				alert('수강료를 입력하세요!');
				$('#tuition').val('').focus();
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

<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h2>과정 수정</h2>
	<form action="updateCourse.do" method="post" enctype="multipart/form-data" id="update_form">
		<input type="hidden" name="course_num" value="${course.course_num}">
		<ul>
			<li>
				<label for="title">과정명</label>
				<input type="text" name="title" id="title" value="${course.course_name}" maxlength="30">
			</li>
			<li>
				<label for="tuition">수강료</label>
				<input type="number" name="tuition" id="tuition" value="${course.tuition}" maxlength="10">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='listCourse.do'">
		</div>
	</form>
</div>
</body>
</html>




