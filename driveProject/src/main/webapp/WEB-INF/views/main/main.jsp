<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 메뉴</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<!-- carousel 시작 -->
<div id="main-carousel">
	<div id="carouselIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselIndicators" data-slide-to="1"></li>
			<li data-target="#carouselIndicators" data-slide-to="2"></li>
			<li data-target="#carouselIndicators" data-slide-to="3"></li>
			<li data-target="#carouselIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/images/main/main1.png" class="d-block w-100">
			</div>
			<div class="carousel-item" >
				<img src="${pageContext.request.contextPath}/images/main/main2.png" class="d-block w-100">
			</div>
			<div class="carousel-item" >
				<img src="${pageContext.request.contextPath}/images/main/main3.png" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/images/main/main4.png" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/images/main/main5.png" class="d-block w-100">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselIndicators" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span><!-- sr-only : 코드상에서는 보이지만 화면상에서는 보이지않음 -->
		</a>
		<a class="carousel-control-next" href="#carouselIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div><!-- carousel 끝 -->



<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>