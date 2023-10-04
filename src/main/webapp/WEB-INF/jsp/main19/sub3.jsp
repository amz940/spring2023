<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-04
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>공급자 목록</h3>
<%--table>tr>th*3--%>
<table style="border-collapse: collapse; border: 1px solid black; width: 100%">
    <tr>
        <th style>ID</th>
        <th>NAME</th>
        <th>PHONE</th>
    </tr>
    <c:forEach items="${shippers}" var="shippers">
        <tr>
            <td style="background-color: #eeeeee">${shippers.id}</td>
            <td style="background-color: #eeeeee">${shippers.name}</td>
            <td style="background-color: #eeeeee">${shippers.phone}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
