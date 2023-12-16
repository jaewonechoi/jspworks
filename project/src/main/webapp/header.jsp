<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://kit.fontawesome.com/a4ba1a7811.js" crossorigin="anonymous"></script>
<header>
	<div id=container>
		<div id="top">
			<div class="top-top">
				<div class="tt-box">
					<div class="mini-shortcut">
						<!-- 상단 좌측 링크 아이콘 -->
						<ul class="ms-list">
							<li><a href="https://www.youtube.com" target="_blank"><i class="fa-brands fa-youtube"></i> youtube</a></li>
							<li><a href="https://www.instagram.com/" targer="_blank"><i class="fa-brands fa-instagram"></i> instagram</a></li>
							<li><a href="https://www.twitter.com/" targer="_blank"><i class="fa-brands fa-twitter"></i> twitter</a></li>
						</ul>
					</div>

					<div class="top-top-menu">
						<!-- 상단 미니메뉴 -->
						<c:choose>
							<c:when test="${empty sessionId}">
								<ul class="ttm-list">
									<li><a href="/joinform.do">JOIN</a></li>
									<li><a href="/loginform.do">LOG-IN</a></li>
									<li><a href="/loginform.do">MY-PAGE</a></li>
									<li><a href="#">BASKET</a></li>
									<li><a href="#">ORDER-INQUIRY</a></li>
									<li><a href="/boardlist.do">BOARD</a></li>
									<li><input type="text" id="search"> 🔍</li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="ttm-list">
									<li><a href="#">(${sessionName})님 안녕하세요</a></li>
									<li><a href="/logout.do">LOG-OUT</a></li>
									<li><a href="/memberview.do?id=${sessionId}">MY-PAGE</a></li>
									<li><a href="#">BASKET</a></li>
									<li><a href="#">ORDER-INQUIRY</a></li>
									<li><a href="/boardlist.do">BOARD</a></li>
									<li><input type="text" id="search"> 🔍</li>
								</ul>
							</c:otherwise>

						</c:choose>
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
				<nav class="top-btm-menu">
					<ul class="tbm-list">
						<li class="tbm-list-li"><a href="#"><i
								class="fa-solid fa-bars"></i> 전체 메뉴</a>
							<ul class="sub_all_menu">
								<ul>
									<a href="">강아지 먹거리</a>
									<li><a href="">사료</li>
									</a>
									<li><a href="">간식</li>
									</a>
									<li><a href="">영양제</li>
									</a>
								</ul>
								<ul>
									<a href="">강아지 용품</a>
									<li><a href="">강아지 집</li>
									</a>
									<li><a href="">강아지 옷</li>
									</a>
									<li><a href="">강아지 장난감</li>
									</a>
									<li><a href="">강아지 밥그릇</li>
									</a>
									<li><a href="">강아지 산책용품</li>
									</a>
								</ul>
								<ul>
									<a href="">고양이 먹거리</a>
									<li><a href="">사료</li>
									</a>
									<li><a href="">간식</li>
									</a>
									<li><a href="">영양제</li>
									</a>
								</ul>
								<ul>
									<a href="">고양이 용품</a>
									<li><a href="">고양이 집</li>
									</a>
									<li><a href="">고양이 옷</li>
									</a>
									<li><a href="">고양이 장난감</li>
									</a>
									<li><a href="">고양이 밥그릇</li>
									</a>
									<li><a href="">고양이 방콕용품</li>
									</a>
								</ul>
								<ul>
									<a href="">햄스터 먹거리</a>
									<li><a href="">사료</li>
									</a>
									<li><a href="">간식</li>
									</a>
									<li><a href="">영양제</li>
									</a>
								</ul>
								<ul>
									<a href="">햄스터 용품</a>
									<li><a href="">햄스터 집</li>
									</a>
									<li><a href="">햄스터 장난감</li>
									</a>
									<li><a href="">햄스터 밥그릇</li>
									</a>
									<li><a href="">햄스터 챗바퀴</li>
									</a>
									<li><a href="">햄스터 이갈이</li>
									</a>
								</ul>
								<ul>
									<a href="">이벤트 상품</a>
									<li><a href="">기간 할인 상품</li>
									</a>
									<li><a href="">신상품 할인 이벤트</li>
									</a>
									<li><a href="">시즌 한정 상품</li>
									</a>
								</ul>
							</ul></li>
						<li class="tbm-list-li"><a href="#">강아지 먹거리</a>
							<ul class="sub_menu">
								<li><a href="">사료</li>
								</a>
								<li><a href="">간식</li>
								</a>
								<li><a href="">영양제</li>
								</a>
							</ul></li>
						<li class="tbm-list-li"><a href="#">강아지 용품</a>
							<ul class="sub_menu">
								<li><a href="">강아지 집</li>
								</a>
								<li><a href="">강아지 옷</li>
								</a>
								<li><a href="">강아지 장난감</li>
								</a>
								<li><a href="">강아지 밥그릇</li>
								</a>
								<li><a href="">강아지 산책용품</li>
								</a>
							</ul></li>
						<li class="tbm-list-li"><a href="#">고양이 먹거리</a>
							<ul class="sub_menu">
								<li><a href="">사료</li>
								</a>
								<li><a href="">간식</li>
								</a>
								<li><a href="">영양제</li>
								</a>
							</ul></li>
						<li class="tbm-list-li"><a href="#">고양이 용품</a>
							<ul class="sub_menu">
								<li><a href="">고양이 집</li>
								</a>
								<li><a href="">고양이 옷</li>
								</a>
								<li><a href="">고양이 장난감</li>
								</a>
								<li><a href="">고양이 밥그릇</li>
								</a>
								<li><a href="">고양이 방콕용품</li>
								</a>
							</ul></li>
						<li class="tbm-list-li"><a href="#">햄스터 먹거리</a>
							<ul class="sub_menu">
								<li><a href="">사료</li>
								</a>
								<li><a href="">간식</li>
								</a>
								<li><a href="">영양제</li>
								</a>
							</ul></li>
						<li class="tbm-list-li"><a href="#">햄스터 용품</a>
							<ul class="sub_menu">
								<li><a href="">햄스터 집</li>
								</a>
								<li><a href="">햄스터 장난감</li>
								</a>
								<li><a href="">햄스터 밥그릇</li>
								</a>
								<li><a href="">햄스터 챗바퀴</li>
								</a>
								<li><a href="">햄스터 이갈이</li>
								</a>
							</ul></li>
						<li class="tbm-list-li"><a href="#">이벤트 상품</a>
							<ul class="sub_menu">
								<li><a href="">기간 할인 상품</li>
								</a>
								<li><a href="">신상품 할인 이벤트</li>
								</a>
								<li><a href="">시즌 한정 상품</li>
								</a>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>