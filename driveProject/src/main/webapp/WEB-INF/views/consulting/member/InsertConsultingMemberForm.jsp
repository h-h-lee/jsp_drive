<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 신청</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
<script src="https://use.fontawesome.com/747c3ff62f.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div id="main-width">
<div id="menuinfo">
	상담 신청
</div>
<form id="consulting_register_form" action="register.do" method="post">
<input type="date" id="consulting_date" name="consulting_date" placeholder="상담 예약 날짜">
<select name="consulting_time_hour">
	<option value="09">09시</option>
	<option value="10">10시</option>
	<option value="11">11시</option>
	<option value="12">12시</option>
	<option value="14">14시</option>
	<option value="15">15시</option>
	<option value="16">16시</option>
	<option value="17">17시</option>
</select>
<select name="consulting_time_min">
	<option value="00">00분</option>
	<option value="30">30분</option>
</select>
<button type="submit" id="join-submit" class="btn btn-primary">상담 신청<i class="fa fa-check spaceLeft" style="color:white; margin-left: 3px;"></i></button>
<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">메인으로<i class="fa fa-times spaceLeft" style="color:white;margin-left: 3px;"></i></button>
</form>
</div>
</body>
</html>