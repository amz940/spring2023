<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-27
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>새 글 작성</h1>
<%--같은 경로로 전송될땐 경로 생략 가능--%>
<form method="post">
<%--  div>label[for=titleInput]{제목}+input[name=title]--%>
  <div>
    <label for="titleInput">제목</label>
    <input type="text" name="title" id="titleInput">
  </div>
  <div>
<%--    textarea[placeholder=본문][name=body]--%>
  <textarea name="body" id="" cols="30" rows="10" placeholder="본문"></textarea>
  </div>
  <div>
    <button>전송</button>
  </div>
</form>
</body>
</html>