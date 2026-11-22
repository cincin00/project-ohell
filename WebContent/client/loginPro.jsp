<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<% request.setCharacterEncoding("euc-kr");%>

<c:if test="${check == 1 }">
	<c:redirect url="../main/mainForm.do"/>
</c:if>
<c:if test="${check == 0 }">
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
</c:if>
<c:if test="${check != 1 && check != 0 }">
<script>
	alert("아이디가 맞지 않습니다..");
	history.go(-1);
</script>
</c:if>