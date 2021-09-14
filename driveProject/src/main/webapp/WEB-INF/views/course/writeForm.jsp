<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 등록</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
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
<style type="text/css">
#write_form{
	margin-left:200px;
}
</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div class="content">
	<div class="container">
		<div class="col-sm-15">
			<div class="col-sm-5">
			<br><br>
			<h2 class="text-center">과정 등록</h2>
			<br><br>
			<form id="write_form" action="write.do" method="post">
				<ul>
					<li>
						<label for="course_name">과정명</label>
						<input type="text" name="course_name" id="course_name" maxlength="30">
					</li>
					<li>
						<label for="teacher_num">강사번호</label>
						<input type="number" name="teacher_num" id="teacher_num" maxlength="10">
					</li>
					<li>
						<label for="tuition">수강료</label>
						<input type="number" name="tuition" id="tuition" maxlength="10">
					</li>
				</ul>
				<div class="align-center">
					<input type="submit" value="등록" class="btn btn-primary">
					<input type="button" value="목록" onclick="location.href='detail.do'" class="btn btn-secondary">
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>