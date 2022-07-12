<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>통나무 팬션</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- stylesheet -->
<link rel="stylesheet" type="text/css" href="/css/lesson06_quiz03.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<div class="display-4">통나무 팬션</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">팬션소개</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/quiz03/2"
					class="nav-link text-white font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/quiz03/1"
					class="nav-link text-white font-weight-bold">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
			<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
			<div class="d-flex justify-content-center">
				<div class="reservation-box">
					<div class="subject-text my-2 font-weight-bold">이름</div>
					<input type="text" class="form-control" name="name">

					<div class="subject-text my-2 font-weight-bold">예약날짜</div>
					<input type="text" class="form-control" name="date">

					<div class="subject-text my-2 font-weight-bold">숙박일수</div>
					<input type="text" class="form-control" name="day">

					<div class="subject-text my-2 font-weight-bold">숙박인원</div>
					<input type="text" class="form-control" name="headcount">

					<div class="subject-text my-2 font-weight-bold">전화번호</div>
					<input type="text" class="form-control" name="phoneNumber">

					<button type="button" id="reservationBtn"
						class="btn btn-warning w-100 mt-3">예약하기</button>
				</div>
			</div>
		</section>
		<footer>
			<small class="text-secondary"> 제주특별자치도 제주시 애월읍<br>
				사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br> Copyright 2025
				tongnamu. All right reserved.
			</small>
		</footer>
	</div>
	
<script>
$(document).ready(function() {
	// 예약하기 버튼 클릭
	$('#reservationBtn').on('click', function() {
		let name = $('input[name=name]').val().trim();
		let date = $('input[name=date]').val().trim();
		let day = $('input[name=day]').val().trim();
		let headcount = $('input[name=headcount]').val().trim();
		let phoneNumber = $('input[name=phoneNumber]').val().trim();
		
		// validation check
		if (name.length < 1) {
			alert("이름을 입력하세요");
			return;
		}
		
		if (date == "") {
			alert("날짜를 선택하세요");
			return;
		}
		
		if (day == "") {
			alert("숙박일을 입력하세요");
			return;
		}
		
		if (isNaN(day)) {
			alert("숙박일수는 숫자만 입력가능합니다.");
			return;
		}
		
		if (headcount == "") {
			alert("숙박인원을 입력하세요");
			return;
		}
		
		if (isNaN(headcount)) {
			alert("숙박인원은 숫자만 입력가능합니다.");
			return;
		}
		
		if (phoneNumber == "") {
			alert("전화번호를 입력하세요");
			return;
		}
		
		$.ajax({
			type:"POST"
			, url:"/lesson06/quiz03/add_booking"
			, data: {"name":name, "date":date, "day":day, 
				"headcount":headcount, "phoneNumber":phoneNumber}
			, success: function(data) {
				// {"result":"success"}
				if (data.result == "success") {
					alert("예약되었습니다.");
					location.href = "/lesson06/quiz03/booking_list_view";
				} else {
					alert("예약에 실패했습니다.");
				}
			}
			, error: function(e) {
				alert("통신에 실패했습니다.");
			}
		});
	});
	
	$("input[name=date]").datepicker({
		minDate:0    // 오늘부터 그 뒤 날짜 선택
		, dateFormat: "yy-mm-dd" 
	});
});
</script>
</body>
</html>



