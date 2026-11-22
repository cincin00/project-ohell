<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
	request.getParameter("id");
	request.getParameter("items");
%>
<tiles:insertDefinition name="main" />
