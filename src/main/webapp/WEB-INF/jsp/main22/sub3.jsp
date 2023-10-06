<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-06
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .active{
            background-color: beige;
            color : burlywood;
        }
        table{
            border-collapse: collapse;
        }

        tr,td{
            border: 1px solid black;
            background-color: #eeeeee;
        }
    </style>
</head>
<body>
<h4>고객 목록</h4>
<table>
    <tr>
        <td>번호</td>
        <td>이름</td>
    </tr>
    <c:forEach items="${customerList}" var="custom">
        <tr>
            <td>${custom.id}</td>
            <td>${custom.name}</td>
        </tr>
    </c:forEach>

</table>

<div>
<%--<c:if test="${leftPageNumber > 1}">--%>
<%--    <a--%>
<%--            href="/main22/sub3?page=${leftPageNumber-1}" >--%>
<%--        <button>이전</button>--%>
<%--    </a>--%>
<%--</c:if>--%>

<%--    <c:forEach begin="${leftPageNumber}" end="${rightPageNumber}" var="pageNumber">--%>
<%--        <a--%>
<%--                <c:if test="${pageNumber == currentPage}">--%>
<%--                    class="active"--%>
<%--                </c:if>--%>
<%--                href="/main22/sub3?page=${pageNumber}">${pageNumber}--%>
<%--        </a>--%>

<%--    </c:forEach>--%>
<%--    <a href="/main22/sub3?page=${rightPageNumber+1}">--%>
<%--        <button>다음</button>--%>
<%--    </a>--%>
    <c:if test="${prevPageNumber > 0}">
        <a href="/main22/sub3?page=${prevPageNumber}" >
            <button>이전</button>
        </a>
    </c:if>


    <c:forEach begin="${leftPageNumber}" end="${rightPageNumber}" var="pageNumber">
        <a
                <c:if test="${pageNumber == currentPage}">
                    class="active"
                </c:if>
                href="/main22/sub3?page=${pageNumber}">${pageNumber}
        </a>
    </c:forEach>

    <c:if test="${nextPageNumber < lastPageNumber}">
        <a href="/main22/sub3?page=${nextPageNumber}">
            <button>다음</button>
        </a>
    </c:if>
</div>

</body>
</html>
