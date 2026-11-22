<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>ID 중복 확인</title>
<script>
 
function setId()
{
	//opener:새로운 창을 연다.
	//input type text 값에 입력한 아이디 입력
	opener.document.joinF.ID.value="${id}";
	opener.document.joinF.confirm_ok.value="yes";
	self.close();
} 
 
 </script>
</head>
<body>
<!-- int check = request.getAttribute("check"); -->
	<c:if test="${check==-1 }">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr bgcolor="">
				<td height="39">${id}는이미 사용중인 아이디입니다!</td>
			</tr>
		</table>
		<form name="checkForm" method="post" action="confirmId.do">
			<table width="270" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td bgcolor="" align="center">다른 아이디를 선택하세요.
						<p>
							<input type="text" size="10" maxlength="12" name="id"> 
							<input type="submit" value="ID중복확인">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${check==1 }">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr bgcolor="">
				<td align="center">
					<p>입력하신ID ${id}는 사용하실 수 있는 ID입니다.</p> 
					<input type="button" value="닫기"  onClick="setId()"> 
					<!-- <input type="button" value="닫기" onclick="self.close"> -->
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>