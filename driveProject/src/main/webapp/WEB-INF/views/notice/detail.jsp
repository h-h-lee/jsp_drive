<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<style type="text/css">
.detail-img{
	max-width:500px;
}	
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	
	<div class="notice-detail">
	<h2>게시판 상세 페이지</h2>
	<ul>
		<li>글번호 : ${notice.notice_num}</li>
		<li>제목 : ${notice.title}</li>
		<li>작성자 : ${notice.id}</li>
		<li>조회수 : ${notice.hit}</li>
	</ul>
	<hr size="1" noshade width="100%">
	<c:if test="${!empty notice.filename}">
	<div class="align-center">
		<img src="${pageContext.request.contextPath}/upload/${notice.filename}" class="detail-img">
	</div>
	</c:if>
	<p>
		${notice.content}
	</p>
	<hr size="1" noshade width="100%">
	<div class="align-right">
		작성일 : ${notice.reg_date}
		<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정,삭제 가능 --%>
		<c:if test="${admin_num == notice.admin_num}">
		<input type="button" value="수정" onclick="location.href='updateForm.do?notice_num=${notice.notice_num}'">
		<input type="button" value="삭제" id="delete_btn">	
		<script type="text/javascript">
			var delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				var choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?notice_num=${notice.notice_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
	</div>
</body>
</html>