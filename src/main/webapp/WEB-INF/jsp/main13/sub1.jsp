<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-26
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>input 요소들</h3>
<form action="/main13/sub1">
<%--    div*10>input[name=param$]--%>
    <div><input type="text" name="param1"></div>
<%--  password :  출력값이 기호로 나온다--%>
    <div><input type="password" name="param2"></div>
<%--  type="date"  달력--%>
<%--    실제 날짜는 아니고 해당 날짜의 문자열이 넘어가는것이다--%>
    <div><input type="date" name="param3"></div>
<%--  type="button"  버튼 창--%>
    <div><input type="button" name="param4" value ="어떤 버튼"></div>
<%--  type="number"  숫자만 입력 가능--%>
<%--    보기에만 int 지 실제값은 query string으로 넘어가서 문자열이다--%>
<%--    자동 형변환 해줘서 가능--%>
    <div><input type="number" name="param5"></div>
<%--  type="submit"  input 원소에 있는 입력 버튼하고 똑같은 기능--%>
    <div><input type="submit" name="param6" value="회원가입"></div>
<%--  type="radio"  여러개의 선택지중 하나만 선택해야 할때--%>
    <div><input type="radio" name="param7"></div>
    <div><input type="radio" name="param7"></div>
    <%--    여러개의 선택지를 선택하고 싶을때, name을 같은 이름을로 설정하면 된다--%>
    <div><input type="checkbox" name="param9"></div>
    <div><input type="checkbox" name="param9"></div>
<%--  type="hidden" :  화면에 보이진 않지만 숨겨져 있는 원소,
전송버튼을 눌렀을때 사용자한테 보이지 않으면 좋은 코드들을 사용할때 쓰인다--%>
    <div><input type="hidden" name="param10" value="some value"></div>
<%--    view에 입력된 값을 controller로 보내준다--%>
    <button>전송</button>

</form>

<form action="/main13/sub1">
    <div>
<%--        기본 값--%>
        <input type="text" name="param1" value="son">
    </div>
<%--  placeholder  입력되어야 하는 값의 힌트--%>
    <div>
        <input type="text" name="param2" placeholder="이름을 입력해주세요">
    </div>
<%--  maxlenght  입력되어야 하는 값의 길이를 제한--%>
    <div>
        <input type="text" maxlength="5">
    </div>
<%--  required  필수로 입력되어야 하는 값인걸 알려준다--%>
    <div>
        <input type="text" required>
    </div>
<%--  readonly value  변경할수 없는 값--%>
    <div>
        <input type="text" name="param3" readonly value="son">
    </div>
<%--  disable  전송 조차 되지 않는 변경할 수 없는 값--%>
    <div>
        <input type="text" name="param4"  value="son" disabled>
    </div>
<%-- pattern :  java 정규표현식 구현 가능--%>
    <div>
        <input type="text"  pattern="\d{3}" name="param5">
    </div>
<%--    div*2>input:c--%>
<%--    로딩 되자 마자 체크창에 체크 되어야 할때 쓰인다--%>
<%--    checked 붙은 것만 자동 체크 되어서 나온다--%>
    <div><input type="checkbox" name="param6" checked id=""></div>
    <div><input type="checkbox" name="param6" id=""></div>
<%--    div*2>input:r--%>
    <div><input type="radio" name="param7" id=""></div>
    <div><input type="radio" name="param7" id=""></div>
    <div><input type="radio" name="parma7" checked id=""></div>
<%--  type="file" : 파일을 하나만 선택하고 싶을때 사용--%>
    <div><input type="file"></div>
<%--  multiple : 파일을 여러개 선택하고 싶을 때 사용--%>
    <div><input type="file" multiple></div>
    <button>전송</button>


</form>

<hr>

<form action="/main13/sub1">
<%--    label의 주소와 id의 주소가 같아야 한다--%>
    <label for="input1">
        주소
    </label>
    <input type="text" id="input1">
    <br>
<%--    div>div*3>label[for=check$]>lorem1^+input:c#check$--%>
    <div>
        <div>
            <label for="check1">Lorem.</label>
            <input type="checkbox" name="" id="check1">
        </div>
        <div>
            <label for="check2">Eligendi.</label>
            <input type="checkbox" name="" id="check2">
        </div>
        <div>
            <label for="check3">Unde!</label>
            <input type="checkbox" name="" id="check3">
        </div>
    </div>
<%--
    버튼과 input=submit 은 역할은 똑같지만 input은 선택지를 넣을 수 없고
    버튼은 종료 선택지(content)를 추가로 넣을수가 있다.
    --%>
    <input type="submit" value="전송">
    <button>전송</button>
</form>
</body>
</html>
