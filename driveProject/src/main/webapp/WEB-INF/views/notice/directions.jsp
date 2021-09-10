<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는 길</title>
<style type="text/css">
*{
	text-align:center;
}
.location{
	display: block; margin: 0px auto;
}
.square2{
	background:#3b3a38;
	width : 100%;
	height: 200px;
}
.call{
	width : 70px;
	height: 70px;
	margin-right:10px;
	
}
#footer{
	padding: 30px 0;
}
.address{
	float:left;
	margin-left:50px;
	color:#8f969c
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<br><br>
	<h1>서부권 최적의 위치</h1><br><br>
	강서, 양천, 영등포, 동작, 당산, 마포, 부천 지역 무료 셔틀버스 운행, 강서면허시험장 도보 3분거리, 남부순환로 대로변<br><br>
	
	<img src="${pageContext.request.contextPath}/images/notice/위치.jpg" class="location">
	
	<br><br><h1>버스 이용시</h1><br><br>
	<img src="${pageContext.request.contextPath}/images/notice/버스1.jpg" >
	<img src="${pageContext.request.contextPath}/images/notice/버스2.jpg" >
	<img src="${pageContext.request.contextPath}/images/notice/버스3.jpg" >
			
	외발산신광명마을 정류장<br>(학원 앞 하차)<br><br>388, 650, 651, 653, 662, 6628, 6630
	서울자동차학원 정류장<br>(학원 맞은편 하차)<br><br>마을버스 강서05, 강서05-1
	마곡수명산파크 7단지<br>(도보 5분)<br><br>388, 6630, 6632, 6642<br><br>
	
	<h1>지하철 연계노선</h1>
	<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" >
	5호선 까치산역	2번 출구에서 6628, 653번을 타고 외발산신광명마을 정류장 하차<br>
	<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" >
	5호선 화곡역	2번 출구에서 650번 또는 7번 출구 화곡역/에이스정형외과 앞 정류장에서 653번을 타고 외발산신광명마을 정류장 하차<br>
	<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" >
	5호선 마곡역	6번 출구에서 388번을 타고 외발산신광명마을 정류장 하차 또는 마을버스 강서05-1번을 타고 서울자동차학원 정류장 하차<br>
	<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" >
	5호선 발산역	9번 출구에서 6630번을 타고 외발산신광명마을 정류장 하차<br>
	<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" >
	5호선 우장산역	4번 출구에서 마을버스 강서05번을 타고 서울자동차학원 정류장 하차<br><br><br>
	
	  <div class="square2">
		 <footer id="footer">
		 <div class="address">
		 	상호 : 주식회사 서울자동차운전전문학원 l 대표자명: 이승훈 l 서울특별시 강서구 남부순환로 222 (외발산동)<br>
			Tel. 02-2665-6961 Fax. 02-2665-5958 E-mail: su803@seouldriver.co.kr l 학원 지정 번호 11-80<br>
			통신판매신고번호 : 제 2020-서울강서-0322호 l 사업자번호 : 312-86-07443 
		</div>	
			<img src="${pageContext.request.contextPath}/images/notice/전화.png" class="call">
			CALL CENTER<br>02-2665-6961</footer> 
	  </div>
</body>
</html>