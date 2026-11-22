<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
request.getAttribute("num");
request.getAttribute("subjects");
request.getAttribute("subjectid");
%>
<tiles:insertDefinition name="boardwrite" />