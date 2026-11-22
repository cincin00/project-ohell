<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="mypagescript.js"></script>
</head>
<%request.setCharacterEncoding("utf-8");%>
<body onload="siteselected('${emailsite}')">
  <br><br><br><br><br><br><br>
  <form name="is" method="post" action="modifyPro.do">
<center>
  <table>
  <tr colspan="2">
  	<td> 아이디 </td>
  	<td>${id }</td>
  </tr>
  <tr colspan="2">
  	<td>비밀번호</td>
  	<td><input type="password" name="passwd"/></td>
  </tr>
  <tr colspan="2">
  	<td>비밀번호 확인</td>
  	<td><input type="password" name="passwd1"/></td>
  </tr>
  <tr colspan="2">
  	<td>이름</td>
  	<td><input type="text" name="name" value="${c.name }"/></td>
  </tr>
  <tr colspan="2">
  	<td>전화번호</td>
  	<td>
	<input tyep="text" class="phone" name="phone_first" value="${phone_first }"/>
	- <input type="text" class="phone" name="phone_middle" value="${phone_middle }"/>
	- <input type="text" class="phone" name="phone_last" value="${phone_last }"/>
	</td>
  </tr><tr colspan="2">
  	<td>나이</td>
  	<td><input type="text" name="age" value="${c.age }"/></td>
  </tr>
  <tr colspan="2">
  	<td>성별</td>
  	<td><input type="radio" name="sex" value="1"/> 남자  <input type="radio" name="sex" value="2"/> 여자</td>
  </tr>
  <tr colspan="2">
  <td>이메일</td>
  <td><input type="text" name="email" value="${email }"/>
  <select name="email_site">
	<option value="@naver.com">@naver.com</option>
	<option value="@hanmail.net">@hanmail.net</option>
	<option value="@google.com">@google.com</option>
	<option value="직접입력">직접입력</option>
	</select>
  </td>
  </tr>
  <tr colspan="2">
  	<td>우편번호</td>
  	<td><input type="text" name="zipcode" value="${c.zipcode }"/>
  	<input type="button" value="우편번호 찾기" onclick="ZipCheck.do"/> 
  	</td>
  </tr>
  <tr colspan="2">
  	<td>주소</td>
  	<td><input type="text" name="address" value="${c.address }"/>
  </tr>
  <tr>
  	<td>내 게시글 공개</td>
  	<td><input type="radio" name="able" value="0"/> 전체공개  <input type="radio" name="able" value="1"/> 비공개
  	</td>
  </tr>
  <tr align="center" colspan="3">
  	<td></td>
  	<td><input type="submit" value="수정하기"/>
 	<input type="reset" value="다시입력"/>
  	<input type="button" value=" 취소 " onclick="javascript:window.location='../main/mainForm.do'"/>
  	</td>
  	<td></td>
  </tr>
</table>
</center>
  </form>
  </body>
</html>