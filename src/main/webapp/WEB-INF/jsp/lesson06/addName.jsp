<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 추가하기</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<div class="form-group">
			<label for="name">이름</label>
			<div class="d-flex">
				<input type="text" class="form-control col-3" id="name">
				<button type="button" class="btn btn-info" id="nameCheckBtn">중복확인</button>
			</div>
			<small id="nameStatusArea"></small>
		</div>
		
		<button type="button" class="btn btn-success" id="joinBtn">회원가입</button>
	</div>
	
<script>
$(document).ready(function() {
	// 중복확인 버튼 클릭
	$('#nameCheckBtn').on('click', function() {
		// #nameStatusArea 하위 태그 초기화(글자 지움)
		$('#nameStatusArea').empty();
		
	//	alert("aaaa");
	
	// validation check
		// 이름 입력 확인
		let name = $('#name').val().trim();
		if(name == "") {
			$('#nameStatusArea').append('<span class="text-danger">이름이 비어있습니다.</span>');
			return;
		}
		
		// 이름이 중복되는지 확인(DB에서 조회) -> ajax 통신
		$.ajax({
			// requset
			type:"GET"
			, url:"/lesson06/ex02/is_duplication"
			, data:{"name":name}
		
		// response
			, success:function(data) {
			//	alert(data.is_duplication);
				if (data.is_duplication) {
					$('#nameStatusArea').append('<span class="text-danger">중복된 이름입니다.</span>');
				}
			}
			, error:function(e) {
				alert("중복 확인에 실패했습니다.");
			}
		});
	});
	
	// 회원 가입 클릭
	
	$('#joinBtn').on('click', function() {
	//	alert("aaaa");
	
	// 만약 nameStatusArea에 자식 노드(태그)가 없으면 서브밋을 한다.
		console.log($('#nameStatusArea').children());
	
		if ($('#nameStatusArea').children().lenght == 0) {
			alert("서브밋 가능");
		} else {
			alert("서브밋 불가");
		}
	});
});
</script>
</body>
</html>