<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-10-23
  Time: 오후 2:43
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
    <button onclick="ajax1()">버튼</button> <%--ajax1()는 그냥 메소드명--%>
</div>
<script>
    function ajax1(){
        // https://axios-http.com/docs/req_config
        axios.request({
            url: "/main35/sub2"
        });
    }
</script>

<div>
    <button onclick="ajax2()">버튼</button>
<%--    script 코드를 많이 넣는건 좋은 코드가 아니니 자제하자--%>
    <script>
        function ajax2(){
            axios.request({
                url : "/main35/sub3?address=seoul"
            })
        }
    </script>
</div>

<div>
    <button onclick="ajax3()">버튼</button>
    <script>
        function ajax3(){
            axios.request({
                url: "/main35/sub4",
                params: { // 파라미터를 url에 넣어준다
                    address: "seoul",
                    name: "son",
                    age : 33,
                    email: "abc@naver.com"
                }
            })
        }
    </script>
</div>
<div>
    <button onclick="ajax4()">버튼4</button>
    <script>
        function ajax4(){
            axios.request({
                url : "/main35/sub5",
                params: {
                    city : "서울",
                    id : 5,
                    score : 100,
                    country : "한국"
                }
            })
        }
    </script>
</div>

<div>
<%--    div*4>input#input$--%>
    <div><input type="text" id="input1" value="서울"></div>
    <div><input type="text" id="input2" value="5"></div>
    <div><input type="text" id="input3" value="100"></div>
    <div><input type="text" id="input4" value="한국"></div>
</div>
<div>
    <button onclick="ajax5()">버튼5</button>
    <script>
        function ajax5(){
            const city = document.querySelector("#input1").value;
            const id = document.querySelector("#input2").value;
            const score = document.querySelector("#input3").value;
            const country = document.querySelector("#input4").value;
            axios.request({
                url: "/main35/sub5",
                params: {
                    city: city,
                    id: id,
                    score: score,
                    country: country
                }
            });
        }
    </script>
</div>

<div>
<%--    div*4>input#input$@5--%>
    <div><input type="text" id="input5" value=""></div>
    <div><input type="text" id="input6" value=""></div>
    <div><input type="text" id="input7" value=""></div>
    <div><input type="text" id="input8" value=""></div>
    <div>
        <button onclick="ajax6()">버튼6</button>
        <script>
            function ajax6(){
                const address = document.querySelector("#input5").value;
                const name = document.querySelector("#input6").value;
                const age = document.querySelector("#input7").value;
                const email = document.querySelector("#input8").value;
                axios.request({
                    url : "/main35/sub4",
                    params: {
                        address, // 변수 명과 객체 명이 같으면 생략 가능
                        name,
                        age,
                        email
                    }
                })
            }
        </script>
    </div>
</div>

<div>
    <button onclick="ajax7()">버튼7</button>
    <script>
        function ajax7(){
            axios.request({
                url: "/main35/sub6",
                params: {
                    eid : 9,
                    lastName : "손",
                    firstName : "흥민"
                }
            })
        }
    </script>
</div>

<div>
    <button onclick="ajax8()">버튼8</button>
    <script>
        function ajax8(){
            axios.request({
                url: "/main35/sub7",
                method : "post" // 메소드를 따로 지정하지 않으면 디폴트는 get 방식이다, get방식은 생략가능
            })
        }
    </script>
</div>

<div>
    <button onclick="ajax9()">버튼9</button>
    <script>
        function ajax9(){
            axios.post("/main35/sub7")
        }
    </script>
</div>

<div>
    <button onclick="ajax10()">버튼10</button>
    <script>
        // city = 서울& country = 한국
        function ajax10(){
            axios.post("/main35/sub8",{
                city: "서울",
                country : "한국"
            }, {
                headers : {
                    "content-type": "application/x-www-form-urlencoded"
                }
            })
        }
    </script>
</div>

<div>
    <div>
        <input type="text" id="input9">
    </div>
    <div>
        <input type="text" id="input10">
    </div>
    <div>
        <input type="text" id="input11">
    </div>
    <div>
        <button onclick="ajax11()">버튼11</button>
        <script>
            function ajax11(){
                const eid = document.getElementById("input9").value
                const lastName = document.getElementById("input10").value
                const firstName = document.querySelector("#input11").value
                axios.post("/main35/sub9", {
                    eid,
                    lastName,
                    firstName
                }, {
                    headers: {
                        "content-type": "application/x-www-form-urlencoded"
                    }
                })
            }
        </script>
    </div>
</div>


<div>
    <h4>파일 전송하는 방법</h4>
    <div>
        <input type="text" id="input12" value="이강인">
    </div>
    <div>
        <input type="file" multiple id="input13" accept="image/*">
    </div>
    <div>
        <button onclick="ajax12()">버튼12</button>
        <script>
            function ajax12(){
                axios.postForm("/main35/sub10",{
                    name: document.querySelector("#input12").value,
                    files: document.querySelector("#input13").files
                })
            }
        </script>
    </div>
</div>

<div>
    <div>
        <button onclick="ajax13()">버튼 13</button>
        <script>
            function ajax13(){
                axios.request({
                    url : "/main35/sub11"
                    // method : "get" 생략 가능
                });
            }
        </script>

    </div>
</div>


</body>
</html>
