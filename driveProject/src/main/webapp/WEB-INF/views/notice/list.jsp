<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	
<div class="notice-main">
	<h2>공지사항</h2>
	<h4>서울자동차운전전문학원의 공지사항을 확인해보세요.</h4>
	<div class="list-space align-right">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.do'"
			<c:if test="${empty admin_num}">disabled="disabled"</c:if>
		>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
	<c:if test="${count == 0}">
	<div class="notice-display">
		등록된 게시물이 없습니다.
	</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
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
	<div class="align-center">
		${pagingHtml}
	</div>
  </c:if>
</div>
</body>
</html>