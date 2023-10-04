<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-04
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<style>
  table{
    border-collapse: collapse;
    width: 100%;
  }
  th, td{
    border: 1px solid black;
  }
  th{
    background-color: aqua;
  }
</style>
<head>
    <title>Title</title>
</head>
<body>
<h4>상품 목록</h4>
<table>
  <tr>
    <th style="background-color: aqua">번호</th>
    <th style="background-color: aqua">상품명</th>
    <th style="background-color: aqua">단위</th>
    <th style="background-color: aqua">가격</th>
  </tr>
  <c:forEach items="${productList}" var="product">
    <tr>
      <td>${product.id}</td>
      <td>${product.name}</td>
      <td>${product.unit}</td>
      <td>${product.price}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
