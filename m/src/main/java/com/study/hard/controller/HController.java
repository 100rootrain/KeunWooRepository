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

import com.study.hard.service.HService;
import com.study.hard.vo.HVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HController {

	@Autowired
	HService hService;

	@RequestMapping(value = "/hlist", method = RequestMethod.GET)
	public String hlist(@RequestParam(required = false, defaultValue = "") String id,
			@RequestParam(required = false, defaultValue = "") String name,
			@RequestParam(required = false, defaultValue = "") String grade,
			@RequestParam(required = false, defaultValue = "") String class1,
			@RequestParam(required = false, defaultValue = "") String no, Locale locale, Model model) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("garde", grade);
		map.put("class1", class1);
		map.put("no", no);

		ArrayList<HVO> hlist = hService.selectHList(map);
		model.addAttribute("hlist", hlist);
		return "hlist";
	}

	@RequestMapping(value = "/hdetail", method = RequestMethod.GET)
	public String hdetail(@RequestParam String id, Locale locale, Model model) {
		HVO map = hService.selectHDetail(id);
		model.addAttribute("map", map);
		return "hdetail";
	}

	@RequestMapping(value = "/hModify", method = RequestMethod.GET)
	public String hModify(@RequestParam String id, Locale locale, Model model) {
		HVO map = hService.selectHDetail(id);
		model.addAttribute("map", map);
		return "hmodify";
	}

	@RequestMapping(value = "/hupdate", method = RequestMethod.GET)
	public String hupdate(@RequestParam String name, @RequestParam String ssn1, @RequestParam String email,
			@RequestParam String contact1, @RequestParam String contact2, @RequestParam String contact3,
			@RequestParam String address, @RequestParam String school1, @RequestParam String school2,
			@RequestParam String school3, @RequestParam String grade, @RequestParam String class1,
			@RequestParam String no, @RequestParam(required = false) String resignDate, @RequestParam String remark,
			@RequestParam String id, @RequestParam String gender,

			Locale locale, Model model) {
		// 전달받은 데이터 확인
		System.out.println(name);
		System.out.println(ssn1);
		System.out.println(grade);
		System.out.println(no);

		// 전달받은 값들을 맵에 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("ssn1", ssn1);
		map.put("email", email);
		map.put("contact1", contact1);
		map.put("contact2", contact2);
		map.put("contact3", contact3);
		map.put("address", address);
		map.put("school1", school1);
		map.put("school2", school2);
		map.put("school3", school3);
		map.put("grade", grade);
		map.put("class1", class1);
		map.put("no", no);
		map.put("resignDate", resignDate);
		map.put("remark", remark);
		map.put("id", id);
		map.put("gender", gender);

		// 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출
		hService.hupdate(map);

		// 저장 후 상세화면 url 호출하면서 no를 넘겨줌
		return "redirect:/hdetail?id=" + id;
	}

	@RequestMapping(value = "/hinsert", method = RequestMethod.GET)
	public String hinsert(Locale locale, Model model) {
		return "hinsert";
	}

	@RequestMapping(value = "/hinsert1", method = RequestMethod.GET)
	public String hinsert1(@RequestParam String name, @RequestParam String ssn1, @RequestParam String email,
			@RequestParam String contact1, @RequestParam String contact2, @RequestParam String contact3,
			@RequestParam String address, @RequestParam String school1, @RequestParam String school2,
			@RequestParam String school3, @RequestParam String grade, @RequestParam String class1,
			@RequestParam String no, @RequestParam(required = false) String resignDate, @RequestParam String remark,
			@RequestParam String id, Locale locale, Model model) {

		HVO hvo = new HVO();
		hvo.setId(id);
		hvo.setName(name);
		hvo.setGrade(grade);
		hvo.setClass1(class1);
		hvo.setNo(no);
		hvo.setSsn(ssn1);
		hvo.setEmail(email);
		hvo.setContact1(contact1);
		hvo.setContact2(contact2);
		hvo.setContact3(contact3);
		hvo.setAddress(address);
		hvo.setSchool1(school1);
		hvo.setSchool2(school2);
		hvo.setSchool3(school3);
		hvo.setResignDate(resignDate);
		hvo.setRemark(remark);

		hService.hinsertBoard(hvo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HVO> hlist = hService.selectHList(map);
		model.addAttribute("hlist", hlist);

		return "redirect:/hlist";
	}

	@RequestMapping(value = "/hdelete", method = RequestMethod.GET)
	public String hdelete(@RequestParam String id, Locale locale, Model model) {
		hService.hdeleteBoard(id);

		return "redirect:/hlist";
	}

}
