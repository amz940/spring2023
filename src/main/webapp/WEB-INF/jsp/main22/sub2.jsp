<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-06
  Time: 오전 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border-collapse: collapse;
        }

        th, td{
            border: 1px solid black;
            background-color: aqua;
        }
    </style>
</head>
<body>
<h4>공급자</h4>
<table>
    <tr>
        <th >이름</th>
        <th >나라</th>
        <th>번호</th>
    </tr>
    <c:forEach items="${supplier}" var="supplier">
        <tr>
            <td>${supplier.id}</td>
            <td>${supplier.name}</td>
            <td>${supplier.phone}</td>
        </tr>
    </c:forEach>
</table>

<div>
    <c:forEach begin="1" end="${lastPageNumber}" var="pageNumber">
        <a href="/main22/sub2?page=${pageNumber}">${pageNumber}</a>

    </c:forEach>
</div>
</body>
</html>
