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

import com.study.hard.service.RsvService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RsvController {

	@Autowired
	RsvService rsvService;
	
	/* 완성된 화면이라서 String 리턴되는 값이 화면 파일명이라서.
	 * 파일명 소스에다가 모델 어트리뷰트해서 넣어주니깐  */
 
	@RequestMapping(value = "/rsvList", method = RequestMethod.GET)
	public String rsvList(@RequestParam(required = false, defaultValue = "") String name,
			/* 동적쿼리는 값이 있을수도 있고 없을 수도 있으니깐 required=false를 넣어줘야된다. */
			@RequestParam(required = false, defaultValue = "") String chk, Locale locale, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		/*
		 * 맵에 넣는 이유가 ArrayList로 하면 매게변수에 넣을때마다 바꿔줘야 되니깐(번거롭기때문에) ex)
		 * rsvService.selectRsvList(name,chk,txt1,txt2..);
		 */
		map.put("name", name);
		map.put("chk", chk);

		ArrayList<HashMap<String, Object>> list = rsvService.selectRsvList(map);
		/* 리턴값()이 있어야 받아온다. */
		
		model.addAttribute("list", list); 
		/* "화면에서들어갈 이름" "값" */
 		model.addAttribute("map", map);
		return "rsvList";
	}

	@RequestMapping(value = "/rsvDetail", method = RequestMethod.GET)
	public String rsvDetail(@RequestParam String rsvNo, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rsvNo", rsvNo);
		HashMap<String, Object> map2 = rsvService.selectRsvDetail(map);
		model.addAttribute("map", map2);
		return "rsvDetail";
	}

	@RequestMapping(value = "/rsvUpdate", method = RequestMethod.GET) /* 상태만 업데이트하는것 */
	public String rsvUpdate(@RequestParam String rsvNo, @RequestParam String stat,
			@RequestParam(required = false, defaultValue = "") String fee, Locale locale, Model model) {
		/* fee는 같이쓰지만 취소할때만 들어가서 */

		// 전달받은 값들을 맵에 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		/* key로 조회했으니깐 (한줄 조회)                                                                       arrayList가 아니다. */ 
		map.put("rsvNo", rsvNo);
		map.put("stat", stat);
		map.put("fee", fee);

		// 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출
		rsvService.update(map);

		// 저장 후 상세화면 url 호출하면서 no를 넘겨줌
		return "redirect:/rsvDetail?rsvNo=" + rsvNo;
	}

}
