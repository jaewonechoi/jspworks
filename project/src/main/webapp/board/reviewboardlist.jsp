<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<div id="mid">
			<h3>Review</h3>
			<div class="Board">
				<table id="board_tb">
					<thead>
						<tr>
							<th class="board_no">no</th>
							<th class="board_title">title</th>
							<th class="board_writer">writer</th>
							<th class="board_date">date</th>
							<th class="board_hit">hit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rboardList}" var="rb">
							<tr>
								<td class="board_no">${rb.rno}</td>
								<td class="board_title"><a href="/reviewboardview.do?rno=${rb.rno}">${rb.rtitle}</a></td>
								<td class="board_writer">${rb.id}</td>
								<td class="board_date"><fmt:formatDate value="${rb.rdate}"
									 pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<%-- <td class="board_hit">${nb.hit}</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="write">
				<a href="/reviewwriteform.do">
					<button type="button">글쓰기</button>
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>