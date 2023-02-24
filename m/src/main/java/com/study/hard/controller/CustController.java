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

import com.study.hard.service.CustService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CustController {

	@Autowired
	CustService custService;

	@RequestMapping(value = "/custList", method = RequestMethod.GET)

	public String input(@RequestParam(required = false, defaultValue = "") String txt, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("txt", txt);

		ArrayList<HashMap<String, Object>> list = custService.selectCustList(map);

		model.addAttribute("list", list);
		model.addAttribute("txt", txt);
		return "custList";

	}

	@RequestMapping(value = "/custDetail", method = RequestMethod.GET)

	public String custDetail(@RequestParam String custNo, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", custNo);

		HashMap<String, Object> custDetail = custService.selectCustDetail(map);
		model.addAttribute("custDetail", custDetail);
		return "custDetail";

	}

	@RequestMapping(value = "/custDelete", method = RequestMethod.GET)

	public String custDelete(@RequestParam String custNo, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", custNo);

		custService.custDelete(map); /* CUD는 리턴값없다. void */
		return "redirect:/custList"; /* 삭제하고 목록URL호출 */

	}

	@RequestMapping(value = "/custNew", method = RequestMethod.GET)

	public String custNew(Locale locale, Model model) {
		return "custNew";

	}

	@RequestMapping(value = "/custInsert", method = RequestMethod.GET)

	public String custInsert(@RequestParam String name, @RequestParam(required = false, defaultValue = "") String birth,
			@RequestParam(required = false, defaultValue = "") String contact,
			@RequestParam(required = false, defaultValue = "") String address, Locale locale, Model model)
	/* 등록할때 custNo이 안넘어가니깐 필요없다. */{
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("name", name);
		map.put("birth", birth);
		map.put("contact", contact);
		map.put("address", address);
		custService.custInsert(map); /* CUD는 리턴값없다. void */
		return "redirect:/custList"; /* 삽입하고 목록URL호출 */

	}

	@RequestMapping(value = "/custModifyForm", method = RequestMethod.GET)
	public String custModifyForm(@RequestParam String custNo, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", custNo);
		/* DB에들어가는값 */

		HashMap<String, Object> custDetail = custService.selectCustDetail(map);
		/* 조회해서나가는값 */
		model.addAttribute("custDetail", custDetail);
		return "custModify";
	}

	@RequestMapping(value = "/custUpdate", method = RequestMethod.GET)
	public String custUpdate(@RequestParam String custNo, @RequestParam String name, @RequestParam String birth,
			@RequestParam(required = false, defaultValue = "") String contact,
			@RequestParam(required = false, defaultValue = "") String address, Locale locale, Model model) {
		// 전달받은 데이터 확인
		System.out.println(custNo);
		System.out.println(name);
		System.out.println(birth);
		System.out.println(contact);
		System.out.println(address);

		// 전달받은 값들을 맵에 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", custNo);
		map.put("name", name);
		map.put("birth", birth);
		map.put("contact", contact);
		map.put("address", address);

		// 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출
		custService.custUpdate(map);

		// 저장 후 상세화면 url 호출하면서 no를 넘겨줌
		return "redirect:/custDetail?custNo=" + custNo;
	}

}
