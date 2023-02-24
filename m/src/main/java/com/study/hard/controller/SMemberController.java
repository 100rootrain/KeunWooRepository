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

import com.study.hard.service.SMemberService;

@Controller //이 어노테이션이 있어야 프레임워크에서 컨트롤러로 인식하여 url과 메서드를 연결해주
public class SMemberController {
	//자동 객체 생성 어노테이션
	@Autowired SMemberService sMemberService;
	
	@RequestMapping(value = "/selectMemberList", method = RequestMethod.GET)
	public String selectMemberList(@RequestParam(required=false) String type, @RequestParam(required=false) String val, Locale locale, Model model) {
		ArrayList<HashMap<String,Object>> memberList = sMemberService.selectMemberList();
		model.addAttribute("memberList", memberList);
		return "sMemberList";
	}
}
