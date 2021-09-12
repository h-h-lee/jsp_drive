<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
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
		<h4 class="my-4 font-weight-bold">수강신청</h4>
		<!-- 안내사항 시작 -->
		<div class="card bg-light text-dark my-3">
	    	<div class="card-body object-center my-3">
	    		<h6 class="card-title text-danger font-weight-bold">&lt;안내사항&gt;</h6>
      			<p class="card-text">
      				도로주행 교육만 수강을 원하시는 경우 학원으로 문의바랍니다.<br>
					※ 모든 금액은 부가세 포함입니다.
      			</p>
	    	</div>
	 	</div>
	 	<!-- 안내사항 끝 -->
		<div class="card my-3">
		    <div class="card-body object-center my-3 text-center">
		    	<c:if test="${count==0}">
					<div>모집 중인 과정이 없습니다.</div>
				</c:if>
				<c:if test="${count>0}">
				<table class="table table-hover text-center">
					<thead>
					<tr>
						<th>과정명</th>
						<th>강사명</th>
						<th>수강료</th>
						<th>수강신청</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="course" items="${list}">
					<tr>
						<td>${course.course_name}</td>
						<td>강사명(수정예정)</td>
						<td><fmt:formatNumber value="${course.tuition}" type="number"/>원</td>
						<td><button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='registerApp.do?course_num=${course.course_num}'"
							<c:if test="${!empty admin_num}">disabled="disabled"</c:if>
						>수강신청</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
			</div>
			<div>${pagingHtml}</div>
		</div>
	</div>
	<!-- 본문 끝 -->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>