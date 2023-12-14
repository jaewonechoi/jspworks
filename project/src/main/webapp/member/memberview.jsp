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
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="memberview">
			<table>
				<tbody>
					<tr>
						<td><label for="id">아이디</label></td>
						<td>${member.id}</td>
					</tr>
					<tr>
						<td><label for="passwd">비밀번호</label></td>
						<td>${member.passwd}</td>
					</tr>
					<tr>
						<td><label for="name">이름</label></td>
						<td>${member.name}</td>
					</tr>
					<tr>
						<td><label for="email">이메일</label></td>
						<td>${member.email}</td>
					</tr>
					<tr>
						<td><label for="phone">연락처</label></td>
						<td>${member.phone}</td>
					</tr>
					<tr>
						<td><label for="address">주소</label></td>
						<td>${member.address}</td>
					</tr>
					<tr>
						<td><label for="detailaddress">상세주소</label></td>
						<td>${member.detailaddress}</td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="main.do">
								<button>목록</button>
							</a>
							<a href="main.do">
								<button>수정</button>
							</a>
							<a href="main.do">
								<button>탈퇴</button>
							</a>
						</td>
					</tr>
				</tbody>
			</table>	
		</section>
	</div>	
	<jsp:include page="../footer.jsp" />
</body>
</html>