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
	text-align:center;
}
.paging{
	text-align:center;
}
.notice-display{
	font-size:20px;
	text-align:center;
}
.btn-div{
	margin-right:100px;
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
	<br><h2>게시판 목록</h2><br><br><br><br>
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
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach var="notice" items="${list}">
				<tr>
					<td>${notice.notice_num}</td>
					<td><a href="detail.do?notice_num=${notice.notice_num}">${notice.title}</a></td>
					<td>${notice.reg_date}</td>
					<td>${notice.hit}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
  </c:if>
  <!-- 글쓰기 버튼 생성 --><br><br><br><br><br><br>
			<div class="btn-div" align="right">
				<input type="button" class="btn btn-primary pull-right" value="글쓰기" onclick="location.href='writeForm.do'"> 
			</div><br><br><br><br>
</div>
<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>