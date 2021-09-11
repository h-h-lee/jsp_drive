<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 소개</title>
<style type="text/css">
*{
	text-align: center;
	margin:0;
	padding:0;
}
.top-square{
	background:#8eb4d4;
	width : 100%;
	height: 200px;
}
.introduce{
	font-size:60px;
	color:white;
	text-align: center;
	font-weight:bold;
}
.square img{
	width:150px;
 	height: 150px;
	float:left;
	margin-right:100px;
	margin-left:100px;
}
h3{
	color:white;
	text-align: center;
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
	<br><br><br>
	<div class="introduce-top">
		<div class="top-square">
			<br><p class="introduce">인사말</p><br>
			<h3>서울자동차운전전문학원을 소개합니다.</h3>
			<p>
		</div>	
	</div>
	<div class="introduce-inner">		
		<br><br><h2>“고객만족을 뛰어넘어 고객감동이 실현되는 그 날까지…”</h2><br><br>
		<h4>서울자동차운전전문학원의 임직원 일동은 교육생의 신속한 면허취득과 우수한 안전 운전능력 습득을 위해 부단한 연구와 노력을 계속하고 있습니다.
				<br>이를 통해, 고객만족을 뛰어넘어 고객감동이 실현되는 그 날까지 최선을 다할 것을 약속 드립니다.</h4>
			<p>		
		<br><br><br><br><h2>서울자동차운전전문학원이 고객께 드리는 약속</h2>	
	  <div class="pic">
		<br><br><div class="square">
			<img src="${pageContext.request.contextPath}/images/notice/합격률.jpg" >
		</div>	
		<div class="square">
			<img src="${pageContext.request.contextPath}/images/notice/서비스.webp">
		</div>	
		<div class="square">
			<img src="${pageContext.request.contextPath}/images/notice/스케줄.webp">
		</div>	
		<div class="square">
			<img src="${pageContext.request.contextPath}/images/notice/온라인활용.webp">
		</div>	
	  </div><br><br><br><br><br><br><br><br>
	    최고의 합격률<br><br>   친절한 서비스<br><br>   맞춤 스케쥴<br><br>   온라인 활용<br><br> 
		100% 합격을 위한 부단한 노력<br><br>
		교육시간 및 고객응대 시 고객의 마음으로<br><br>
		바쁜 고객의 신속한 면허취득을 위해<br><br>
		신속한 등록 및 각종 정보 조회<br><br>
		
		<h2>친절한 전문 강사진</h2><br><br>
		베테랑 전문강사 및 1대1 맞춤교육 최고의 합격율, 편안한 교육환경, 신속한 면허취득, 상호 신뢰, 교육의욕 고취, 안전운전 기술 습득<br><br>
		
	  </div>	
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