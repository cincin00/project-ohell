<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head><title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="deletescript.js"></script>
</head>
<body onload="begin()">
<form name="myform" action="deletePro.do" method="post" onSubmit="return checkIt()">
<table cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
 
  <tr height="30">
    <td colspan="2" align="middle">
  <font size="+1" ><b>회원 탈퇴</b></font></td></tr>
 
  <tr height="30">
    <td width="110" align=center>비밀번호</td>
    <td width="150" align=center>
      <input type=password name="passwd"  size="15" maxlength="12"></td></tr>
  <tr height="30">
    <td colspan="2" align="middle" >
      <input type=submit value="회원탈퇴">
      <input type="button" value="취  소" onclick="javascript:window.location='../main/mainForm.do'"></td></tr>
</table>
</form>
</body>
</html>