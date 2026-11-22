<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../view/color.jspf"%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="${bodyback_c}">
	<center>
		<b>글목록(전체 글:${count})</b>
		<table width="700">
			<tr>
				<!-- <td>
  <input type="button" value="정보수정" onclick="javascript:window.location='main.do'"/>
  </td> -->
				<td align="right" bgcolor="${value_c}">
				<a href="/semi_prj/boardWriteForm.do">글쓰기</a></td>
			</tr>
		</table>

		<c:if test="${count == 0}">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${count > 0}">
			<table border="1" width="700" cellpadding="0" cellspacing="0"
				align="center">
				<tr height="30" bgcolor="${value_c}">
					<td align="center" width="50">번 호</td>
					<td align="center" width="300">이미지</td>
					<td align="center" width="250">제 목</td>
					<td align="center" width="100">내용</td>
				</tr>

				<c:forEach var="items" items="${items}">
					<tr height="30">
						<td align="center" width="50"><c:out value="${number}" />
						<c:set var="number" value="${number - 1}" /></td>
						<td widtg="300">
						<img src="img/logo.jpg" width="300" hight="300"></td>
						<td width="250" hight="100">
						<a href="/semi_prj/boardViewForm.do?num=${items.boardnum}">
								${items.subject}</a></td>
						<td align="center" width="100"><a href="mailto:${items.id}">${items.id}</a>
						</td>
						<td align="center" width="150">${items.id}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${count > 0}">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
			<c:set var="pageBlock" value="${10}" />
			<fmt:parseNumber var="result" value="${currentPage / 10}"
				integerOnly="true" />
			<c:set var="startPage" value="${result * 10 + 1}" />
			<c:set var="endPage" value="${startPage + pageBlock-1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>

			<c:if test="${startPage > 10}">
				<a href="/semi_prj/boardListForm.do?pageNum=${startPage - 10 }">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/semi_prj/boardListForm.do?pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="/semi_prj/boardListForm.do?pageNum=${startPage + 10}">[다음]</a>
			</c:if>
		</c:if>
	</center>
	<!-- <form name="search" method="POST" action="/MVCboard/listSearch.do">
<SELECT name="combo">
    <OPTION value="writer">작성자</OPTION>
    <OPTION value="subject">제목</OPTION>
    <OPTION value="content">내용</OPTION>
</SELECT>
<input type="text" size="40" maxlength="50" name="search">
<input type="submit" size="40" value="검색">
</form> -->
</body>
</html>