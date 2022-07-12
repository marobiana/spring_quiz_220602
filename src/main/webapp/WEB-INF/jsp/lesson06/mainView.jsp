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
<link rel="stylesheet" type="text/css"
	href="/css/lesson06_quiz03.css">
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
		<section class="banner bg-info">
			<img id="bannerImage"
				src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg"
				alt="banner" width="1110px" height="500px">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="m-3">
					<span class="reserve-confirm mr-3">예약 확인</span>
				</div>

				<!-- 예약 확인 -->
				<div id="memberInputBox" class="m-2">
					<div class="d-flex justify-content-end mr-3">
						<span class="text-white">이름:</span> <input type="text" id="name"
							class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">전화번호:</span> <input type="text"
							id="phoneNumber" class="form-control input-form">
					</div>

					<!-- 버튼 -->
					<div class="text-right mt-3 mr-3">
						<button type="button" class="btn btn-success submit-btn">조회 하기</button>
					</div>
				</div>

			</section>
			<section
				class="inquiry col-4 d-flex justify-content-center align-items-center">
				<div class="text-white">
					<h4 class="font-weight-bold">예약문의:</h4>
					<h1>
						010-<br>0000-1111
					</h1>
				</div>
			</section>
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
	// banner
	let bannerList = ["/img/test06_banner1.jpg", "/img/test06_banner2.jpg", "/img/test06_banner3.jpg", "/img/test06_banner4.jpg"];
    let currentImageIndex = 0;
    setInterval(function() {
        $("#bannerImage").attr("src", bannerList[currentImageIndex]);
        currentImageIndex++;

        if(currentImageIndex == bannerList.length) {
            currentImageIndex = 0;
        }
    }, 3000);  
    
    
    // 조회하기 버튼 클릭
    $('.submit-btn').on('click', function() {
    	let name = $('#name').val().trim();
    	let phoneNumber = $('#phoneNumber').val().trim();
    	
    	if (name == "") {
    		alert("이름 입력하세요");
    		return;
    	}
    	
    	if (phoneNumber == "") {
    		alert("전화번호 입력하세요");
    		return;
    	}
    	
    	if (phoneNumber.startsWith("010") == false) {
    		alert("010으로 시작하는 번호만 입력 가능합니다.");
    		return;
    	}
    	
    	$.ajax({
    		type:"POST"
    		, url: "/lesson06/quiz03/get_booking"
    		, data: {"name":name, "phoneNumber":phoneNumber}
    		, success: function(data) {
    			//alert(data.result);
    			alert("이름:" + data.booking.name 
    					+ "\n날짜:" + data.booking.date.substring(0, 10)
    					+ "\n일수:" + data.booking.day
    					+ "\n인원:" + data.booking.headcount
    					+ "\n상태:" + data.booking.state);
    		}
    		, error:function(e) {
    			alert("통신이 실패했습니다.");
    		}
    	});
    });
});
</script>

</body>
</html>