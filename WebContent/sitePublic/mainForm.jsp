<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Olle Plan 사이트에 오신걸 환영합니다.(자신만의 여행계획을 짜보세요.)</title>
	<script language="javascript" src="mainscript.js">
	</script>
<% request.setCharacterEncoding("utf-8");%>
</head>
<body>
<c:if test="${id==null}">
<table cellspacing="1" cellpadding="1" align="center">
<tr height="30">
	<td>
		<a href="/semi_prj/main/mainForm.do"><img src="/semi_prj/img/logo.jpg"/></a>로고
	</td>
	<td>
		<a href="/semi_prj/main/mainForm.do"><img src="/semi_prj/img/logo.jpg"/></a>일정
	</td>
	<td>
		<a href="/semi_prj/boardListForm.do"><img src="/semi_prj/img/logo.jpg"/></a>게시판
	</td>
	<td>
		<a href="/semi_prj/festivalListForm.do"><img src="/semi_prj/img/logo.jpg"/></a>축제
	</td>
	<td>
		<a href="/semi_prj/introduceForm.do"><img src="/semi_prj/img/logo.jpg"/></a>소개
	</td>
	<td>
<div onload="begin()">
<form name="myform" action="../client/loginPro.do" method="post" onSubmit="return checkIt()">
<table cellspacing="1" cellpadding="1" width="260" border="1" align="center">
<tr height="10">
	<td colspan="2" align="middle"><strong>회원로그인</strong></td>
</tr>
<tr height="10">
	<td width="110" align="center">아이디</td>
	<td width="150" align="center">
	<input type="text" name="id" size="15" maxlength="15"></td>
</tr>
<tr height="10">
	<td width="110" align="center">비밀번호</td>
	<td width="150" align="center">
	<input type="password" name="passwd" size="15" maxlength="15"></td>
</tr>
<tr height="10">
	<td colspan="2" align="center">
	<input type="submit" value="로그인">
    <input type="button" value="회원가입" onclick="javascript:window.location='../client/inputForm.do'">
    </td>
</tr>
</table>
</form>
</div>
</td>
<td>
<form method="post" action="">
	    <input type="button" value="아이디/비밀번호 찾기" onclick="javascript:window.location='../client/findClient.do'">
</form>
</td>
</tr>
</table>
</c:if>
<c:if test="${id != null }">
<table cellspacing="1" cellpadding="1" align="center">
<tr height="30">
	<td>
		<a href="/semi_prj/main/mainForm.do"><img src="/semi_prj/img/logo.jpg"/></a>로고
	</td>
	<td>
		<a href="/semi_prj/main/mainForm.do"><img src="/semi_prj/img/logo.jpg"/></a>일정
	</td>
	<td>
		<a href="/semi_prj/boardListForm.do"><img src="/semi_prj/img/logo.jpg"/></a>게시판
	</td>
	<td>
		<a href="/semi_prj/festivalListForm.do"><img src="/semi_prj/img/logo.jpg"/></a>축제
	</td>
	<td>
		<a href="/semi_prj/introduceForm.do"><img src="/semi_prj/img/logo.jpg"/></a>소개
	</td>
<td>
       <table width="260" cellpadding="0" cellspacing="0"  align="center" border="1" >
         <tr>
           <td rowspan="3" align="center">
             ${id}님이 <br>
             방문하셨습니다
             <form  method="post" action="../client/logoutPro.do"> 
             <input type="submit"  value="로그아웃">
             </form>
             <form method="post" action="../client/mypageForm.do">
             <input type="submit" value="mypage">
             </form>
         </td>	
        </tr>
     </table>
     </td>
     </tr>
     </table>
 </c:if>
</body>
</html>