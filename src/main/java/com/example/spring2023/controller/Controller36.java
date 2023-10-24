package com.example.spring2023.controller;

import com.example.spring2023.dao.MyDao7;
import com.example.spring2023.domain.MyDto39;
import com.example.spring2023.domain.MyDto40;
import com.example.spring2023.domain.MyDto41;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Map;

@Controller
@RequestMapping("main36")
@RequiredArgsConstructor
public class Controller36 {

    private final MyDao7 dao;

    @GetMapping("sub1")
    public void method1(){

    }

    // axios.get("/main36/sub2", {params: {id: 5}})
    // main36/sub2?id=5
    @GetMapping("sub2")
    public void method2(Integer id){
        Map<String, Object> data = dao.selectByCustomerId(id);
        System.out.println("data = " + data);
    }

    // js 코드 : axios.get("/main36/sub3", {params: {id:3}})
    // main36/sub3?id=3
    @GetMapping("sub3")
    public void method3(Integer id){
        Map<String, Object> data = dao.selectByEmployeeId(id);
        System.out.println("data = " + data);
    }

    // post /main36/sub4
    // lastName=손&firstName=흥민&birthDate=2020-02-02
    /* axios.post("/main36/sub4",{
                            lastName: "손"
                            firstName: "흥민"
                            birthDate: "2020-02-02
                            }, {
                                headers: {
                                    "content-type" : "application/x-www-form-urlencoded"
                                }
                            )*/
    @PostMapping("sub4")
    public void method4(String lastName,
                        String firstName,
                        LocalDate birthDate){
        int data = dao.inserEmployee(lastName, firstName, birthDate);
        System.out.println(data + "개 데이터 입력됨");

    }

    // axios 코드 작성
    /* axios.post("/main36/sub5",{
                        name: "라면",
                        price: 150.00,
                        category:3
                        }, {
                            headers: {
                                "content-type" : "application/x-www-form-urlencoded"
                                }
                                });
     */
    // post 방식 /main36/sub5
    // name=라면&price=150.00&category=3
    @PostMapping("sub5")
    public void method5(String name,
                        Double price,
                        Integer category) {
        int r = dao.insertProduct(name, price, category);
        System.out.println(r + "개의 데이터 추가됨");
    }

    /*
    axios.delete("/main36/sub6")
     */
//    @RequestMapping(method = RequestMethod.DELETE, value = "sub6")
    // 윗 코드랑 같은 삭제 메소드
    @DeleteMapping("sub6")
    public void method6(){
        System.out.println("Controller36.method6");
    }

    /*
    js 코드 작성후 브라우저 콘솔에 실행
    axios.delete("/main36/sub7")
     */
    @DeleteMapping("sub7")
    public void method7(){
        System.out.println("Controller36.method7");
    }

    /*
        axios.delete("/main36/sub8?name=son")
        axios.delete("/main36/sub8",{
                        name: "son",  파라미터가 많거나, 특수 기호 쓸땐 밑에, 간단할땐 위에
                        })
     */
    @DeleteMapping("sub8")
    public void method8(String name){
        System.out.println("name = " + name);
    }

    //PathVariable: URL 경로에 포함된 데이터
    // Delete와 pathvariable(" ") 안에 이름이 서로 같아야 한다
    /*
        axios.delete("/main36/sub9/son")
     */
    @DeleteMapping("sub9/{name}")
    public void method9(@PathVariable("name") String user){
        System.out.println("user = " + user);
    }

    /*
        axios.delete("/main36/sub10/3")
        axios.delete("/main36/sub10/5")
        axios.delete("/main36/sub10/7")
     */
    // main36/sub10 delete 실행되는 메소드
    // 뒤에 값은 arg로 받아서 콘솔에 출력 =? #{number}
    @DeleteMapping("sub10/{number}")
    //변수의 이름이 3개 다 똑같으면 생략 가능
//    public void method10(@PathVariable("number") Integer number){
    public void method10(@PathVariable Integer number){
        System.out.println("number = " + number);
    }

    /*
        axios.delete("/main36/sub11/1")
     */
    @DeleteMapping("sub11/{pid}")
    public void method11(@PathVariable Integer pid){
       int c = dao.deletByProductId(pid);
        System.out.println(c + "개의 데이터 삭제됨");
    }

    /*
    해당 고객 코드가 삭제 될수 있도록 작성
        axios.delete("/main36/sub12/2")
        axios.delete("/main36/sub12/3")
        axios.delete("/main36/sub12/5")
     */
    @DeleteMapping("sub12/{cid}")
    public void method12(@PathVariable Integer cid){
        int d = dao.deleteByCustomerId(cid);
        System.out.println(d + "개의 데이터 삭제");
    }

    /*
    axios.put("/main36/sub13")
    put /main36/sub13
     */

//    @RequestMapping(method= RequestMethod.PUT, value = "sub13")
    @PutMapping("sub13")
    public void method13(){
        System.out.println("Controller36.method13");
    }

    /*
        axios.put("/main36/sub14", {
            name: "son",
            address: "korea"
        }, {
            headers: {
                "content-type" : "application/x-www-form-urlencoded"
                }
        })
     */

    @PutMapping("sub14")
    public void method14(String name, String address){
        System.out.println("name = " + name);
        System.out.println("address = " + address);
    }

    /*
    axios.put("/main36/sub15",{
        city: "seoul",
        age: 78,
        score: 3.14
    },{
        headers : {
            "content-type" : "application/x-www-form-urlencoded"
        }
    })
     */
    @PutMapping("sub15")
    public void method15(String city, Integer age, Double score){
        System.out.println("city = " + city);
        System.out.println("age = " + age);
        System.out.println("score = " + score);
    }
    @PutMapping("sub16")
    public void method16(MyDto39 dto){
        System.out.println(dto.getCity());
        System.out.println(dto.getAge());
        System.out.println("dto.getScore() = " + dto.getScore());
    }

    /*
    axios.put("/main36/sub16", {
        id:3,
        name:"햄버거",
        category:30,
        price:5000.00
    }, {
        headers : {
            "content-type" : "application/x-www-form-urlencoded"
        }
    })
     */
    @PutMapping("sub17")
    public void method17(MyDto40 dto){
        int rows = dao.updateProduct(dto);
        System.out.println(rows + "개의 데이터 수정");
    }

    /*
    axios.put("/main36/sub18", {
        lastName: "lee",
        firstName: "kangin",
        birthDate: "2020-01-01",
        id : 5
        }, {
            headers : {
                 "content-type" : "application/x-www-form-urlencoded"
             }
         })
     */
    @PutMapping("sub18")
    public void method18(MyDto41 dto){
        int rows = dao.updateEmployee(dto);
        System.out.println(rows + "개의 데이터 수정됨");
    }



}
