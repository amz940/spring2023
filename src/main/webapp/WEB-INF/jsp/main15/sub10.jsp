<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-27
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${modelAttr1} : ${modelAttr1}</h1>
<h1>${sessionAttr1} : ${sessionAttr1}</h1>

<h1>\${attr1} : ${attr1}</h1>

<%--모델 요소와 세션에 있는 요소가 이름이 같을때 세션에 있는 요소를 꺼낼때 쓰는 코드--%>
<%--scope : 범위 지정--%>
<h1>\${sessionScope.attr1} : ${sessionScope.attr1}</h1>
</body>
</html>
