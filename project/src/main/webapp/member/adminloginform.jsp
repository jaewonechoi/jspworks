<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/login.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<div id="mid">
			<h3>LOG IN</h3>
			<div id="login">
				<form action="/j_security_check" method="post" id="mid_form">
					<table class="login_tb">
						<tr class="login_tr">
							<td class="td_text">ID</td>
							<td class="td_input"><input type="text" class="login_input" id="id" name="j_username"></td>
						</tr>
						<tr class="login_tr">
							<td class="td_text">PW</td>
							<td class="td_input"><input type="password"
								class="login_input" id="passwd" name="j_password"></td>
								<td rowspan="2" class="td_btn"><button class="login_btn">LogIn</button></td>
						</tr>
					</table>
					<div class="error">${error}</div>
				</form>
				<div id="find_account">
					<p>
						<a href="#" class="find_id">Find ID</a> | <a href="#"
							class="find_pw">Find PW</a>
					</p>
				</div>
				<div class="join_account">
					<p>
						💌 Become a member <br> and Enjoy the benefits!
					</p>
					<a href="#"><button class="join_account_btn">JOIN!</button></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>