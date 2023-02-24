package com.study.hard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.hard.service.BkService;
import com.study.hard.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller // 화면 호출 컨트롤러
public class Main {
    public static void main(String[] args ){
        System.out.println("Hello World!");
    }
}