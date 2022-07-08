<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" class="form-control" id="name">
		</div>

		<div class="form-group">
			<label for="url">URL 주소</label>
			<div class="form-inline">
				<input type="text" class="form-control col-10" id="url">
				<button type="button" id="checkDuplicateBtn" class="btn btn-info">중복확인</button>
			</div>
			<small id="duplicationText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableUrlText" class="text-success d-none">저장 가능한 url 입니다.</small>
		</div>
		
		<button type="button" id="addBtn" class="btn btn-success btn-block">추가</button>
	</div>
	
<script>
$(document).ready(function() {
	
	// URL 중복확인
	$('#checkDuplicateBtn').on('click', function() {
		let url = $('#url').val().trim();
		if (url == '') {
			alert("URL을 입력하세요.");
			return;
		}
		
		// 중복확인 AJAX 통신 - db 확인
		$.ajax({
			// request
			type: "POST"
			, url: "/lesson06/is_duplication_url"
			, data: {"url":url}
			
			// response
			, success: function(data) {
				if (data.is_duplication) {
					// 중복일 때
					$('#duplicationText').removeClass('d-none');
					$('#availableUrlText').addClass('d-none');
				} else {
					// 사용 가능
					$('#availableUrlText').removeClass('d-none');
					$('#duplicationText').addClass('d-none');
				}
			}
			, error: function(e) {
				alert("중복 검사에 실패했습니다.");
			}
		});
		
	});
	
	$('#addBtn').on('click', function(e) {
		let name = $('#name').val().trim();
		let url = $('#url').val().trim();
		
		// validation
		if (name.length < 1) {
			alert("제목을 입력하세요");
			return;
		}
		
		if (url == "") {
			alert("주소를 입력하세요");
			return;
		}
		
		// http 도 아니고(그리고) https도 아닐 때 => alert
		if (url.startsWith("http") == false && url.startsWith("https") == false) {
			alert("주소 형식이 잘못되었습니다.");
			return;
		}
		
		// URL 중복확인 체크
		// '저장 가능한 URL입니다.' 문구가 숨겨져 있을 때 alert을 띄운다.
		// d-none이 있을 때
		if ($('#availableUrlText').hasClass('d-none')) {
			alert("URL 중복확인을 다시 해주세요.");
			return;
		}
		
		// ajax 통신 - insert
		$.ajax({
			// request
			type:"POST"
			, url:"/lesson06/add_favorite"
			, data:{"name":name, "url":url}
			
			// response    "{"result":"success"}"
			, success: function(data) { // json str을 object로 변환해줌
				if (data.result == "success") {
					alert("입력 성공했습니다.");
					location.href = "/lesson06/favorite_list_view";
				}
			}
			, error: function(e) {
				alert("e:" + e);
			}
		});
	});
});
</script>
</body>
</html>



