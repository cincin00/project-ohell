<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
</head>
<body>
<c:if test="${check == 1 }">
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
    <td height="39"  align="center">
  <font size="+1" ><b>당신의 Id는 ${id }입니다.</b></font></td>
  </tr>
  <tr>
    <td align="center">
      <form>
    <input type="button" value="메인으로" onclick="window.location='../main/mainForm.do'">
      </form>
   	<meta http-equiv="Refresh" content="2;url=../main/mainForm.do" >
    </td>
  </tr>
</table>
</c:if>
<c:if test="${check == -1 }">
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
    <td height="39"  align="center">
  <font size="+1" ><b>입력하신 정보와 일치하는 ID가 없습니다.</b></font></td>
  </tr>
  <tr>
    <td align="center">
      <form>
    <input type="button" value="아이디/비밀번호 찾기 페이지로" onclick="window.location='findClient.do'">
      </form>
   	<meta http-equiv="Refresh" content="2;url=findClient.do" >
    </td>
  </tr>
</table>

</c:if>
</body>
</html>