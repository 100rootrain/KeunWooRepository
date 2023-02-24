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

import com.study.hard.service.TestService2;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController2 {

	@Autowired
	TestService2 testService2;

	@RequestMapping(value = "/listNew", method = RequestMethod.GET)
	public String listNew(Locale locale, Model model) {
		//DB에서 목록 조회
		//받아오는 자료형 = ArrayList<HashMap<String, Object>
		ArrayList<HashMap<String, Object>> list = testService2.getList();
		model.addAttribute("name", "박경민");
		model.addAttribute("list", list);
		return "listNew";
	}
	
	@RequestMapping(value = "/empDetail", method = RequestMethod.GET)
	public String empDetail(@RequestParam String empNo,
			Locale locale, Model model) {
		System.out.println("empNo : "+ empNo);
		//DB에서 목록 조회
		//받아오는 자료형 = HashMap<String, Object> <-Key를 이용해서 한 행만 조회했기 때문
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", empNo);
		HashMap<String, Object> empInfo = testService2.getEmpDetail(paramMap);
		ArrayList<HashMap<String, Object>> deptList = testService2.getDeptList();
		model.addAttribute("empInfo", empInfo);
		model.addAttribute("deptList", deptList);
		return "empDetail";
	}
}
