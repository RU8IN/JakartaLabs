<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ru8in.labs.web.jakartalabs.beans.Result" %>
<%@ page import="java.util.ArrayDeque" %>
<%@ taglib prefix="tableTags" tagdir="/WEB-INF/tags" %>
<table class="table gy-5 table-light table-striped">
    <thead>
    <tr>
        <th scope="col">Время</th>
        <th scope="col">Координаты</th>
        <th scope="col">Попадание</th>
        <th scope="col">Время выполнения скрипта</th>
    </tr>
    </thead>
    <tbody id="results-table">
    <% ArrayDeque<Result> results = (ArrayDeque<Result>) session.getAttribute("resultManager"); %>

    <% for (Result result : results) { %>
        <tableTags:tableRow result="<%= result %>"/>
    <% } %>
    </tbody>
</table>