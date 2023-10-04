<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-04
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>어똨케 작성하는거쥬?</h1>
<table style="border-collapse: collapse; border: 1px solid black; width: 100%">
  <tr>
    <td>ID</td>
    <td>NAME</td>
    <td>CITY</td>
    <td>COUNTRY</td>
  </tr>
  <c:forEach items="${customer}" var="customer">
    <tr>
      <td style="background-color: #eeeeee">${customer.id}</td>
      <td style="background-color: #eeeeee">${customer.name}</td>
      <td style="background-color: #eeeeee">${customer.city}</td>
      <td style="background-color: #eeeeee">${customer.country}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
