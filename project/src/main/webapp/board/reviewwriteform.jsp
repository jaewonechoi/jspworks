<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글쓰기</title>
<link rel="stylesheet" href="../resources/css/writeform.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="writeform">
			<h2>글쓰기</h2>
			<form action="/reviewwrite.do" method="post">
				<table>
					<tbody>
						<tr>
							<td><input type="text" name="rtitle" placeholder="글제목" required></td>
						</tr>
						<tr>
							<td><textarea rows="7" cols="100" name="rcontent" placeholder="글내용"></textarea></td>
						</tr>
						<tr>
							<td>
								<button type="submit">등록</button>
								<button type="reset">취소</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>