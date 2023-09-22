<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-22
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>forEach tag</h1>
<p>콘텐츠 반복 출력</p>
<p> attribute : begin , end , var , items, varStatus</p>
<%--
begin과 end를 포함해서 반복
end는 begin보다 커야 한다
begin은 음수가 되면 안된다
--%>
<c:forEach begin="0" end="3">
    <li>Lorem.</li>
</c:forEach>

<hr>
<%--var = n 번만큼 숫자가 바뀌면서 나온다--%>
<%--
begin end 조합엔 숫자가 들어가고

--%>
<c:forEach begin="0" end="2" var="num">
    <li>num : ${num}</li>
</c:forEach>

<hr>

<c:forEach begin="0" end="2" var="num">
    <li>car : ${myList[num]}</li>
</c:forEach>

<hr>
<%--전체 길이가 몰라도 사용가능--%>
<c:forEach items="${myList}" var="item">
    <li>car : ${item}</li>
</c:forEach>





</body>
</html>
