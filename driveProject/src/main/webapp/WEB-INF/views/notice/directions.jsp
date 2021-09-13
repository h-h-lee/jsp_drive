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
	margin-top:100px;
	background:#3b3a38;
	width : 100%;
	height: 200px;
}
.square{
	color:white;
	width:150px;
	height:200px;
	vertical-align: middle;
	text-align: center;
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
.top-square{
	background:#8eb4d4;
	width : 100%;
	height: 230px;
}
.directions{
	font-size:60px;
	color:white;
	text-align: center;
	font-weight:bold;
}
h3{
	color:white;
	text-align: center;
}
.a EM{
	color:navy;
}
.a{
	color:gray;
}
.text{
	float:left;
	
}
.bus{
	float:left;
	margin-left: 700px
}
.num{
	color:gray;
	margin-left:170px;
}
.b{
	margin-left:170px;
}
.one{
	width:1000px;
	background-color:black;
	margin-left:450px;
	height:3px;
	border:none;
}
.two{
	width:1000px;
	background-color:#c5c6c9;
	margin-left:450px;
	height:1px;
	border:none;
}
.three{
	width:1200px;
	background-color:black;
	margin-left:450px;
	height:3px;
	border:none;
}
.four{
	width:1000px;
	background-color:#c5c6c9;
	margin-left:450px;
	height:1px;
	border:none;
}
.c{
	clear:both;
	color:black;
	font-size:30px;
	font-weight:bold;
}
.d{
	margin-left:100px;
}
.train{
	float:left;
	margin-left: 500px
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<br><br>
	<div class="top-square">
			<br><br><p class="directions">찾아오시는 길</p><br>
			<h3>서울자동차운전전문학원에 오시는 길을 안내해 드립니다.</h3>
			<p>
	</div>	
	<br><br><h1>서부권 최적의 위치</h1><br><br>
	<p class="a"><STRONG>강서, 양천, 영등포, 동작, 당산, 마포, 부천</STRONG> 지역 무료 셔틀버스 운행, 강서면허시험장 도보 3분거리, 남부순환로 대로변</p><br><br>
	
	<img src="${pageContext.request.contextPath}/images/notice/위치.jpg" class="location">
	
	  <br><br><h1>버스 이용시</h1><br><br>
	  
	  <hr class="one"><br><br>
	  <div class="bus">
			<img src="${pageContext.request.contextPath}/images/notice/버스1.jpg" align="left" >
			<p class="b">외발산신광명마을 정류장(학원 앞 하차)</p><br>
			<p class="num">388, 650, 651, 653, 662, 6628, 6630</p><br><br>
	  </div>
	  <hr class="two"><br><br>
	  <div class="bus">	 
			<img src="${pageContext.request.contextPath}/images/notice/버스2.jpg" align="left">
			<p class="b">서울자동차학원 정류장(학원 맞은편 하차)</p><br>
			<p class="num">마을버스 강서05, 강서05-1</p><br><br>
	  </div>
	  <hr class="two"><br><br>
	  <div class="bus">	 
			<img src="${pageContext.request.contextPath}/images/notice/버스3.jpg" align="left">
			<p class="b">마곡수명산파크 7단지(도보 5분)</p><br>
			<p class="num">388, 6630, 6632, 6642</p><br><br><br><br>
	  </div>
	  
		<p class="c">지하철 연계노선</p><br><br>
		<hr class="three"><br><br>
		<div class="train">
			<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" align="left">
			<p class="d">5호선 까치산역	2번 출구에서 6628, 653번을 타고 외발산신광명마을 정류장 하차</p><br><br>
		</div>	
		<hr class="four"><br><br>
		<div class="train">
			<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" align="left">
			<p class="d">5호선 화곡역	2번 출구에서 650번 또는 7번 출구 화곡역/에이스정형외과 앞 정류장에서 653번을 타고 외발산신광명마을 정류장 하차</p><br><br>
		</div>	
		<hr class="four"><br><br>
		<div class="train">
			<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" align="left">
			<p class="d">5호선 마곡역	6번 출구에서 388번을 타고 외발산신광명마을 정류장 하차 또는 마을버스 강서05-1번을 타고 서울자동차학원 정류장 하차</p><br><br>
		</div>	
		<hr class="four"><br><br>
		<div class="train">
			<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" align="left">
			<p class="d">5호선 발산역	9번 출구에서 6630번을 타고 외발산신광명마을 정류장 하차</p><br><br>
		</div>	
		<hr class="four"><br><br>
		<div class="train">
			<img src="${pageContext.request.contextPath}/images/notice/지하철.jpg" align="left">
			<p class="d">5호선 우장산역	4번 출구에서 마을버스 강서05번을 타고 서울자동차학원 정류장 하차</p><br><br>
	</div>
	
	<%-- <br><br> <div class="square2">
		 <footer id="footer">
		 <div class="address">
		 	상호 : 주식회사 서울자동차운전전문학원 l 대표자명: 이승훈 l 서울특별시 강서구 남부순환로 222 (외발산동)<br>
			Tel. 02-2665-6961 Fax. 02-2665-5958 E-mail: su803@seouldriver.co.kr l 학원 지정 번호 11-80<br>
			통신판매신고번호 : 제 2020-서울강서-0322호 l 사업자번호 : 312-86-07443 
		</div>	
			<img src="${pageContext.request.contextPath}/images/notice/전화.png" class="call">
			CALL CENTER<br>02-2665-6961</footer> 
	  </div>	 --%>
</body>
</html>