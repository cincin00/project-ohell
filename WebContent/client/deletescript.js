 function checkIt(){
 if(!document.myform.passwd.value){
          alert("비밀번호를 입력하지 않으셨습니다.");
          document.myform.passwd.focus();
          return false;
        }
  }
 
 function begin(){
     document.myform.passwd.focus();
   }