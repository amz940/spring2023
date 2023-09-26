<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-26
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/main13/sub8">
    <div>
        <label for="input1">아이디</label>
        <input type="number" id="input1" name="Id">
    </div>
    <div>
        <label for="input2">이름</label>
        <input type="text" id="input2" name="Name">
    </div>
    <div>
        <label for="input3">주소</label>
        <input type="text" id="input3" name="Address">
    </div>
    <div>
        <label for="input4">스케쥴</label>
        <input type="datetime-local" id="input4" name="schedule">
    </div>
    <div>
        <label for="input5">점심먹기</label>
        <input type="checkbox" id="input5" name="todos" value="lunch">
    </div>
    <div>
        <label for="input6">퇴근</label>
        <input type="checkbox" id="input6" name="todos" value="home">
    </div>
    <div>
        <label for="input7">여행</label>
        <input type="checkbox" id="input7" name="todos" value="japan">
    </div>
    <div>
        <label for="input8">할일1</label>
        <input type="text" id="input8" name="todos" value="">
    </div>
    <div>
        <label for="input9">할일2</label>
        <input type="text" id="input9" name="todos" value="">
    </div>

    <button>가입</button>
</form>
</body>
</html>
