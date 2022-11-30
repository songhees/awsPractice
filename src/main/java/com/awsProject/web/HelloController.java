package com.awsProject.web;

import com.awsProject.web.dto.HelloResponseDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }

    @GetMapping("/data")
    public HelloResponseDto getData(@RequestParam("name") String name, @RequestParam("age") int age) {
        return new HelloResponseDto(name, age);
    }
}
