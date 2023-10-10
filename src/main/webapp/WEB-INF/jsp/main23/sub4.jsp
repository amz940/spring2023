<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-10
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>직원 조회</h4>
<form action="">
  <div>검색 조건
    <select name="t" id="">
      <option value="name1" ${searchType == 'name1' ? 'selected' : ''}>
        Last Name
      </option>
      <option value="name2" ${searchType == 'name2' ? 'selected' : ''}>
        First Name
      </option>
      <option value="note" ${searchType == 'notes' ? 'selected' : ''}>
        Notes
      </option>
    </select>
  </div>
  <div>검색어
    <input type="text" name="k" value="${keyword}">
  </div>
  <div>
    <button>조회</button>
  </div>
</form>
<hr>
<table>
  <tr>
    <th>이름</th>
    <th>성</th>
    <th>정보</th>
  </tr>
  <c:forEach items="${employees}" var="employe">
    <tr>
      <td>${employe.LastName}</td>
      <td>${employe.FirstName}</td>
      <td>${employe.Notes}</td>
    </tr>
  </c:forEach>
</table>

</body>
</html>
