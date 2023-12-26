package com.docker.dockerpilot;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${name}")
    private String name;

    @GetMapping("/hello")
    String hello(@RequestParam(required = false) String name) {
        return "Hello " + name;
    }
}
