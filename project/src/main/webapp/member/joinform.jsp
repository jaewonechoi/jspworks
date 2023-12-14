<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/css/join_style.css">
<script src="../resources/js/validation.js"></script>
<title>Join</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="mid">
		<h3>JOIN</h3>
		<form action="/insertmember.do" id="mid_form" method="post"
			name="member">
			<fieldset id="join_info">
				<legend>Information</legend>
				<div>
					<table>
						<tbody>
							<tr>
								<th for="id">ID<!-- th안에 버튼을 같이 넣거나, --></th>
								<td><input type="text" id="id" name="id">
									<button type="button" id="btnChk" value="N" class="btn_check"
										onclick="checkId()" autofocus>ID 중복확인</button> <!-- td 안에 같이 넣으시면 됩니당!! -->
										<div id="message"></div>
									<span>(영문 소문자/숫자, 8~14자)</span></td>
							</tr>
							<tr>
								<th for="passwd">PassWord</th>
								<td><input type="password" id="passwd" name="passwd"
									required> <span>(영문 대소문자/숫자/특수문자 포함, 10~20자)</span></td>
							</tr>
							<tr>
								<th for="passwd2">Confirm PW</th>
								<td><input type="password" id="passwd2" name="passwd2"
									placeholder="비밀번호를 동일하게 입력해 주세요."></td>
							</tr>
							<tr>
								<th for="name">Name</th>
								<td><input type="text" id="name" name="name"
									placeholder="이름은 한글로 입력해주세요."></td>
							</tr>
							<tr>
								<th for="phone">Phone</th>
								<td><input type="text" id="phone" name="phone"
									placeholder="' - ' 빼고 입력해주세요."></td>
							</tr>
							<tr>
								<th for="email">E-mail</th>
								<td><input type="text" id="email" name="email"></td>
							</tr>
							<tr>
								<th for="zip_code">Address</th>
								<td><input type="text" size="5" id="zip_code"
									name="zip_code">
									<button type="button">우편번호</button> <span>Zip Code</span></td>
								<td for="address"><input type="text" size="50" id="address"
									name="address"> <span>Address</span></td>
								<td for="detailaddress"><input type="text" size="50"
									id="detailaddress" name="detailaddress"> <span>Detail
										Address</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</fieldset>
			<fieldset id="using_agree">
				<legend>이용약관 동의</legend>
				<div>
					<div class="law_list">
						<div class="textbox">
							<p>
								1. 개인정보 수집목적 및 이용목적 <br>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른
								요금정산 <br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인
								인증 및 금융 서비스 <br>나. 회원 관리 <br>회원제 서비스 이용에 따른 본인확인 , 개인
								식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동
								개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
							</p>
							<br>
							<p>2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호
								, 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보</p>
							<br>
							<p>
								3. 개인정보의 보유기간 및 이용기간 <br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당
								정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br>가.
								회사 내부 방침에 의한 정보 보유 사유 <br>o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 1년
								<br>나. 관련 법령에 의한 정보보유 사유 <br>o 계약 또는 청약철회 등에 관한 기록 <br>-보존이유
								: 전자상거래등에서의소비자보호에관한법률 <br>-보존기간 : 5년 <br>o 대금 결제 및 재화
								등의 공급에 관한 기록 <br>-보존이유: 전자상거래등에서의소비자보호에관한법률 <br>-보존기간
								: 5년 <br>o 소비자 불만 또는 분쟁처리에 관한 기록 <br>-보존이유 :
								전자상거래등에서의소비자보호에관한법률 <br>-보존기간 : 3년 <br>o 로그 기록 <br>-보존이유:
								통신비밀보호법 <br>-보존기간 : 3개월 <br>※ 동의를 거부할 수 있으나 거부시 회원 가입이
								불가능합니다.
							</p>
						</div>
					</div>
					<p class="agree_box">
						<span class="Qagree">이용약관에 동의하십니까?</span> <input type="checkbox"
							name="use_agree" id="use_agree"> <label for="use_agree">
							Agree</label>
					</p>
				</div>
			</fieldset>
			<fieldset id="personal_agree">
				<legend>개인정보 수집 및 이용 동의</legend>
				<div>
					<div class="law_list">
						<div class="textbox">
							<p>
								1. 개인정보 수집목적 및 이용목적 <br>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른
								요금정산 <br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인
								인증 및 금융 서비스 <br>나. 회원 관리 <br>회원제 서비스 이용에 따른 본인확인 , 개인
								식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동
								개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
							</p>
							<br>
							<p>2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호
								, 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보</p>
							<br>
							<p>
								3. 개인정보의 보유기간 및 이용기간 <br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당
								정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br>가.
								회사 내부 방침에 의한 정보 보유 사유 <br>o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 1년
								<br>나. 관련 법령에 의한 정보보유 사유 <br>o 계약 또는 청약철회 등에 관한 기록 <br>-보존이유
								: 전자상거래등에서의소비자보호에관한법률 <br>-보존기간 : 5년 <br>o 대금 결제 및 재화
								등의 공급에 관한 기록 <br>-보존이유: 전자상거래등에서의소비자보호에관한법률 <br>-보존기간
								: 5년 <br>o 소비자 불만 또는 분쟁처리에 관한 기록 <br>-보존이유 :
								전자상거래등에서의소비자보호에관한법률 <br>-보존기간 : 3년 <br>o 로그 기록 <br>-보존이유:
								통신비밀보호법 <br>-보존기간 : 3개월 <br>※ 동의를 거부할 수 있으나 거부시 회원 가입이
								불가능합니다.
							</p>
						</div>
					</div>
					<p class="agree_box">
						<span class="Qagree">개인정보 수집 및 이용 동의하십니까?</span> <input
							type="checkbox" name="person_agree" id="person_agree"> <label
							for="person_agree"> Agree</label>
					</p>
				</div>
			</fieldset>
			<div class="btnbox">
				<button type="button" class="join_btn" onclick="checkMember()">JOIN!</button>
				<button type="reset" class="reset_btn">Cancel</button>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>