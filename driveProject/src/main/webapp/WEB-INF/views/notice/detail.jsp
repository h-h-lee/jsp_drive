<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<style type="text/css">
.detail-img{
	max-width:500px;
}	
#notice{
	font-size:30px;
	text-align: center;" 
}
.btn btn-primary{
	line-height:2.2;
}

.main-div{
	width:1200px; 
	margin:0 auto; 
	height: 200px;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div class="main-div">
<div id="menuinfo">
	공지사항 상세 페이지
</div>
</div>
	<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-bordered" style=" border: 1px solid #dddddd; font-size: 17px;">
					<tr>
						<td style="text-align: center;">작성자 번호</td>
						<td colspan="2">${notice.admin_num}</td>
					</tr>
					<tr>
						<td style="width: 20%; text-align: center;">글 제목</td>
						<td colspan="2" style="font-weight: 600;">${notice.title}</td>
					</tr>
					<tr>
						<td style="text-align: center;">내용</td>
						<td colspan="2" style="height: 200px; text-align: left;">${notice.content}<br>
							<img src="${pageContext.request.contextPath}/upload/${notice.filename}">
						</td>
					</tr>
			</table>
			
			<div class="btn-div" align="right">
			<a href="list.do" class="btn btn-primary">목록</a> &nbsp;
			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<c:if test="${admin_num == notice.admin_num}">
				<a href="updateForm.do?notice_num=${notice.notice_num}" class="btn btn-primary">수정</a> &nbsp;
				<a id="delete_btn" class="btn btn-primary">삭제</a>
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
		</div><br><br><br><br>
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>