<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../view/color.jspf"%>

<html>
<head>
<title>게시판</title>
</head>
<body bgcolor="${bodyback_c}">
<center><b>글목록(전체 글:${count})</b>
<table width="700">
  <tr>
  <!-- <td>
  <input type="button" value="정보수정" onclick="javascript:window.location='main.do'"/>
  </td> -->
    <td align="right" bgcolor="${value_c}">
       <a href="/semi_prj/festivalWriteForm.do">글쓰기</a>
    </td>
  </tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
	<table border="1" width="1200" cellpadding="0" cellspacing="0" align="center">
		<tr height="30" bgcolor="${value_c}">
			<td align="center"  width="1200" colspan="6">-Festival-</td>
		</tr>
		<c:forEach var="items" items="${items}">
		
		<c:if test="${ii==0}">
		<tr>
			<td>
				<c:out value="${number}"/>
			  	<c:set var="number" value="${number - 1}"/>
			</td>
			<td>
				<img src="img/logo.jpg" width="300" hight="300">
			</td>
			<td>
				축제명 : <br>-${items.title}<br>
				기간 : <br>-${items.start_date} ~ ${items.end_date}<br>
				장소 : <br>-${items.location}<br>
				-${items.text}
			</td>
		</c:if>
		<c:if test="${ii==1}">
				<td>
					<c:out value="${number}"/>
				  	<c:set var="number" value="${number - 1}"/>
				</td>
				<td>
					<img src="img/logo.jpg" width="300" hight="300">
				</td>
				<td>
					축제명 : ${items.title}<br>
					기간 : ${items.start_date} ~ ${items.end_date}<br>
					장소 : ${items.location}<br>
					${items.text}
				</td>
			</tr>
		</c:if>
		${ii=ii+1}
		<c:if test="${ii==2}">
			${ii=0}
		</c:if>
		</c:forEach>
	</table>
</c:if>
<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if>
         
   <c:if test="${startPage > 10}">
        <a href="/semi_prj/festivalListForm.do?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/semi_prj/festivalListForm.do?pageNum=${i}">[${i}]</a>
   </c:forEach>
   <c:if test="${endPage < pageCount}">
        <a href="/semi_prj/festivalListForm.do?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</center>
</body>
</html>