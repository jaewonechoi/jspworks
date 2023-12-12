<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://kit.fontawesome.com/bf7b37fa88.js"
	crossorigin="anonymous"></script>
<header>
	<div id="top">
		<div class="top-top">
			<div class="tt-box">
				<div class="mini-shortcut">
					<!-- 상단 좌측 링크 아이콘 -->
				</div>

				<div class="top-top-menu">
					<!-- 상단 미니메뉴 -->
				</div>
			</div>
		</div>

		<div class="top-mid">
			<!-- 메인 로고, 사진 -->
			<a href=""><img class="logo-pic" src="resources/images/header/01_logo2.2.jpg"
				alt=""></a>
		</div>

		<div id="top-btm">
			<!-- 사이트 내 각종 메뉴 모음 -->
			<nav class="top-btm-menu"></nav>
		</div>
	</div>
	<div id="sideNav">
		<div class="lr_nav">
			<nav id="scroll_left">
				<div id="ad1">
					<a href=""><img class="advertisement"
						src="resources/images/header/광고_02_advertisement1.jpg" alt="광고1"></a>
				</div>
				<div id="ad2">
					<a href=""><img class="advertisement"
						src="resources/images/header/광고_02_advertisement2.jpg" alt="광고2"></a>
				</div>
				<button id="left_scroll_btn"><</button>
			</nav>

			<nav id="scroll_right">
				<div class="right_banner">
					<a class="btn_brandview" href="">브랜드</a>
				</div>
				<div class="quick_btn_cart">
					<div class="basket_title">장바구니</div>
				</div>
				<div class="scroll_right_cont">
					<!-- <li class="view_empty">
                        최근 본<br>
                        상품이<br>
                        없습니다.
                        </li> -->
					<div class="justview">
						<img class="justview_pic" src="img/products/food1.jpg" alt="">
					</div>
					<div class="justview">
						<img class="justview_pic" src="img/products/house1.jpg" alt="">
					</div>
					<div class="justview">
						<img class="justview_pic" src="img/products/toy1.jpg" alt="">
					</div>
				</div>

				<div class="go_QnA">
					<a>문의 게시판</a>
				</div>
				<div class="go_review">
					<a>리뷰 게시판</a>
				</div>
				<div class="go_top_bottom">
					<button id="go_top">
						<i class="fa-solid fa-arrow-up"></i>
					</button>
					<button id="go_bottom">
						<i class="fa-solid fa-arrow-down"></i>
					</button>
				</div>
			</nav>
		</div>
	</div>
	<script src="resources/js/header.js"></script>
</header>