<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://kit.fontawesome.com/a4ba1a7811.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp" />
	<script>
		location.href = "main.do"
	</script>
<jsp:include page="footer.jsp" />
</body>
</html>