package com.xiexin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class PageController {
    @RequestMapping("/")
    public String main1(){
        return "main";
    }

    @RequestMapping("/main")
    public String main(){
        return "main";
    }

    @RequestMapping("/addBusiness")
    public String addBusiness(){
        return "addBusiness";
    }
}
