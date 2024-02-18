<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ru8in.labs.web.jakartalabs.beans.Result" %>
<%@ page import="java.util.ArrayDeque" %>

<table class="table gy-5 table-light table-striped">
    <thead>
    <tr>
        <th scope="col">Время</th>
        <th scope="col">Координаты</th>
        <th scope="col">Попадание</th>
        <th scope="col">Время выполнения скрипта</th>
    </tr>
    </thead>
    <tbody>
    <% ArrayDeque<Result> results = (ArrayDeque<Result>) session.getAttribute("resultManager"); %>

    <% for (Result result : results) { %>
        <% System.out.println("прикол2"); %>
        <tr>
            <th><%= result.getTimestamp() %></th>
            <td><%= result.getX() %>, <%= result.getY() %>, <%= result.getR() %></td>
            <td><%= result.isHit() %></td>
            <td><%= result.getExecutionTime() %></td>
        </tr>

    <% } %>
    </tbody>
</table>