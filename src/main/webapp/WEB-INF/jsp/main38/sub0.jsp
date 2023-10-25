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
<div>
    <button onclick="ajax6()">버튼6</button>
    <script>
        function ajax6(){
            axios.get("/main38/sub2")
                .then(function (){
                    console.log("응답 완료 후 실행")
                })
                .then(function (){
                    console.log("그 다음 실행")
                })
                .then(function (){
                    console.log("또 그 다음 실행")
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax7()">버튼7</button>
    <script>
        function ajax7(){
            axios.get("/main38/sub2")
                .then(function (){
                    console.log('첫 함수')
                    return "abcd";
                })
                .then(function (param){ // return한 값이 2번째 실행한 함수의 arg로 들어간다
                    console.log(param) // "abcd"
                    return 345;
                })
                .then(function (param){
                    console.log(param) // 345 , 직전 함수의 리턴값을 arg로 받아온다
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax8()">버튼8</button>
    <script>
        function ajax8() {
            axios.get("/main38/sub2")
                .then(function (param){
                    console.log("첫 함수 리턴")
                    return param.data;
                })
                .then(function (param){
                    console.log("두번째 함수 리턴")
                    console.log(param)
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax9()">버튼9</button>
    <script>
        function ajax9(){
            axios.get("/main38/sub2")
                .then(response => response.data)
                .then(param => console.log(param))
        }
    </script>
</div>
<div>
    <button onclick="ajax10()">버튼10</button>
    <script>
        function ajax10(){
        // arrow function으로 작성해보기
            axios.get("/main38/sub4")
                .then(response => response.data)
                .then(data => console.log(data.list[1]))
        }
    </script>
</div>
<div>
    <button onclick="ajax11()">버튼11</button>
    <script>
        function ajax11(){
            axios.get("/main38/sub4")
                .then(response => response.data)
                // .then(data => console.log(data.price)) // 3000
                // 구조분해할당(destructuring assignment)
                // 명령문이 한개여도 소괄호 생략 불가능
                .then(({price,birth,list,city}) => console.log(price));
        }
    </script>
</div>
<div>
    <button onclick="ajax12()">버튼12</button>
    <script>
        function ajax12(){
            axios.get("/main38/sub4")
                // .then(response => response.data)
                // .then(data => console.log(data.price))
                .then(({data}) => console.log(data.price))
        }
    </script>
</div>
<div>
    <button onclick="ajax13()">버튼 13</button>
    <script>
        function ajax13(){
            axios.get("/main38/sub4")
                // .then(response => response.data)
                // .then(({price,city,country = "korea"}) =>{
                //     console.log(price) // 3000
                //     console.log(city) // seoul
                //     console.log(country) // korea
                // })
                .then(({data}) => {
                    console.log(data.price)
                    console.log(data.city)
                    console.log(data.country = "korea")
                })
        }
    </script>
</div>
<script>
    // 구조분해할당 (destructuring assignment)
    let a = {
        name : "son",
        age : 30
    }

    console.log(a.name);
    console.log(a.age)

    let myName = a.name;
    let myAge = a.age;

    console.log(myName);
    console.log(myAge);

    let {name,age} = a; // destructuring assignment
    console.log(name); // son
    console.log(age); // 30

    let b = {
        city: 'seoul',
        country : "korea"
    };

    let{city,country} = b;
    console.log(city);
    console.log(country);

    let c = {
        email: "abc@gmail.com",
        price: 300
    }
    // let {email, price} = c;
    let {email} = c; // destructuring assignment

    let d = {
        name2 : "lee",
        address : "paris",
        age : 77
    }
    let {name2, address} = d; // 변수 전부다 할 필요 없이 일부분만 해도 된다

    let e = {
        city2: "seoul",
        country2: "korea"
    }

    let {city2,country2,category} = e;
    console.log(city2); // seoul
    console.log(country2); // korea
    console.log(category); // undefined

    let f = {
        name3: "kim",
        city3: "busan"
    }

    let{name3,city3 = "인천",address3 = "신촌"} = f; // 값이 없을때 기본값 할당하는 방법, 기존 값이 있으면 적용안됨
    console.log(name3)
    console.log(city3)
    console.log(address3)

    let g = [30,40,50];

    let [h, i ,j] = g; // 구조분해할당 (destructuring assignment)
    console.log(h)
    console.log(i)
    console.log(j)

    let[k,l] = g;
    console.log(k)
    console.log(l)

    let [m,...n] = g;
    console.log(m)
    console.log(n)

    let [...o] = g;
    console.log(o); // [ 30 , 40 ,50 ]


</script>
</body>
</html>
