function checkForm(){
	let form = document.member;
	let uid = form.uid.value;
	let pw1 = form.passwd.value;
	let pw2 = form.passwd2.value;
	let name = form.name.value;
	
	//정규 표현식
	regexpw1 = /[0-9]+/;
	regexpw2 = /[a-zA-Z]+/;
	regexpw3 = /[~!@#$%^&*()_+|]+/;
	
	regname = /^[가-힣]+$/;
	
	if(uid.length < 5 || uid.length > 12){
		alert("아이디는 5~12자까지 입력해주세요");
		uid.select();
		return false;
	}else if(pw1.length < 7 || !regexpw1.test(pw1) || 
		!regexpw2.test(pw1) || !regexpw3.test(pw1)){
			alert("비밀번호는 영문자, 숫자, 특수문자 포함 7자이상 입력해주세요.");
			pw1.select();
			return false;
	}else if(pw1 != pw2){
		alert("비밀번호를 동일하게 입력해주세요.");
		pw2.select();
		return false;
	}else if(!regname.test(name)){
		alert("이름은 숫자로 시작할수 없습니다.");
		name.select();
	}else{
		form.submit();
	}
	
}