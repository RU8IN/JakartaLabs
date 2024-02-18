<%@ page import="ru8in.labs.web.jakartalabs.beans.Result" %>
<%@ taglib prefix="tableTags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Result result = (Result) session.getAttribute("result"); %>
<tableTags:tableRow  result="<%=result%>"/>