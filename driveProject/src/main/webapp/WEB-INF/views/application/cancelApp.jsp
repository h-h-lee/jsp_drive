<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 취소 완료</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<!-- style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- 본문 시작-->
	<div id="main-width">
		<div id="menuinfo">수강신청 취소</div>
		<div class="card bg-light text-dark">
	    	<div class="card-body text-center">
	    		<div class="font-weight-bold my-5">수강신청 취소가 완료되었습니다.</div>
	    		<div>
					<input type="button" value="수강신청 내역" class="btn btn-primary" onclick="location.href='listApp.do'">
					<input type="button" value="홈으로" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
				</div>
			</div>
	 	</div>
	</div>
	<!-- 본문 끝-->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>