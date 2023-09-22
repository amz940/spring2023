<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-22
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            list-style: none;
        }
        .box {
            border: 1px solid black;
            margin: 5px;
            padding: 10px;
            display: flex;
            gap: 10px;
        }
        .box > div {
            border: 2px solid orange;
        }
    </style>
</head>
<body>
<%--var는 int 이름이라고 생각하면 된다--%>
<c:forEach begin="0" end="3" var="i">
    <p>음식 : ${foodList[i]}</p>
</c:forEach>

<hr>

<c:forEach items="${names}" var="item">
    <li>${item}</li>
</c:forEach>

<hr>
<%--
varStatus: 반복문의 상태
반복문 안에서 지금 어떻게 돌아가고 있는지 알려준다?
--%>
<c:forEach begin="0" end="3" var="n" varStatus="status">
<%--    div.box>div.content1+content2--%>

    <p>${n}, 실행순서 : ${status.count}</p>
    <div class="box">
        <div class="content1"> n : ${n} </div>
        <div class="content2">
            <div>count : ${status.count}</div>
            <div>index : ${status.index}</div>
            <div>current : ${status.current}</div>
            <div>first : ${status.first}</div>
            <div>last : ${status.last}</div>
        </div>
    </div>
</c:forEach>

<hr>

<c:forEach items="${names}" var="name" varStatus="status">
    <div class="box">
        <div class="content1"> name : ${name}
            <div class="content2">
                <div>count : ${status.count}</div>
                <div>index : ${status.index}</div>
                <div>current : ${status.current}</div>
                <div>first : ${status.first}</div>
                <div>last : ${status.last}</div>
            </div>
        </div>

    </div>
</c:forEach>

<hr>
<ul class="box">
    <c:forEach items="${foodList}" var="i" varStatus="status">
        <li> ${status.count} : ${i}</li>
    </c:forEach>
</ul>

</body>
</html>
