<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
h2{
	color:gray;
	text-align:center;
}
.container{
	text-align:center;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		//이벤트 연결
		$('#write_form').submit(function(){
			if($('#title').val().trim()==''){
				alert('제목을 입력하세요.');
				$('#title').val('').focus();
				return false;
			}
			if($('#content').val().trim()==''){
				alert('내용을 입력하세요.');
				$('#content').val('').focus();
				return false;
		}
	});
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	
	<div class="notice-main">
	<br><h2>게시판 글 작성</h2><br>		
	<div class="container">
		<div class="row">
			<form id="write_form" action="write.do" method="post" enctype="multipart/form-data">
			  <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
	    		 <tr>
					<th colspan="2" style="background-color: #eeeeee;">게시판 글쓰기 양식</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="width:1000px;height: 350px;"></textarea></td>
				</tr>
				<tr>
					<td><input type="file" class="form-control" placeholder="파일" name="filename" maxlength="50" accept="image/gif,image/png,image/jpeg"></td>
				</tr>
				</tbody>
			</table>
			<!-- 글쓰기 버튼 생성 -->
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기"><br><br>
		</form>
		</div>
	</div>
	<!-- 게시판 글쓰기 양식 영역 끝 -->
		
</div>
<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>