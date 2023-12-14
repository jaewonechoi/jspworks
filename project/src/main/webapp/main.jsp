<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉꼬냥</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id=container>
		<div id="mid">
			<div class="mid-top">
				<div class="main-prod-show">
					<div>
						<a href=""><img id="main-prod-pic1" class="main-prod-pic"
							src="resources/images/main/main-pic1.jpg" alt=""></a>
					</div>
				</div>
				<div class="main-pic-button">
					<button class="pic1"></button>
					<button class="pic1"></button>
					<button class="pic1"></button>
					<button class="pic1"></button>
					<button class="pic1"></button>
				</div>
				<div class="main-pic-arrowBtn">
					<button class="left" onclick="beforeSlide()" value="<"></button>
					<button class="right" onclick="nextSlide()" value=">"></button>
				</div>

				<div class="board">
					<div class="notice-board">
						<h3 class="title-notice">
							<a href="/boardlist.do">Notice / Event</a>
						</h3>
						<ul class="notice-list">
							<li><a href="#">Notice 1</a></li>
							<li><a href="#">Notice 2</a></li>
							<li><a href="#">Event 2</a></li>
							<li><a href="#">Event 1</a></li>
						</ul>
					</div>

					<div class="review-board">
						<h3 class="title-review">
							<a href="#">Review Board</a>
						</h3>
						<ul class="review-list">
							<li><a href="#">Review 4</a></li>
							<li><a href="#">Review 3</a></li>
							<li><a href="#">Review 2</a></li>
							<li><a href="#">Review 1</a></li>
						</ul>
					</div>

					<div class="QnA-board">
						<h3 class="title-QnA">
							<a href="#">Q/A Board</a>
						</h3>
						<ul class="QnA-list">
							<li><a href="#">Q/A 4</a></li>
							<li><a href="#">Q/A 3</a></li>
							<li><a href="#">Q/A 2</a></li>
							<li><a href="#">Q/A 1</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="mid-mid">
				<div class="prod-board">
					<h2>Home Sweet Home</h2>
					<div class="sub-prod-show">
						<!-- 메인 제품 외의 주요 제품 목록 -->
						<a href="#"><img class="sub-prod-pic" src="resources/images/main/house1.jpg" alt=""></a> <a
							href="#"><img class="sub-prod-pic" src="resources/images/main/house2.jpg" alt=""></a> <a
							href="#"><img class="sub-prod-pic" src="resources/images/main/house3.jpg" alt=""></a> <a
							href="#"><img class="sub-prod-pic" src="resources/images/main/house4.jpg" alt=""></a>
					</div>

					<h2>WaGoo WaGoo</h2>
					<div class="sub-prod-show">
						<!-- 메인 제품 외의 주요 제품 목록 -->
						<a href="#"><img class="sub-prod-pic" src="resources/images/main/food1.jpg" alt=""></a> <a
							href="#"><img class="sub-prod-pic" src="resources/images/main/food2.jpg" alt=""></a> <a
							href="#"><img class="sub-prod-pic" src="resources/images/main/food3.jpg" alt=""></a> <a
							href="#"><img class="sub-prod-pic" src="resources/images/main/food4.jpg" alt=""></a>
					</div>

					<h2>Let's Play</h2>
					<div class="sub-prod-show">
						<!-- 메인 제품 외의 주요 제품 목록 -->
						<a href=""><img class="sub-prod-pic"
							src="resources/images/main/toy1.jpg" alt=""></a> <a href=""><img
							class="sub-prod-pic" src="resources/images/main/toy2.jpg" alt=""></a> <a
							href=""><img class="sub-prod-pic" src="resources/images/main/toy3.jpg"
							alt=""></a> <a href=""><img class="sub-prod-pic"
							src="resources/images/main/toy4.jpg" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>