<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-27
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>선택한 음식들</h1>
<c:forEach items="${food}" var="food">
    ${food}
</c:forEach>
<a href="/main15/sub7">다시 선택하기</a>
</body>
</html>
