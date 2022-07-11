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
<link rel="stylesheet" type="text/css" href="/css/lesson06/quiz03_style.css">
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
</body>
</html>