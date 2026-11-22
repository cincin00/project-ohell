<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<table align="center" cellpadding="0" cellspacing="1">
<tr>
<td>아이디 찾기</td>
</tr>
<tr>
<td>
<form method="post" action="findIdPro.do">
<table align="center" cellpadding="0" cellspacing="1" border="1">
	<tr align="center">
		<td>
			이름
		</td>
		<td>
			<input type="text" name="name"/>
		</td>
	</tr>
	<tr>
		<td>
			전화번호
		</td>
		<td>
			<input type="text" name="phone"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="아이디 찾기">
		</td>
	</tr>
</table>
</form>
</td>
</tr>
<tr>
<td>비밀번호 찾기</td>
</tr>
<tr>
<td>
<form method="post" action="findPasswdPro.do">
<table align="center" cellpadding="0" cellspacing="1" border="1">
	<tr>
		<td>
			아이디
		</td>
		<td>
			<input type="text" name="id"/>
		</td>
	</tr>
	<tr>
		<td>
			전화번호
		</td>
		<td>
			<input type="text" name="phone"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="비밀번호 찾기">
		</td>
	</tr>
</table>
</form>
</td>
</tr>
</table>
</form>
</body>
</html>