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
public class BkController {

	@Autowired
	BkService bkService;

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/bkList", method = RequestMethod.GET)
	public String bkList(@RequestParam(required = false) String type, @RequestParam(required = false) String txt,
			@RequestParam String userId, Locale locale, Model model) {
		// 데이터를 조회해서 화면에 넣어줌 = model.addAttribute
		// 서비스에서 목록 조회 메서드 실행
		System.out.println("bkList type : " + type);
		System.out.println("bkList txt : " + txt);
		System.out.println("bkList : " + userId);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("txt", txt);

		ArrayList<HashMap<String, Object>> list = bkService.getAccountList(map);
		model.addAttribute("list", list);
		model.addAttribute("userId", userId);// bkList -> myPage userId를 넘겨줘야 되기 때문에.

		return "bkList";
	}

	@RequestMapping(value = "/bkDetail", method = RequestMethod.GET)
	public String bkDetail(@RequestParam String accntId, @RequestParam String userId, Locale locale, Model model) {
		// 데이터를 조회해서 화면에 넣어줌 = model.addAttribute
		// 서비스에서 목록 조회 메서드 실행
		System.out.println("bkDetail accntId : " + accntId);
		System.out.println("bkDetail userId : " + userId);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accntId", accntId);

		HashMap<String, Object> result = bkService.getAccountDetail(map);
		ArrayList<HashMap<String, Object>> bankList = bkService.getBankList(); /* 파라미터가 없는이유 : 셀렉트박스 값을 모두 가져와야되기 때문에 */
		model.addAttribute("result", result);
		model.addAttribute("bankList", bankList);
		model.addAttribute("userId", userId);
		model.addAttribute("accntId", accntId);
		return "bkDetail";
	}

	@RequestMapping(value = "/bkDelete", method = RequestMethod.GET)
	public String bkDelete(@RequestParam String accntId, @RequestParam String userId, Locale locale, Model model) {
		// 데이터를 조회해서 화면에 넣어줌 = model.addAttribute
		// 서비스에서 목록 조회 메서드 실행
		System.out.println("accntId : " + accntId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accntId", accntId);

		model.addAttribute("userId", userId);

		bkService.deleteAccountInfo(map);

		return "redirect:/bkList";
	}

	/*
	 * @RequestMapping(value = "/bkUpdate", method = RequestMethod.GET) public
	 * String bkUpdate(@RequestParam String accntId, @RequestParam String
	 * bankCd, @RequestParam String userId,
	 * 
	 * @RequestParam String accntNo, Locale locale, Model model) { // 전달받은 데이터 확인
	 * System.out.println(accntId); System.out.println(bankCd);
	 * System.out.println(accntNo);
	 * 
	 * // 전달받은 값들을 맵에 넣어줌 HashMap<String, Object> map = new HashMap<String,
	 * Object>(); map.put("accntId", accntId); map.put("bankCd", bankCd);
	 * map.put("accntNo", accntNo);
	 * 
	 * // 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출 bkService.bkUpdate(map);
	 * 
	 * model.addAttribute("userId", userId);
	 * 
	 * // 저장 후 상세화면 url 호출하면서 no를 넘겨줌 return "redirect:/bkList"; }
	 */

	@RequestMapping(value = "/bkNew", method = RequestMethod.GET)

	public String bkNew(@RequestParam String userId, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		HashMap<String, Object> result = bkService.getAccountDetail(map);
		ArrayList<HashMap<String, Object>> bankList = bkService.getBankList();
		model.addAttribute("result", result);
		model.addAttribute("bankList", bankList);
		model.addAttribute("userId", userId);

		return "bkNew";

	}

	@RequestMapping(value = "/ChangeAccntPw", method = RequestMethod.GET)
	public String ChangeAccntPw(@RequestParam String userId, @RequestParam String accntId, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accntId", accntId);

		HashMap<String, Object> result = bkService.getAccountDetail(map);

		model.addAttribute("userId", userId);
		model.addAttribute("result", result);
		return "ChangeAccntPw";
	}

	@RequestMapping(value = "/remit", method = RequestMethod.GET)
	public String remit(@RequestParam String userId, Locale locale, Model model) {
		// 데이터를 조회해서 화면에 넣어줌 = model.addAttribute
		// 서비스에서 목록 조회 메서드

		HashMap<String, Object> map = new HashMap<String, Object>();

		HashMap<String, Object> result = bkService.getAccountDetail(map);
		ArrayList<HashMap<String, Object>> bankAccountList = bkService.getBankAccountList();
		/* 파라미터가 없는이유 : 셀렉트박스 값을 모두 가져와야되기 때문에 */
		model.addAttribute("result", result);
		model.addAttribute("bankAccountList", bankAccountList);
		model.addAttribute("userId", userId);

		return "remit";
	}

	@RequestMapping(value = "/withdrawResult", method = RequestMethod.GET) // 출금완료 화면
	public String withdrawResult(@RequestParam String accntId, @RequestParam String userId, Locale locale,
			Model model) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accntId", accntId);
		map.put("userId", userId);

		System.out.println("출금계좌ID : " + accntId);
		System.out.println("USER_ID : " + userId);

		HashMap<String, Object> result = bkService.getWithdrawResult(map);
		model.addAttribute("result", result);
		model.addAttribute("userId", userId);
		model.addAttribute("accntId", accntId);

		return "withdrawResult";
	}
	
	@RequestMapping(value = "/bankStatements", method = RequestMethod.GET)
	public String bankStatements(@RequestParam String userId, Locale locale, Model model) {
		// 데이터를 조회해서 화면에 넣어줌 = model.addAttribute
		// 서비스에서 목록 조회 메서드 실행
		System.out.println("bankStatements userId : " + userId);

		HashMap<String, Object> map = new HashMap<String, Object>();

		HashMap<String, Object> result = bkService.getAccountDetail(map);
		ArrayList<HashMap<String, Object>> bankAccountList = bkService.getBankAccountList();
		/* 파라미터가 없는이유 : 셀렉트박스 값을 모두 가져와야되기 때문에 */
		model.addAttribute("result", result);
		model.addAttribute("bankAccountList", bankAccountList);
		model.addAttribute("userId", userId);

		return "bankStatements";
	}
	

	@RequestMapping(value = "/ajax3", method = RequestMethod.GET) // MERGE INTO 연습용화면
	public String insertUserList(Locale locale, Model model) {
		return "ajax3";
	}
	
	

	

}