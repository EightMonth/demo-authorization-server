package com.example.auth.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kezhijie@co-mall.com
 * @date 2024/1/1
 */
@RestController
public class MessageController {

    @GetMapping("/message1")
    public String message1() {
        return "hello message1";
    }


}
