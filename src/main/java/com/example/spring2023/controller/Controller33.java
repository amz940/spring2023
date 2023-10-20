package com.example.spring2023.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@Controller
@RequestMapping("main33")
@RequiredArgsConstructor
public class Controller33 {


    @GetMapping("sub1")
    public void method1(){

    }

    @PostMapping("sub2")
    public void method2(String name,
                        Integer age,
                        MultipartFile myfile) throws IOException {
        System.out.println("name = " + name);
        System.out.println("age = " + age);

        if( myfile != null){
            String filename = myfile.getOriginalFilename();
            System.out.println("filename = " + filename);

            String path = "C:\\Temp\\upload_" + filename;
            InputStream inputStream = myfile.getInputStream();
            FileOutputStream outputStream = new FileOutputStream(path);


            BufferedInputStream bis = new BufferedInputStream(inputStream);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);

            try(bis; bos){
                byte[] data = new byte[1024];
                int len = 0;

                while ((len = bis.read(data)) != -1){
                    bos.write(data, 0 ,len);
                }
                bos.flush();
            }
        }
    }

    @GetMapping("sub3")
    public void method3(){

    }

    @PostMapping("sub4")
        // 업로드한 파일을 C:\\TEemp 내에 저장
    public void method4(MultipartFile upload) throws IOException {

        if( upload != null){
            String filename = upload.getOriginalFilename();
            System.out.println("filename = " + filename);
            String path = "C:\\Temp\\fox_" + filename;

            BufferedInputStream bis = new BufferedInputStream(upload.getInputStream());
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path));

            try(bis; bos){
                byte[] data = new byte[1024];
                int len = 0;
                while ((len = bis.read(data)) != -1){
                    bos.write(data, 0 ,len);
                }
                bos.flush();
            }
        }
    }

    @GetMapping("sub5")
    public void method5(){

    }

    @PostMapping("sub6")
    public void method6(MultipartFile[] files) throws IOException {
        // 아무파일을 선택하지 않아도 1의 숫자가 나온다
        System.out.println("files.length = " + files.length);

        System.out.println("업로드 파일 크기들");
        for (MultipartFile file: files){
            System.out.println("file.getSize() = " + file.getSize());

            if(file.getSize() > 0){
                String path = "C:\\Temp\\upload_"
                        ;
                BufferedInputStream bis = new BufferedInputStream(file.getInputStream());
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + file.getOriginalFilename()));

                int len = 0;
                byte[] data = new byte[1024];

                while ((len = bis.read()) != -1){
                    bos.write(data, 0, len);
                }
                bos.flush();
            }
        }
    }


    @GetMapping("sub7")
    public void method7(){

    }

    @PostMapping("sub8")
    public void method8(@RequestParam(value = "files", required = false) MultipartFile[] files) throws IOException {
        // 여러 업로드된 파일을
        // C:\\Temp\\upload\\에 저장


        for(MultipartFile file : files){
            System.out.println("file1.getSize() = " + file.getSize());

            if(file.getSize() > 0){
                String dirpath = "C:\\Temp\\upload\\";
                File polder = new File(dirpath);
                if ( !polder.exists()){
                    polder.mkdir();
                }

                BufferedInputStream bis = new BufferedInputStream(file.getInputStream());
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(dirpath + file.getOriginalFilename()));

                try(bis; bos){
                    int len = 0;
                    byte[] data = new byte[1024];

                    while ((len = bis.read(data)) != -1){
                        bos.write(data, 0, len);
                    }
                    bos.flush();
                }
            }
        }
    }
}
