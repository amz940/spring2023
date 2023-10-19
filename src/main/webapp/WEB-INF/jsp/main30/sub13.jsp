<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-19
  Time: 오전 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>직원 조회</h3>
<form action="/main30/sub13">
    <input type="text" name="id" placeholder="직원번호">
    <button>조회</button>
</form>
<hr>

<div>
    <h4>${message}</h4>
</div>

<h3>직원 수정</h3>
<form action="/main30/sub14" method="post">
<%--    div*5>input[name]--%>
    <div>
        직원번호
        <input type="text" name="id" value="${employee.id}" readonly>
    </div>
    <div>
        직원 이름
        <input type="text" name="lastName" value="${employee.lastName}">
    </div>
    <div>
        직원 성
        <input type="text" name="firstName" value="${employee.firstName}">
    </div>
    <div>
        직원 생일
        <input type="date" name="birthDate" value="${employee.birthDate}">
    </div>
    <div>
        직원 사진
        <input type="text" name="photo" value="${employee.photo}">
    </div>
    <div>
        설명
        <textarea name="notes" id="" cols="30" rows="10">${notes}</textarea>
    </div>
    <div>
        <button>수정</button>
    </div>
</form>
</body>
</html>
