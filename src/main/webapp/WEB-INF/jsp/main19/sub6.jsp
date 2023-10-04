<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-04
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>java bean으로 view 꺼내기</h4>
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Address</th>
    <th>Country</th>
  </tr>
  <c:forEach items="${customerList}" var="customer">
    <tr>
      <td>${customer.id}</td>
      <td>${customer.name}</td>
      <td>${customer.address}</td>
      <td>${customer.country}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
