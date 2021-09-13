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
		    <h1>관리자 메인</h1>
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
                <div class="col-sm-15">
                    <h2 class="text-center">관리자 리스트</h2>
                    
                 
                 
<input type="button" value="관리자 추가" id="btn1" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/adminAddForm.do'">
                    
<!--                     <form action="MemberUpdateProc.jsp" method="post"> -->
<table class="table">
  <thead>
    <tr>
<!--       <th scope="col">#</th> -->
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">관리자 구분</th>
      <th scope="col"></th>
    </tr>
  </thead>
  
  <c:forEach var="list" items="${adminList}">
  <tbody>
    <tr>
<!--       <th scope="row">1</th> -->
      <td>${list.admin_id}</td>
      <td>${list.admin_name }</td>
      
      <c:if test="${list.admin_auth==1}">
      <td>일반관리자</td>
      </c:if>
       <c:if test="${list.admin_auth==2}">
      <td>최고관리자</td>
      </c:if>     
      
      <c:if test="${list.admin_auth==1}">
	  <td><input type="button"  class="btn btn-danger btn-sm" value="삭제" onclick="location.href='${pageContext.request.contextPath}/admin/adminDelete.do'" ></td>      
	  <input type="hidden" name="admin_num2" value="${list.admin_num}">
	  <td>${list.admin_num}</td>
      </c:if>
    </tr>
  </tbody>
  </c:forEach>
</table>
<!--                 </form>    -->
                     
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