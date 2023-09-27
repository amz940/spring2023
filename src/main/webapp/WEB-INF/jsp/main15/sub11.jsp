<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-27
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>모델 값 꺼내오기</h1>

<c:forEach items="${items}" var="name">
  <li>${name}</li>

</c:forEach>
<hr>
<h1>세션 값 꺼내오기</h1>

<c:forEach items="${sessionScope.items}" var="item" >
  <li>
      ${item}
  </li>
</c:forEach>
</body>
</html>
