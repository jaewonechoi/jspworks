<%@page import="el.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택</title>
<style type="text/css">
	#container{
		width: 80%;
		margin: 30px auto;
		text-align: center;
	}
</style>
</head>
<jsp:useBean id="product" class="el.Product"/>
<%-- <%
	Product product = new Product();
%> --%>
<body>
	<div id="container">
		<h2>상품 선택</h2>
		<hr>
		<p>선택한 상품은 ${param.select}</p>
		<p>num1 + num2 = ${product.num1 + product.num2}</p>
		<%-- <p>num1 + num2 = <%=product.getNum1() + product.getNum2() %></p> --%>
	</div>
</body>
</html>