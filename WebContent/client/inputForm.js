//회원정보 입력란 체크
function check() {
	if (! document.joinF.id.value) {
		alert("ID를 입력하세요");
		return false;
	} else if (document.joinF.confirm_ok.value == "no")
	{
		alert("ID중복체크를 해주세요.");
		return false;
	}

	if (!document.joinF.passwd1.value) {
		alert("비밀번호를 입력하세요");
		return false;
	} else if (!document.joinF.passwd2.value) {
		alert("비밀번호 확인란을 입력하세요.")
		return false;
	} else if (document.joinF.passwd1.value != document.joinF.passwd2.value) {
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	}

	if (!document.joinF.mid.value) {
		alert("전화번호 가운데 자리를 알맞게 입력해주세요.");
		return false;
	} else if (!document.joinF.last.value) {
		alert("전화번호 마지막 자리를 알맞게 입력해주세요.");
		return false;
	}
	if (document.joinF.mid.value.length != 4 || document.joinF.last.value.length != 4) {
		alert("전화번호를 알맞게 입력해주세요.");
		return false;
	}

	if (!document.joinF.name.value) {
		alert("사용자 이름을 입력하세요");
		return false;
	}

	if(!document.joinF.gender.value)
	{
		alert("성별을 선택해주세요.");
		return false;
	}

	if (!document.joinF.age.value) {
		alert("나이를 입력해주세요.");
		return false;
	}

	if(document.joinF.ask.value == "0")
	{
		alert("질문을 선택해주세요.");
		return false;
	}
	if(!document.joinF.answer.value)
	{
		alert("질문의 답변을 입력해주세요.");
		return false;
	}

	if (!document.joinF.zipcode.value && !document.joinF.address.value) {
		alert("주소를 전부 입력해주세요.");
		return false;
	}

	if (!document.joinF.able.value) {
		alert("공개 여부를 설정해주세요.");
		return false;
	}
	return true;
}

function id_nohan(v) {
	// var id = v.id.value;
	// alert(v.id.value);
	var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;

	if (hangle.test(v.id.value)) {
		alert("영문자와 숫자만 사용하세요.");
		v.id.value = "";
		v.id.focus();
		return false;
	}
}

function id_noNumber(v)
{
	var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
	
	if (!hangle.test(v.name.value)) {
		alert("한글만 사용하세요.");
		v.name.value = "";
		v.name.focus();
		return false;
	}
}

//아이디 중복 여부를 판단
function openConfirmid(ID) {
	// 아이디를 입력했는지 검사
	if (document.joinF.ID.value == "") {
		alert("아이디를 입력하세요");
		document.joinF.ID.focus();
		return false;
	} else {
		// url과 사용자 입력 id를 조합합니다.
		url = "confirmId.do?id=" + document.joinF.ID.value;

		// 새로운 윈도우를 엽니다.
		open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");

	}
}

function disable() {
	document.joinF.emailAddress.disabled = true;
	return;
}

//이메일 직접입력
function email_change(e) {
	/*
	 * select : email textBox: emailAddress
	 */
	var s = e.email;
	var tb = e.emailAddress;

	if (s.value == "0") {
		tb.disabled = true;
	}
	if (s.value == "1") {
		tb.disabled = false;
		tb.value = "";
		tb.focus();
	} else {
		tb.value = s.value;
	}
}

//숫자만 입력받는다. 특수문자('-','.',...)도 허용한다.
function onlyNumber() {
	if ((event.keyCode > 31) && (event.keyCode < 45) || (event.keyCode > 57)) {
		event.returnValue = false;
	}
}

//숫자만 입력받는다. "-"도 받지않는다.
function onlyNumber2(loc) {
	if (/[^0123456789]/g.test(loc.value)) {
		alert("숫자가 아닙니다.\n\n0-9의 정수만 허용합니다.");
		loc.value = "";
		loc.focus();
	}
}

function zipCheck() {

	url = "zipCheck.do?check=y";

	window
	.open(
			url,
			"post",
	"toolbar=no ,width=500 ,height=300,directories=no,status=yes,scrollbars=yes,menubar=no");
}