<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-05
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>고객 조회</h4>
<table>
    <tr>
        <th style="background-color: aqua">이름</th>
        <th style="background-color: aqua">나라</th>
    </tr>
    <c:forEach items="${countryList}" var="supplier">
        <tr>
            <td>${supplier.name}</td>
            <td>${supplier.country}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
