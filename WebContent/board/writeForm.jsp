<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../view/color.jspf"%>

<html>
<head>
</head>
<body bgcolor="${bodyback_c}">
	<center>
		<b>글쓰기</b> <br>
		<form method="post" name="writeform" action="/semi_prj/board/boardWritePro.do" onsubmit="return writeSave()">
			<table width="400" border="1" cellspacing="0" cellpadding="0"align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="silver"><a href="/MVC_board/MVC/list.do">글목록</a></td>				
				<c:forEach var="subjectList" items="${subjects}">
					<c:if test="${subjectList!=null}">
						<tr>
							<td width="400" align="center"><input type="checkbox" name="check1">${subjectList.subject}</td>														
						</tr>
					</c:if>
				
					<c:if test="${subjectList==null}">
						<tr>
							<td bgcolor="silver">subject가 없습니다.</td>
						</tr>
					</c:if>					
				</c:forEach>
				
				<tr>
					<td colspan="2"><textarea cols="54" rows="3" name=review></textarea></td>								
				</tr>
												
				<tr>
					<td colspan=2 bgcolor="${value_c}" align="center">
					<input type="submit" value="등록">
					<input type="reset"value="다시작성">
					<input type="button" value="목록보기"OnClick="window.location='/semi_prj/board/boardListPro.do'"></td>
				</tr>
			</table>
		</form>
</body>
</html>