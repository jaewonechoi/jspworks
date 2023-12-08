<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/join_style.css">
    <title>Join</title>
</head>
<body>
    <div id="container">
        <div id="top">
            <div class="top-top">

                <div class="mini-shortcut"> <!-- 상단 좌측 링크 아이콘 -->
                    <ul class="ms-list">
                        <li><a href="">youtube</a></li>
                        <li><a href="">instagram</a></li>
                        <li><a href="">twitter</a></li>
                    </ul>
                </div>

                <div class="top-top-menu"> <!-- 상단 미니메뉴 -->
                    <ul class="ttm-list">
                        <li><a href="">JOIN</a></li>
                        <li><a href="">LOG IN</a></li>
                        <li><a href="">MY PAGE</a></li>
                        <li><a href="">BASKET</a></li>
                        <li><a href="">ORDER INQUIRY</a></li>
                        <li><a href="">BOARD</a></li>
                        <li><input type="text" id="search"> 🔍</li> <!-- 상단 검색창 -->
                    </ul>
                </div>
            </div>  

            <div class="top-mid">   <!-- 메인 로고, 사진 -->
                <a href=""><img class="logo-pic" src="img/logoimg.jpg" alt=""></a>
            </div>

            <div class="top-btm">   <!-- 사이트 내 각종 메뉴 모음 -->
                <div class="top-btm-menu">
                    <ul class="tbm-list">
                        <li><a href="">MENU1</a></li>
                        <li><a href="">MENU2</a></li>
                        <li><a href="">MENU3</a></li>
                        <li><a href="">MENU4</a></li>
                        <li><a href="">MENU5</a></li>
                        <li><a href="">MENU6</a></li>
                        <li><a href="">MENU7</a></li>
                        <li><a href="">MENU8</a></li>
                        <li><a href="">MENU9</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="mid">
            <h3>JOIN</h3>
            <form action="#" id="mid_form">
                <fieldset id="join_info">
                    <legend>Information</legend>
                    <div>
                        <table>
                            <tbody>
                                <tr>
                                    <th>ID</th>
                                    <td><input type="text"><span>(영문 소문자/숫자, 4~20자)</span></td>
                                </tr>
                                <tr>
                                    <th>PassWord</th>
                                    <td><input type="password"><span>(영문 대소문자/숫자/특수문자, 10~20자)</span></td>
                                </tr>
                                <tr>
                                    <th>Confirm PW</th>
                                    <td><input type="password"></td>
                                </tr>
                                <tr>
                                    <th>Name</th>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <th>Phone</th>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <th>E-mail</th>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <th>Address</th>
                                    <td><input type="text" size="6"> - <input type="text" size="6"><span>Zip Code</span></td>
                                    <td><input type="text" size="50"><span>Address</span></td>
                                    <td><input type="text" size="50"><span>Detailed Address</span></td>
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
                                    1. 개인정보 수집목적 및 이용목적
                                    <br>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
                                    <br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
                                    <br>나. 회원 관리
                                    <br>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
                                </p>
                                <br>
                                <p>
                                    2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보
                                </p>
                                <br>
                                <p>
                                    3. 개인정보의 보유기간 및 이용기간
                                    <br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
                                    <br>가. 회사 내부 방침에 의한 정보 보유 사유
                                    <br>o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 1년
                                    <br>나. 관련 법령에 의한 정보보유 사유
                                    <br>o 계약 또는 청약철회 등에 관한 기록
                                    <br>-보존이유 : 전자상거래등에서의소비자보호에관한법률
                                    <br>-보존기간 : 5년
                                    <br>o 대금 결제 및 재화 등의 공급에 관한 기록
                                    <br>-보존이유: 전자상거래등에서의소비자보호에관한법률
                                    <br>-보존기간 : 5년 
                                    <br>o 소비자 불만 또는 분쟁처리에 관한 기록
                                    <br>-보존이유 : 전자상거래등에서의소비자보호에관한법률
                                    <br>-보존기간 : 3년 
                                    <br>o 로그 기록 
                                    <br>-보존이유: 통신비밀보호법
                                    <br>-보존기간 : 3개월
                                    <br>※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
                                </p>
                            </div>
                        </div>
                        <p class="agree_box">
                            <span class="Qagree">이용약관에 동의하십니까?</span>
                            <input type="checkbox" name="use_agree" id="use_agree">
                            <label for="use_agree"> Agree</label>
                        </p>
                    </div>
                </fieldset>
                <fieldset id="personal_agree">
                    <legend>개인정보 수집 및 이용 동의</legend>
                    <div>
                        <div class="law_list">
                            <div class="textbox">
                                <p> 
                                    1. 개인정보 수집목적 및 이용목적
                                    <br>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
                                    <br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
                                    <br>나. 회원 관리
                                    <br>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
                                </p>
                                <br>
                                <p>
                                    2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보
                                </p>
                                <br>
                                <p>
                                    3. 개인정보의 보유기간 및 이용기간
                                    <br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
                                    <br>가. 회사 내부 방침에 의한 정보 보유 사유
                                    <br>o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 1년
                                    <br>나. 관련 법령에 의한 정보보유 사유
                                    <br>o 계약 또는 청약철회 등에 관한 기록
                                    <br>-보존이유 : 전자상거래등에서의소비자보호에관한법률
                                    <br>-보존기간 : 5년
                                    <br>o 대금 결제 및 재화 등의 공급에 관한 기록
                                    <br>-보존이유: 전자상거래등에서의소비자보호에관한법률
                                    <br>-보존기간 : 5년 
                                    <br>o 소비자 불만 또는 분쟁처리에 관한 기록
                                    <br>-보존이유 : 전자상거래등에서의소비자보호에관한법률
                                    <br>-보존기간 : 3년 
                                    <br>o 로그 기록 
                                    <br>-보존이유: 통신비밀보호법
                                    <br>-보존기간 : 3개월
                                    <br>※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
                                </p>
                            </div>
                        </div>
                        <p class="agree_box">
                            <span class="Qagree">개인정보 수집 및 이용 동의하십니까?</span> 
                            <input type="checkbox" name="person_agree" id="person_agree">
                            <label for="person_agree"> Agree</label>
                        </p>
                    </div>
                </fieldset>
                <div class="btnbox">
                    <button type="submit" class="join_btn">JOIN!</button>
                    <button type="reset" class="reset_btn">Cancel</button>
                </div>
            </form>
        </div>

        <div id="bottom">
            <div class="cst-center">
                <h3>CUSTOMER CENTER</h3>
                <p>
                    TEL 010-0000-0000 <br>
                    Kakao team_2 <br>
                    AM 10 ~ PM 6 <br>
                    Closed ~ Weekend, Holiday
                </p>
            </div>
            <div class="bank-info">
                <h3>BANK INFO</h3>
                <p>
                    농협 123-1234-1234-12 <br>
                    국민 123456-12-123456 <br>
                    예금주 : (주)team_2
                </p>
            </div>
            <div class="btm-icon">
                <ul class="btm-icon-list">
                    <li><a href=""><img class="icon" src="" alt="">o</a></li>
                    <li><a href=""><img class="icon" src="" alt="">o</a></li>
                    <li><a href=""><img class="icon" src="" alt="">o</a></li>
                    <li><a href=""><img class="icon" src="" alt="">o</a></li>
                    <li><a href=""><img class="icon" src="" alt="">o</a></li>
                </ul>
            </div>
        </div>
        
        <footer id="footer">
            <div class="footer-info">
                <p class="span-list">
                    <span>team_2 : KHacademy</span>
                    <span>address : korea seoul</span>
                    <span>tel : 1234-1234</span>
                    <span>e-mail : team_2@naver.com</span> <br>
                    <span>leader : choi jae won</span>
                    <span>member : seok min / dong hyeon / ji seong / je heon / seung beom </span> <br>
                    <span>copyright ⓒ team_2. All rights reserved. Design by team_2.</span>
                </p>
            </div>
        </footer>

    </div>
</body>
</html>