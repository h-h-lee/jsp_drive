<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 내역(관리자)</title>
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
	<!-- 본문 시작 -->
	<div id="main-width">
		<h4 class="my-4 font-weight-bold">전체 수강신청 내역</h4>
		<div class="card my-3">
		    <div class="card-body object-center my-3 text-center">
				<c:if test="${count==0}">
					수강신청 내역이 없습니다.
					<div class="mt-3">
					<input type="button" value="홈으로" class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
					</div>
				</c:if>
				<c:if test="${count>0}">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>과정</th>
							<th>신청자</th>
							<th>신청일</th>
							<th>신청결과</th>
							<th>상세보기</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="app" items="${list}">
						<tr>
							<td>${app.course_name}</td>
							<td>${app.name}</td>
							<td>${app.app_date}</td>
							<td>
							<c:if test="${app.app_result==0}">신청완료</c:if>
							<c:if test="${app.app_result==1}">승인</c:if>
							<c:if test="${app.app_result==2}">미승인</c:if>
							</td>
							<td><button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='detailApp.do?app_num=${app.app_num}'">상세보기</button></td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
			<div class="my-3">${pagingHtml}</div>
			</c:if>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>