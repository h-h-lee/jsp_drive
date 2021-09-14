<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 내역</title>
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
		<div id="menuinfo">수강신청 내역</div>
		<div class="card">
		    <div class="card-body object-center text-center">
				<c:if test="${count==0}">
				<div class="font-weight-bold my-5">신청하신 과정이 없습니다.</div>
				<div>
				<input type="button" value="수강신청" class="btn btn-primary" onclick="location.href='registerAppForm.do'">
				<input type="button" value="홈으로" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
				</div>
				</c:if>
				<c:if test="${count>0}">
				<table class="table table-hover">
					<thead>
					<tr>
						<th width="30%">과정명</th>
						<th>강사명</th>
						<th>신청일</th>
						<th>신청결과</th>
						<th>신청취소</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="app" items="${list}">
					<tr>
						<td>${app.course_name}</td>
						<td>${app.teacher_name}</td>
						<td>${app.app_date}</td>
						<td>
							<c:if test="${app.app_result==0}"><span class="badge badge-pill badge-secondary">신청완료</span></c:if>
							<c:if test="${app.app_result==1}"><span class="badge badge-pill badge-primary">승인</span></c:if>
							<c:if test="${app.app_result==2}"><span class="badge badge-pill badge-danger">미승인</span></c:if>
						</td>
						<td><button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='cancelApp.do?app_num=${app.app_num}'"
							<c:if test="${app.app_result!=0}">disabled</c:if>
							>수강신청 취소</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="paging">${pagingHtml}</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 본문 끝 -->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>