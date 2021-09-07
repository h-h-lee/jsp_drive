<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div id="menu">
	<ul class="menu-main">
		<li><a href="#">학원 안내</a>
			<ul class="sub">
				<li><a href="#">학원 소개</a></li>
				<li><a href="#">찾아오시는 길</a></li>
				<li><a href="#">강사 소개</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
		</li>
		<li><a href="#">과정 안내</a>
			<ul class="sub">
				<li><a href="#">과정 소개</a></li>
			</ul>
		</li>
		<li><a href="#">수강 안내</a>
			<ul class="sub">
				<li><a href="#">수강 신청</a></li>
			</ul>
		</li>
		<li><a href="#">상담 안내</a>
			<ul class="sub">
				<li><a href="#">상담 신청</a></li>
			</ul>
		</li>
		<c:if test="${!empty member_num && empty admin_num}">
			<li><a href="#">마이 페이지</a>
				<ul class="sub">
					<li><a href="#">회원정보관리</a></li>
					<li><a href="#">수강신청내역</a></li>
					<li><a href="#">상담신청내역</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${empty member_num && empty admin_num}">
			<li><a href="#">마이 페이지</a>
				<ul class="sub">
					<li><a href="#">회원정보관리</a></li>
					<li><a href="#">수강신청내역</a></li>
					<li><a href="#">상담신청내역</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${!empty admin_num && empty member_num}">
			<li><a href="#">관리자 페이지</a>
				<ul class="sub">
					<li><a href="#">관리자 관리</a></li>
					<li><a href="#">과정 관리</a></li>
					<li><a href="#">수강신청내역관리</a></li>
					<li><a href="#">상담신청내역관리</a></li>
				</ul>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>