<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-24
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div>
    <button onclick="ajax1()">버튼1</button>
    <script>
        function ajax1(){
            axios.get("/main38/sub1");
        }
    </script>
</div>
<div>
    <button onclick="ajax2()">버튼2</button>
    <script>
        function ajax2(){
            axios.get("/main38/sub2")
                .then(function (response){  // axios가 응답받은 후 함수 메소드를 실행한다
                    console.log("응답 받은 후 해야하는 일");
                    console.log(response.data);
                    console.log(response.status);
                    console.log(response.statusText);
                    console.log(response.headers);
                    console.log(response.config);
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax3()">버튼3</button>
    <script>
        function ajax3(){
            axios.get("/main38/sub3")
                .then(function (response){
                    console.log(response.data);
                    console.log(response.data.age); // js에선 ; 생략 가능
                    console.log(response.data.name);
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax4()">버튼4</button>
    <script>
        function ajax4(){
            // axios.get("/main38/sub4")
            //     .then(function (response){
            //         console.log(response.data);
            //         console.log(response.data.city);
            //         console.log(response.data.price);
            //         console.log(response.data.list[0]);
            //         console.log(response.data.birth);
            //     })
            axios.get("/main38/sub4")
                .then(function (response){
                    const data = response.data;
                    console.log(data);
                    console.log(data.city);
                    console.log(data.price);
                    console.log(data.list[0]);
                    console.log(data.birth);
                })
        }
    </script>
</div>
<div>
    <input type="text" id="input1" >
    <button onclick="ajax5()">버튼5</button>
    <script>
        function ajax5(){
            const pid = document.querySelector("#input1").value
            axios.get("/main38/sub5?id=" + pid)
                .then(function (response){
                    const product = response.data;
                    console.log(product.ProductID);
                    console.log(product.ProductName);
                    console.log(product.Unit);
                    console.log(product.Price);
                })
        }
    </script>
</div>
</body>
</html>
