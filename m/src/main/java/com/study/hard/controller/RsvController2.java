package com.study.hard.controller;

import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.hard.service.RsvService;

/**
 * Handles requests for the application home page.
 */
@RestController /* 데이터만 주고받음 */
public class RsvController2 {

	@Autowired
	RsvService rsvService;

	
	@RequestMapping(value = "/updateInfo", method = RequestMethod.GET)
	public void rsvUpdateInfo(@RequestParam String rsvNo, @RequestParam String name, @RequestParam String rsvDt,
			@RequestParam(required = false, defaultValue = "") String rsvTm,
			@RequestParam(required = false, defaultValue = "") String rsvHr,
			@RequestParam(required = false, defaultValue = "") String contact,
			@RequestParam(required = false, defaultValue = "") String headCnt,
			@RequestParam(required = false, defaultValue = "") String remark,Locale locale, Model model) {

		// 전달받은 값들을 맵에 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rsvNo", rsvNo);
		map.put("name", name);
		map.put("rsvDt", rsvDt);
		map.put("rsvTm", rsvTm);
		map.put("rsvHr", rsvHr);
		map.put("contact", contact);
		map.put("headCnt", headCnt);
		map.put("remark", remark);

		// 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출
		rsvService.updateInfo(map);
		
	}
	/* url은 겹치면안됨 */
	
	@RequestMapping(value = "/selectRsvStat", method = RequestMethod.GET)
	public HashMap<String, Object> selectRsvStat(@RequestParam String rsvNo,Locale locale, Model model) {
		/* 행 1개, 컬럼 2개 니깐 HashMap 
		 * 행 2개, 컬럼 2개 이상이면 ArrayList*/ 

		// 전달받은 값들을 맵에 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rsvNo", rsvNo);
	

		// 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출
		HashMap<String, Object> result = rsvService.selectRsvStat(map);
		return result;
		
		/* 예약번호를 조회해서 상태를갖고옴 */
		
	}
	

}
