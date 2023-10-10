<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-10
  Time: 오전 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>고객 이름 뽑기</h4>
<form>
  검색어
  <input type="text" name="k" placeholder="검색어를 입력해주세요" value="${keyword}">
  <button>클릭</button>
</form>
<ul>
  <c:forEach items="${customername}" var="cname">
    <tr>
      <td>${cname.name}</td>
    </tr>
  </c:forEach>
</ul>

</body>
</html>
