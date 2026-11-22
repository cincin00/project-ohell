<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
request.getAttribute("boardnum");
request.getAttribute("review");
request.getAttribute("subject");	
request.getAttribute("comentList");
request.getAttribute("count");
%>
<tiles:insertDefinition name="boardview" />