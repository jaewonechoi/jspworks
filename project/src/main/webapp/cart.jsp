<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link rel="stylesheet" href="resources/css/cart.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="container">
		<div id="mid">
			<div class="title">
				<h2>Shopping Cart</h2>
			</div>
			<div class="mid-top">
				<div class="cartinfo">
					<ul class="tabmenu">
						<li><input type="radio" id="tab1" name="tab1"> <label
							class="btn1"><a href="#"><button>국내배송 상품</button></a></label></li>
						<li><input type="radio" id="tab2" name="tab2"> <label><a
								href="#"><button>해외배송 상품</button></a></label></li>
						<div class="p">
							<p>장바구니에 담긴 상품은 30일동안 보관됩니다.</p>
						</div>
					</ul>
				</div>
			</div>
			<div class="mid-mid">
				<div class="cartlist-empty">
					<p>
						<img src="img/cart_img.gif" alt="장바구니가 비어있습니다">
					</p>
				</div>
				<div class="orderList"></div>
				<div class="orderbtn">
					<a> <img src="img/btn_order_all.gif" alt="전체상품주문">
					</a> <a> <img src="img/btn_order_select.gif" alt="선택상품주문">
					</a>
				</div>
			</div>
			<div class="mid-btm">
				<h3>이용안내</h3>
				<div class="content">
					<h4>장바구니 이용안내</h4>
					<ul>
						<li><span>&nbsp;1 </span>&nbsp;해외배송 상품과 국내 배송상품은 함께 결제하실 수
							없으니 장바구니 별로 따로 결제 해 주시기 바랍니다.</li>
						<li><span>&nbsp;2 </span>&nbsp;해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가
							해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
						<li><span>&nbsp;3 </span>&nbsp;선택하신 상품의 수량을 변경하시려면 수량변경 후
							[변경] 버튼을 누르시면 됩니다.</li>
						<li><span>&nbsp;4 </span>&nbsp;[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수
							있습니다</li>
						<li><span>&nbsp;5 </span>&nbsp;장바구니와 관심상품을 이용하여 원하시는 상품만
							주문하거나 관심상품으로 등록하실 수 있습니다.</li>
						<li><span>&nbsp;6 </span>&nbsp;파일첨부 옵션은 동일상품을 장바구니에 추가할 경우
							마지막에 업로드 한 파일로 교체됩니다.</li>
					</ul>
					<h4>무이자할부 이용안내</h4>
					<ul>
						<li><span>&nbsp;1 </span>&nbsp;상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만
							선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
						<li><span>&nbsp;2 </span>&nbsp;[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이
							선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
						<li><span>&nbsp;3 </span>&nbsp;단, 전체 상품을 주문/결제하실 경우, 상품별
							무이자할부 혜택을 받으실 수 없습니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>