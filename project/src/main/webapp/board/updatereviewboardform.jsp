<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<h2>게시글 수정</h2>
		<form action="/updatereviewboard.do" method="post">
			<table>
				<tbody>
					<tr>
						<td><input type="text" name="rtitle"
							value="${rboardList.rtitle}" readonly></td>
					</tr>
					<tr>
						<td><textarea rows="7" cols="100" name="rcontent"
								placeholder="글내용" readonly>${rboardList.rcontent}</textarea></td>
					</tr>
					<tr>
						<td><c:if test="${sessionId eq rboardList.id}">
								<a href="/updatereviewboardform.do?rno=${rboardList.rno}">
									<button type="button">수정</button>
								</a>
								<a href="/deletereviewboard.do?rno=${rboardList.rno}"
									onclick="return confirm('정말로 삭제하시겠습니까?')">
									<button type="button">삭제</button>
								</a>
							</c:if> <a href="/reviewboardlist.do">
								<button type="button">목록</button>
						</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>