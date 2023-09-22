<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-22
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
table{
    width: 100%
    border :
}
</style>
<body>
<table class="box">
    <tr class="box">
        <th>ID</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>ClassName</th>
        <th>PhoneNumber</th>
    </tr>
    <c:forEach items="${table}" var="i">
        <tr class="box">
            <td>${i.id}</td>
            <td>${i.firstName}</td>
            <td>${i.lastName}</td>
            <td>${i.className}</td>
            <td>${i.phoneNumber}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
