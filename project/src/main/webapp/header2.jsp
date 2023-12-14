<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://kit.fontawesome.com/bf7b37fa88.js"
	crossorigin="anonymous"></script>
<script>var uid = '<%= session.getAttribute("sessionId") %>';</script>
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
			<a href="/main.do"><img class="logo-pic"
				src="resources/images/header/01_logo2.2.jpg" alt=""></a>
		</div>

		<div id="top-btm">
			<!-- 사이트 내 각종 메뉴 모음 -->
			<nav class="top-btm-menu"></nav>
		</div>
	</div>
</header>