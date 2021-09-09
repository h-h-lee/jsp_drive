<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"> --%>
	
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/memberCSS_TEST/login_style.css"> --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = data.jibunAddress;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<!-- menu 끝 -->
	<div id="main-width">
		<br>
		<br>
		<br>
		<br>
		<h3>회원정보 수정</h3>
		<br>
		
<form class="member_joinForm" method="post" action="myPageModify.do">

			<div class="form-group" >
				<b><label for="id" class="col-lg-2 control-label">아이디</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="id" name="id"  placeholder="20자이내의 " maxlength="20" value="${member.id }" readonly="readonly">
				</div>
			</div>
			
			<br>
			


			<div class="form-group" id="divPassword">
				<b><label for="passwd1" class="col-lg-2 control-label">패스워드</label></b>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwd1" name="passwd1"  placeholder="패스워드" maxlength="30"  >
				</div>
			</div>
			
			<br>
			
			<div class="form-group" id="divPasswordCheck">
				<b><label for="passwd2"class="col-lg-2 control-label">패스워드 확인</label></b>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwd2" name="passwd2"  placeholder="패스워드 확인" maxlength="30" >
				</div>
			</div>
			
			<br>
			
			<div class="form-group" >
				<b><label for="name" class="col-lg-2 control-label">이름</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyAlphabetAndNumber" id="name" name="name" placeholder="이름" maxlength="20" value="${member.name}">
				</div>
			</div>
			
			
			
			
			<br>
			<div class="col-md-2">
				<b><label for="zipcode" class="form-label">우편번호</label></b>
			</div>

			<div class="row g-2">
				<div class="col-sm-2">
					<input type="text" class="form-control" id="zipcode" name="zipcode" readonly value="${member.zipcode }">
				</div>
				<div class="col-sm-5">
					<button type="button" class="btn btn-outline-dark" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
				</div>
			</div>
			<br>
			
			<div class="row g-3">
				<div class="col-sm-4">
					<input type="text" class="form-control" id="address1" name="address1" placeholder="지번주소" aria-label="City" value="${member.address1 }">
				</div>
				<span id="guide" style="color:#999;display:none"></span>
				
				<div class="col-sm-5">
					<input type="text" class="form-control" id="address2" name="address2"placeholder="상세주소" aria-label="State" value="${member.address2 }">
				</div>
			</div>
		<br>

			<div class="form-group" id="divEmail">
				<b><label for="email" class="col-lg-2 control-label">이메일</label></b>
				<div class="col-lg-10">
					<input type="email" class="form-control" id="email" name="email"  placeholder="이메일" maxlength="40" value="${member.email }">
				</div>
			</div>
			
			
			<div class="form-group" id="divEmail">
				<b><label for="birth" class="col-lg-2 control-label">생년월일</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일" maxlength="20" value="${member.birth }">
				</div>
			</div>			
			
			
			<br>
			
			
			<div class="form-group" id="divPhoneNumber">
				<b><label for="phone" class="col-lg-2 control-label">휴대폰번호</label></b>
				<div class="col-lg-10">
					<input type="tel" class="form-control onlyNumber" id="phone" name="phone" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="20" value="${member.phone }">
				</div>
			</div>
<br><br>
			<br>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="hidden" name="member_num" value="${member.member_num}">
<!-- 					<button type="submit" class="btn btn-primary">로그인</button> -->
						<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</div>
		</form>

		<br>
		<br>
		<br>
		<br>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
</body>
</html>