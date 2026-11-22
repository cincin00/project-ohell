<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<script src="inputForm.js"></script>
</head>
<body onload="disable()"> 
	<form method="post" action="inputPro.do" name="joinF" onSubmit="return check()">
		<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
			
			<tr>
				<td colspan="2" height="39" align="center" bgcolor="">
				<font size="+1"><b>OLLE 회원가입</b></font></td>
			</tr>
				
			<tr>
				<td width="200">*사용자 ID</td>
				<td width="400">
					<input type="text"  id="ID" name="id" size="10" maxlength="12"  style="ime-mode:inactive" onblur="id_nohan(this.form)">
					 <input type="button" name="confirm_id" value="ID중복확인" OnClick="openConfirmid()">
					 <input type="hidden" name="confirm_ok"  value="no">
					 <font color="red" >[*표시는 필수 입력 사항입니다.]</font>
				</td>
			</tr>
			
			<tr>
				<td width="200">*비밀번호</td>
				<td width="400">
					<input type="password" name="passwd1" size="15" maxlength="12">
				</td>
			</tr>
			
			<tr>
				<td width="200">*비밀번호 확인</td>
				<td width="400">
					<input type="password" name="passwd2" size="15" maxlength="12">
				</td>
			</tr>
			
			<tr>
				<td width="200">*휴대폰 번호</td>
				<td width="400">
					<input type="text" name="first" value="010"  readonly="readonly" size="5">- 
					<input type="text" name="mid"  maxlength="4" size="5" onKeyPress=onlyNumber() onBlur=onlyNumber2(this)> - 
					<input type="text" name="last"  maxlength="4" size="5" onKeyPress=onlyNumber() onBlur=onlyNumber2(this)>
				</td>
			</tr>
			
			<tr>
				<td width="200">*사용자 이름</td>
				<td width="400">
					<input type="text" name="name" size="12" maxlength="15" style="ime-mode:active" onblur="id_noNumber(this.form)">
				</td>
			</tr>
			
			<tr>
				<td width="200">*성별</td>
				<td width="400">
					<!-- value값 1인 경우 남성 / value값 2인 경우 여성 -->
					<input type="radio" name="gender"  value="1">남성
					<input type="radio" name="gender"  value="2">여성
				</td>
			</tr>
			
			<tr>
				<td width="200">*나이</td>
				<td width="400">
					<input type="text"  size="10"  name="age" maxlength="4" onKeyPress=onlyNumber() onBlur=onlyNumber2(this)>
				</td>
			</tr>
			
			<tr>
				<td width ="200">*질문</td>
				<td width = "400">
					<font color="red">비밀번호를 찾기위한 질문을 선택해주세요.</font>
					<br>
					<select name="ask">
						<option value="0">질문을 선택해주세요.</option>
						<option value="parent">부모님의 성함은?</option>
						<option value="pet">애완동물의 이름은?</option>
						<option value="friend">어릴적 친구의 이름은?</option>
						<option value="treasure">자신의 가장 소중한 보물1호는?</option>
						<option value="home">자신의 어릴적 고향은?</option>
					</select>
					<input type="text"  name="answer" size="50">
			</tr>
			
			<tr>
				<td width="200">E-Mail</td>
				<td width="400">
					<input type="text" name="emailID" size="15"  maxlength="25">@
					<input type="text" name="emailAddress" size="10" >
					<select name=email  onchange="email_change(this.form)" >
							<option value="0" selected="selected">이메일주소 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="1">직접입력</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td width="200">*우편 번호</td>
				<td>
					<input type="text" name="zipcode" size="7" readonly>
					<input type="button" value="우편번호찾기" onClick="zipCheck()">
					우편번호를 검색하세요.

					<input type="text" name="address" size="70"> 나머지 주소를 적어 주세요.
				</td>
			</tr>
			
			<tr>
				<td width="200">*게시글 공개 여부</td>
				<td width="400">
					<input type="radio" name="able" value="1" checked="checked">전체 공개
					<input type="radio" name="able" value="0">비공개
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" bgcolor="">
					<input type="submit"name="confirm" value="등 록"> 
					<input type="reset"name="reset" value="다시 입력">
					 <input type="button" value="가입 안함" onclick="javascript:window.location='../main/mainForm.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>