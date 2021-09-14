<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//이벤트 연결
		$('#write_form').submit(function(){
			if($('#course_name').val().trim()==''){
				alert('과정명을 입력하세요');
				$('#course_name').val('').focus();
				return false;
			}
			if($('#teacher_num').val().trim()==''){
				alert('강사번호를 입력하세요');
				$('#teacher_num').val('').focus();
				return false;
			}
			if($('#tuition').val().trim()==''){
				alert('수강료를 입력하세요');
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
	<h2>과정 등록</h2>
	<form id="write_form" action="writeCourse.do" method="post" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="title">과정명</label>
				<input type="text" name="title" id="title" maxlength="30">
			</li>
			<li>
				<label for="teacher">강사번호</label>
				<input type="number" name="teacher" id="teacher" maxlength="10">
			</li>
			<li>
				<label for="tuition">수강료</label>
				<input type="number" name="tuition" id="tuition" maxlength="10">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='listCourse.do'">
		</div>
	</form>
</div>
</body>
</html>