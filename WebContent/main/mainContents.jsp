<%@ page contentType = "text/html; charset=utf-8" %>
<body>
<table>
<tr>
<img src="../img/logo.jpg" width="1200" higth="300"/>
</tr>
<c:forEach var="items" items="${items}">
		<c:if test="${ii==0}">
		<tr>
			<td>
				<img src="img/logo.jpg" width="300" hight="300">
			</td>
			<td>
				축제명 : <br>-${items.subject}<br>
				기간 : <br>-${items.start_date} ~ ${items.end_date}<br>
				장소 : <br>-${items.location}<br>
				-${items.text}
			</td>
		</c:if>
		<c:if test="${ii==1}">
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
<tr>
<td><img src="../img/logo.jpg" width="200" higth="50"/></td>
<td><img src="../img/logo.jpg" width="200" higth="50"/></td>
<td><img src="../img/logo.jpg" width="200" higth="50"/></td>
</tr>
<tr>
<td><img src="../img/logo.jpg" width="200" higth="50"/></td>
<td><img src="../img/logo.jpg" width="200" higth="50"/></td>
<td><img src="../img/logo.jpg" width="200" higth="50"/></td>
</tr>
<tr>
<td colspan="3" align="center"><a>더보기</a></td>
</tr>
</table>
</body>