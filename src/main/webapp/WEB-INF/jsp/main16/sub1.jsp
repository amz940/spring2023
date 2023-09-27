<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-27
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4> model : ${modelAttr1}</h4>
<h4> session : ${sessionAttr1}</h4>
<h4> app : ${appAttr1}</h4>
<hr>
<h4> attr1 : ${attr1}</h4>
<h4> sessionScope : ${sessionScope.attr1}</h4>
<h4> appScope : ${applicationScope.attr1}</h4>
</body>
</html>
