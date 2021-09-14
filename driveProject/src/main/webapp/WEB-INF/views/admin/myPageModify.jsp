<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 성공</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="style.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<!-- <link rel="stylesheet" href="./css/login_style.css"> -->

</head>
<style type="text/css">
.page-main{

margin-top:100px;
margin-left:380px;
}

#con{
font-size:30px;

}
</style>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- menu 끝 -->
<div id="main-width">


<div class="page-main" >
	<h2 id="h">관리자 마이페이지 수정</h2>
	<div class="align-center" id="con">
		수정 완료 되었습니다.<br><br>
		<input type="button"  class="btn btn-primary btn-lg" value="홈으로 이동" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		<input type="button"  class="btn btn-primary btn-lg" value="마이페이지로 이동" onclick="location.href='${pageContext.request.contextPath}/admin/mainAdminPageForm.do'">
	</div>
</div>

</div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>