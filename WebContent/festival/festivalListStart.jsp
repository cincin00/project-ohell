<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
request.getParameter("id");

request.getAttribute("currentPage");
request.getAttribute("startRow");
request.getAttribute("endRow");
request.getAttribute("pageSize");
request.getAttribute("number");
request.getAttribute("count");
request.getAttribute("items");

%>
<tiles:insertDefinition name="festivallist" />