package com.example.auth.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kezhijie@wuhandsj.com
 * @date 2023/12/29 14:44
 */
@RestController
public class HelloController {

    @GetMapping("/index")
    public String hello() {
        return "Hello";
    }

    @GetMapping("/profile")
    @PreAuthorize("hasAuthority('SCOPE_profile')")
    public String profile() {
        return "hello profile";
    }

    @GetMapping("/message")
    @PreAuthorize("hasAuthority('SCOPE_message')")
    public String message() {
        return "hello message";
    }
}
