<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var currentPage;
		var count;
		var rowCount;
		//과정 목록
		function selectData(pageNum){
			currentPage = pageNum;
			
			if(pageNum == 1){
				//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
				$('#output').empty();
			}
			
			//로딩 이미지 노출
			$('#loading').show();
			
			$.ajax({
				type:'post',
					  //key    value(17줄의 파라미터)
				data:{pageNum:pageNum,course_num:$('#course_num').val()},
				url:'listCourse.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('#loading').hide();
					count = param.count;
					rowCount = param.rowCount;
					
					$(param.list).each(function(index,item){
						var output = '<div class="item">';
						output += '<h4>' + item.id + '</h4>';
						output += '<div class="sub-item">';
						output += '<p>' + item.re_content + '</p>';
						output += item.re_date;
						//로그인한 회원의 권한이 1이상인지 체크
						if($('#admin_auth').val() >= 1){
							output += ' <input type="button" data-renum="'+item.re_num+'" data-memnum="'+item.mem_num+'" value="수정" class="modify-btn">';
							output += ' <input type="button" data-renum="'+item.re_num+'" data-memnum="'+item.mem_num+'" value="삭제" class="delete-btn">';
						}
						output += '<hr size="1" noshade width="100%">';
						output += '</div>';
						output += '</div>';
						
						//문서 객체에 추가
						$('#output').append(output);
					});
					
					//page button 처리
					if(currentPage>=Math.ceil(count/rowCount)){
						//다음 페이지가 없음
						$('.paging-button').hide();
					}else{
						//다음 페이지가 존재
						$('.paging-button').show();
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		}
		//페이지 처리 이벤트 연결(다음 댓글 보기 버튼 클릭시 데이터 추가)
		$('.pging-button input').click(function(){
			selectData(currentPage + 1);
		});
		//과정 등록
		$('#course_form').submit(function(event){
			if($('#course_name').val().trim() == ''){
				alert('과정명을 입력하세요!');
				$('#course_name').val('').focus();
				return false;
			}
			
			//form 이하의 태그에 입력한 데이터를 모두 읽어옴
			var form_data = $(this).serialize();
			
			//과정 등록
			$.ajax({
				type:'post',
				data:form_data,
				url:'writeCourse.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'logout' || param.result == 'notManager'){
						alert('관리자만 등록할 수 있습니다.');
					}else if(param.result == 'success'){
						//폼 초기화
						initForm();
						//댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫번째 페이지의 게시글을 다시 호출함
						selectData(1);
					}else{
						alert('등록시 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류!');
				}
			});
			
			//기본 이벤트 제거
			event.preventDefault();
		});
		
		//과정 수정
		$(document).on('submit','#course_form',function(event){
			//수정
			$.ajax({
				url:'updateCourse.do',
				type:'post',
				data:form_data,
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'logout' || param.result == 'notManager'){
						alert('관리자만 등록할 수 있습니다.');
					}else if(param.result=='success'){													// <br>을 g, 모두 검색. gi는 대소문자 구별 x
						$('#course_form').parent().find('p').html($('#mre_content').val().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\n/g,'<br>'));
						//수정폼 삭제 및 초기화
						initModifyForm();
					}else if(param.result=='wrongAccess'){
						alert('타인의 글을 수정할 수 없습니다.');
					}else{
						alert('수정 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
			//기본 이벤트 제거
			event.preventDefault();
		});
		//과정 삭제
		$(document).on('click','.delete-btn',function(){
			//과정 번호
			var course_num = $(this).attr('data-renum');
			
			$.ajax({
				type:'post',
				url:'deleteCourse.do',
				//	  key    value
				data:{re_num:re_num,mem_num:num},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인해야 삭제할 수 있습니다.');
					}else if(param.result == 'success'){
						alert('삭제 완료!');
						selectData(1);
					}else if(param.result == 'wrongAccess'){
						alert('타인의 글을 삭제할 수 없습니다.');
					}else{
						alert('삭제시 오류 발생!');
					}
				},
				error:function(){
					alert('네트워크 오류 발생!');
				}
			});
		});
		//초기 데이터(목록) 호출
		selectData(1);
	});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h2>과정 상세정보</h2>
	<ul>
		<li>과정 번호 : ${course.course_num}</li>
		<li>과정 이름 : ${course.course_name}</li>
		<li>담당 강사 : ${course.teacher_num}</li>
		<li>수강료 : ${course.tuition}</li>
	</ul>
	<hr size="1" noshade width="100%">
	<c:if test="${!empty course.filename}">
	<div class="align-center">
		<img src="${pageContext.request.contextPath}/upload/${course.filename}" class="detail-img">
	</div>
	</c:if>
	<hr size="1" noshade width="100%">
	<div class="align-right">
		작성일 : ${course.reg_date}
		최근 수정일 : ${course.modify_date}
		<%-- 로그인한 회원의 권한이 1이상이어야 수정,삭제 가능 --%>
		<c:if test="${admin_auth >= 1}">
		<input type="button" value="수정" onclick="location.href='updateForm.do?course_num=${course.course_num}'">
		<input type="button" value="삭제" id="delete_btn">	
		<script type="text/javascript">
			var delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				var choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('deleteCourse.do?course_num=${course.course_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='listCourse.do'">
	</div>
</div>
</body>
</html>









