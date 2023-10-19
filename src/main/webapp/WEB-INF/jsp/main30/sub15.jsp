<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-19
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>고객 정보 조회</h3>
<form action="/main30/sub15">
    <input type="text" name="id" placeholder="고객번호">
    <button>조회</button>
</form>
<hr>

<div>
    <h4>${message}</h4>
</div>

<h3>고객 정보 수정</h3>
<form action="/main30/sub16" method="post">
    <%--    div*5>input[name]--%>
        <div>
            고객 번호
            <input type="text" name="id" value="${customer.id}" readonly>
        </div>
        <div>
            고객 이름
            <input type="text" name="name" value="${customer.name}">
        </div>
        <div>
            고객 이름2
            <input type="text" name="contactName" value="${customer.contactName}">
        </div>
        <div>
            고객 주소
            <input type="text" name="address" value="${customer.address}">
        </div>
        <div>
            고객 도시
            <input type="text" name="city" value="${customer.city}">
        </div>
        <div>
            고객 우편번호
            <input type="text" name="postalCode" value="${customer.postalCode}">
        </div>
        <div>
            고객 국가
            <input type="text" name="country" value="${customer.country}">
        </div>
    <div>
        <button>수정</button>
    </div>
</form>
</body>
</html>
