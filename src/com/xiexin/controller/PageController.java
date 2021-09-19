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

    @RequestMapping("/vuedemo00")
    public String vuedemo00(){
        return "vuedemo00";
    }

    @RequestMapping("/vuedemo01")
    public String vuedemo01(){
        return "vuedemo01";
    }

    @RequestMapping("/vuedemo02")
    public String vuedemo02(){
        return "vuedemo02";
    }

    @RequestMapping("/vuedemo03")
    public String vuedemo03(){
        return "vuedemo03";
    }

    @RequestMapping("/vuedemo04")
    public String vuedemo04(){
        return "vuedemo04";
    }

    @RequestMapping("/vuedemo05")
    public String vuedemo05(){
        return "vuedemo05";
    }

    @RequestMapping("/jiantouhanshu")
    public String jiantouhanshu(){
        return "jiantouhanshu";
    }
}
