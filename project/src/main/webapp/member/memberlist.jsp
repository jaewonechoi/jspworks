<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="../resources/css/memberview.css">
</head>
<body>
	<jsp:include page="../header2.jsp" />
	<div id="container">
		<section id="memberlist">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>주소</th>
						<th>상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="m">
					<tr>
						<td><a href="/memberview.do?id=${m.id}">${m.id}</a></td>
						<td>${m.passwd}</td>
						<td>${m.name}</td>
						<td>${m.email}</td>
						<td>${m.phone}</td>
						<td>${m.address}</td>
						<td>${m.detailaddress}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>	
		</section>
	</div>	
	<jsp:include page="../footer.jsp" />
</body>
</html>