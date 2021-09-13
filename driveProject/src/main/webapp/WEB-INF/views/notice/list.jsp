<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style type="text/css">
h2{
	color:gray;
	text-align:center;
}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	
<div class="notice-main">
	<h2>게시판 목록</h2>
	<c:if test="${count == 0}">
	<div class="notice-display">
		등록된 게시물이 없습니다.
	</div>
	</c:if>
	<c:if test="${count > 0}">
	
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach var="notice" items="${list}">
				<tr>
					<td>${notice.notice_num}</td>
					<td><a href="detail.do?notice_num=${notice.notice_num}">${notice.title}</a></td>
					<td>${notice.id}</td>
					<td>${notice.reg_date}</td>
					<td>${notice.hit}</td>
				</tr>
				</c:forEach>
			</table>
			<!-- 글쓰기 버튼 생성 -->
			<a href="writeForm.do" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<div class="align-center">
		${pagingHtml}
	</div>
  </c:if>
</div>
<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>