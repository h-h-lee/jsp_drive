<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminCSS/adminStyle.css">

<style type="text/css">

#btn1{
margin-left:480px;
}

.table{
margin-left:40px;
margin-right:300px;
}
#admin_1{
margin-left:200px;
}

</style>

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- menu 끝 -->

   <div class="wrap">
   <br>
	    <header class="w">
		    <h1>관리자 추가</h1>
	    </header>
	    
<jsp:include page="/WEB-INF/views/admin/adminAside.jsp"/>
<div id="container" class="clear">
<!-- <div class="lnb"> -->
<!--   <a href="#" class="list-group-item list-group-item-action active" aria-current="true">마이페이지</a> -->
<!--   <a href="#" class="list-group-item list-group-item-action">관리자 관리</a> -->
<!--   <a href="#" class="list-group-item list-group-item-action">A third link item</a> -->
<!--   <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
<!--   <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
<!-- </div> -->

<div class="content">
<div class="container">
    <div class="row">
        <div class="col-sm-15">
            <div class="col-sm-5"></div>
                <div class="col-sm-15" id="admin_1">
                    <h2 class="text-center">관리자 추가</h2>
						<br>                    
                    <form action="adminAdd.do" method="post">
					<input type="radio" name="admin_auth" value="1" checked>일반관리자
					<br>
					<br>
			<div class="form-group" >
				<b><label for="admin_id" class="col-lg-2 control-label">아이디</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="admin_id" name="admin_id"  placeholder="20자이내의 " maxlength="20">
				</div>
			</div>
			
			<br>
			<div class="form-group" >
				<b><label for="admin_name" class="col-lg-2 control-label">이름</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="admin_name" name="admin_name"  placeholder="20자이내의 " maxlength="20">
				</div>
			</div>
			
			<br>
			<div class="form-group" id="divPassword">
				<b><label for="passwd1" class="col-lg-2 control-label">패스워드</label></b>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="admin_passwd" name="admin_passwd"  placeholder="패스워드" maxlength="30">
				</div>
			</div><br>
			
				<div class="col-lg-offset-2 col-lg-10">
<!-- 					<button type="submit" class="btn btn-primary">로그인</button> -->
						<input type="submit" class="btn btn-primary" value="추가">
				</div>			


                </form>   
                     
                </div>
        </div> <!-- col-sm-12 -->
    </div><!-- row -->
</div> <!-- container end-->
		   
		    </div>
		    
		    
		    
		    
		    
		    
		    
	    </div>
    </div>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>