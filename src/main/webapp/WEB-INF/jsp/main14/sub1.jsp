<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-26
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>암호 전송</h1>
<%--method : 어떻게 보낼지 정한다--%>
<%--
get 방식 : 주소에 query String으로 붙어서 전송된다
1. 브라우저 주소란에 남겨진다
2. 길이의 제한이 있다

post 방식 : 요청 본문에 붙어서 전송
1. 브라우저 주소란에서 볼 수 없다
2. 길이의 제한이 없다
3. 파일 전송 같은 경우는 post방식을 써라.( 길이의 제한이 없기 때문)
--%>
<h3>get</h3>
<form action="/main14/sub2" method="get">
    <div>
        id:
        <input type="text" name="id">
    </div>
    <div>
        password:
        <input type="password" name="password">
    </div>
    <button>전송</button>
</form>

<hr>

<h3>post</h3>

<form action="/main14/sub2" method="post">
    <div>
        id:
        <input type="text" name="id">
    </div>
    <div>
        password:
        <input type="password" name="password">
    </div>
    <button>전송</button>
</form>
</body>
</html>
