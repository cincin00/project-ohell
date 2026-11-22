<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../view/color.jspf"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body bgcolor="${bodyback_c}">
	<center>
		<b>글자세히</b> <br>
		<form name="writeform" method=post action=boardComentUpdate.do>
		
			<input type="hidden" name="content_num" value="${boardnum}">			
			<input type="hidden" name="comenter" value="tom">

			<table width="400" border="1" cellspacing="0" cellpadding="0"align="center">
				<tr>
					<td align="right" colspan="2">
					<a href="/semi_prj/boardListForm.do">글목록</a>
					</td>
				</tr>
				
				<tr>
					<td width="400" align="center" colspan="2">${subject}</td>
				</tr>

				<tr height="30">
					<td width="400" align="center" colspan="2">${review}</td>
				</tr>
				
				<tr height="20">				
				</tr>

				<tr>
					<td>
					<textarea name=comentt rows="3" cols="50"></textarea>				
					</td>
				
					<td>
					<input type=submit value=코멘트달기>
					</td>
				</tr>
			</table>
			
			<table border="0" cellspacing="0" cellpadding="0"align="center">
				
				<c:if test="${count>0}">
				<tr>
							<td colspan="3" align="center">코멘트</td>
							<td align="center" bgcolor="silver">작성자
				</tr>
				<c:forEach var="coments" items="${comentList}">				
					<c:if test="${coments!=null}">
						<tr>
							<td width="400">＊&nbsp${coments.coment}</td>
							<td width="100"><a href="boardLikeUpdate.do?ctn=${coments.content_num}&cmt=${coments.coment_num}&like=${coments.like_num}">좋아요?</a>&nbsp;${coments.like_num}</td>
							<td align="center" width="30">
							<a href="boardComentDelete.do?ctn=${coments.content_num}&cmn=${coments.coment_num}">X</a></td>
							<td bgcolor="silver" width="100" align="center">${coments.comenter}</td>														
						</tr>
					</c:if>
				
					<c:if test="${coments==null}">
						<tr>
							<td bgcolor="silver">코멘트가 없습니다.</td>
						</tr>
					</c:if>	
				</c:forEach>
			 	</c:if>
			 	<c:if test="${count==0}">
			 		<tr>
			 			<td align="center">코멘트가 없습니다</td>
			 		</tr>
			 	</c:if>
			</table>
		</form>
		</table>
	</center>
</body>
</html>