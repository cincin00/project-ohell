function checkIt(){
	if(!document.myform.id.value){
		alert("이름을 입력하지 않으셨습니다.");
		document.myform.id.focus();
		return false;
	}
	if(!document.myform.passwd.value){
		alert("비밀번호를 입력하지 않으셨습니다.");
		document.myform.passwd.focus();
		return false;
	}
}

function begin(){
	document.myform.id.focus();
}