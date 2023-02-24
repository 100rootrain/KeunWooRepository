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

import com.study.hard.service.TestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {

	@Autowired
	TestService testService;

	@RequestMapping(value = "/t1", method = RequestMethod.GET)
	public String t1(Locale locale, Model model) {
		return "t1";
	}

	@RequestMapping(value = "/t2", method = RequestMethod.GET)
	public String t2(@RequestParam String a, 
			@RequestParam String b, 
			@RequestParam String c, Locale locale, Model model) {
		//화면에서 넘어온 데이터를 map에 담음 -> 한번에 보내기 위해
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("a", a);
		map.put("b", b);
		map.put("c", c);
		
		//서비스 객체의 메서드 호출
		testService.insert(map);
		return "redirect:/t3"; // 다시 조회하기 위해 조회 url로 연결
	}
	
	@RequestMapping(value = "/t3", method = RequestMethod.GET)
	public String t3(Locale locale, Model model) {
		//서비스 객체의 메서드 호출하여 ArrayList(데이터) 반환
		ArrayList<HashMap<String, Object>> list = testService.select();
		model.addAttribute("list", list);
		return "t3";
	}

	@RequestMapping(value = "/t_delete", method = RequestMethod.GET)
	public String t_delete(@RequestParam String k, Locale locale, Model model) {
		//서비스 객체의 메서드 호출
		testService.delete(k);
		return "redirect:/t3"; // 다시 조회하기 위해 조회 url로 연결
	}
	@RequestMapping(value = "/address_test", method = RequestMethod.GET)
	public String address_test(Locale locale, Model model) {
		return "address"; // 다시 조회하기 위해 조회 url로 연결
	}
}
