function checkMember(){
	let form = document.member;
	let id = form.id.value;
	let pw = form.passwd.value;
	let pw2 = form.passwd2.value;
	let phone = form.phone.value;
	let name = form.name.value;
	
	//정규표현식
	let regexid = /^[a-zA-z0-9]+$/;
	let regexpw = /[0-9]+/;
	let regexpw2 = /[a-zA-Z]+/
	let regexpw3 = /[~!@#$%^&*()_+|]+/
	let regphone = /^\d{3}-?\d{3,4}-?\d{4}$/
	let regexname = /^[가-힣]+$/
	
	if(id.length < 8 || id.length > 14 || !regexid.test(id)){
		alert("아이디는 영문,숫자 포함 8~ 14자까지만 입력가능합니다.")
		id.select();
		return false;
	}else if(pw.length < 10 || !regexpw.test(pw) ||
		!regexpw2.test(pw) || !regexpw3.test(pw)){
		alert("비밀번호는 영문자 , 숫자, 특수문자 포함해서 10자 이상 입력해주세요.");
		pw.select();
		return false;
	}else if(pw != pw2){
		alert("비밀번호와 일치하지 않습니다 다시 입력해주세요.")
		pw2.select();
		return false;
	}else if(!regphone.test(phone)){
		alert("연락처는 숫자만 입력할수 있습니다.")
		phone.select();
		return false;
	}else if(!regexname.test(name)){
		alert("이름은 한글로만 입력해주세요.");
		return false;
	}else{
		form.submit();
	}
}