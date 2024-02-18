<%--
  Created by IntelliJ IDEA.
  User: infinity
  Date: 19.02.2024
  Time: 01:38
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ attribute name="result" required="true" type="ru8in.labs.web.jakartalabs.beans.Result" %>
<tr>
    <th><%= result.getTimestamp() %></th>
    <td><%= result.getX() %>, <%= result.getY() %>, <%= result.getR() %></td>
    <td><%= result.isHit() %></td>
    <td><%= result.getExecutionTime() %></td>
</tr>