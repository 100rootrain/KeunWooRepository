package com.study.hard.controller;

import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.hard.service.LoginService;
import com.study.hard.util.Sha256Enc;
import com.study.hard.vo.LoginVO;

/**
 * Handles requests for the application home page.
 */
@RestController
public class LoginController2 {
	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/getLoginInfo", method = RequestMethod.GET)
	public HashMap<String, Object> getLoginInfo(@RequestParam String userId, @RequestParam String userPw, Locale locale,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", Sha256Enc.encrypt(userPw));
		HashMap<String, Object> result = loginService.getLoginInfo(map);
		return result;
	}

	@RequestMapping(value = "/insertUserInfo", method = RequestMethod.POST)
	public void insertUserInfo(
			/* MAP방식 */

			/*
			 * @RequestParam String userId, @RequestParam String userPw, @RequestParam
			 * String userNm,
			 * 
			 * @RequestParam(required = false) String gndrCd, @RequestParam(required =
			 * false) String rankCd, @RequestParam(required = false) String deptCd,
			 * 
			 * @RequestParam(required = false) String birth,
			 */

			/* VO 방식 */

			@ModelAttribute LoginVO loginVO, Locale locale, Model model) {
		/*
		 * MAP방식 HashMap<String, Object> map = new HashMap<String, Object>();
		 * map.put("userId", userId); map.put("userPw", userPw); map.put("userNm",
		 * userNm); map.put("gndrCd", gndrCd); map.put("rankCd", rankCd);
		 * map.put("deptCd", deptCd); map.put("birth", birth);
		 * loginService.insertUserInfo(map);
		 * 
		 */
		System.out.println(loginVO);
		loginService.insertUserInfo(loginVO);

	}



	@RequestMapping(value = "/updatePw", method = RequestMethod.GET) // 비밀번호 update
	public void updatePw(@RequestParam String userId, @RequestParam String userPwChange, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(userId);
		System.out.println(userPwChange);
		map.put("userId", userId);
		map.put("userPwChange", Sha256Enc.encrypt(userPwChange));

		loginService.updatePw(map);
	}

	@RequestMapping(value = "/getPwInfo", method = RequestMethod.GET) // 현재 비밀번호 정보 갖고오기
	public String getPwInfo(@RequestParam String userId, @RequestParam String userPw, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(userId);
		System.out.println(userPw);
		map.put("userId", userId);
		map.put("userPw", Sha256Enc.encrypt(userPw));

		String pwInfo = loginService.getPwInfo(map);
		return pwInfo;
	}

	@RequestMapping(value = "/getAccountInfo", method = RequestMethod.GET)
	public HashMap<String, Object> getAccountInfo(@RequestParam String userId,
			@RequestParam(required = false, defaultValue = "") String reference, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("reference", reference);
		HashMap<String, Object> result = loginService.getAccountInfo(map);
		return result;
	}

}