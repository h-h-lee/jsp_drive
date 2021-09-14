<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultingStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
table {
    width:500px; 
    margin: auto;
}

</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div id="main-width">
<div id="menuinfo">
	상담 상세 정보
</div>
	<div class="card my-3 bg-light">
		<div class="card-body my-3 text-center">
			<div class="text-danger font-weight-bold detail-admin-fontSize">
				상담 번호 : ${consulting.consulting_num}<br>
				 예약 일시 : 
				<fmt:formatDate value="${consulting.consulting_date}" pattern = "yyyy년MM월dd일 "/> 
				${consulting.consulting_time.substring(0,2)}시 ${consulting.consulting_time.substring(3,5)}분<br>
				접수 상태 : 
				<c:if test="${consulting.con_state==0}">
					접수완료
				</c:if>
				<c:if test="${consulting.con_state==1}">
					상담대기
				</c:if>
				<c:if test="${consulting.con_state==2}">
					상담완료
				</c:if>
				</div>
			</div>
		</div>
		<div class="card my-3">
			<div class="card-body my-2 text-center detail-info">
				<div>상담 예약 회원 정보</div>
			</div>
		</div>
	
		<div class="col-sm-5 table-align">
		<table class="table">
			<tr>
				<td class="col-sm-4 text-center font-weight-bold">아이디</td>
				<td class="col-sm-5">${consulting.id}</td>
			</tr>
			<tr>
				<td class="text-center font-weight-bold">이름</td>
				<td>${consulting.name}</td>
			</tr>
			<tr>
				<td class="text-center font-weight-bold">연락처</td>
				<td>${consulting.phone}</td>
			</tr>
			<tr>
				<td class="text-center font-weight-bold">이메일주소</td>
				<td>${consulting.email}</td>
			</tr>
			<tr>
				<td class="text-center font-weight-bold">우편번호</td>
				<td>${consulting.zipcode}</td>
			</tr>
			<tr>
				<td class="text-center font-weight-bold">자택 주소</td>
				<td>${consulting.address1}</td>
			</tr>
			<tr>
				<td class="text-center font-weight-bold">상세 주소</td>
				<td>${consulting.address2}</td>
			</tr>
		</table>
	</div>
	<div align="center" class="button-padding">
		<button class="btn btn-success" onclick="location.href='adminList.do'">목록으로</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>