package com.study.hard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.hard.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		return "loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam String userNm, @RequestParam String userId, HttpServletRequest request,
			Locale locale, Model model) {
		System.out.println("로그인됨");
		System.out.println(userId);

		HttpSession session = request.getSession(); // 화면에서 넘어온 요청정보에서 세션을 가져옴
		session.setAttribute("로그인", "O"); // 세션에 내가 원하는 값을 넣어줌
		session.setAttribute("userNm", userNm);
		session.setMaxInactiveInterval(60 * 60); // 세션만료60분 설정

		// TB_USER 테이블의 LAST_LOGIN_DATE를 현재시간으로 업데이트(update는 return x)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		loginService.getLastLoginDate(map);
		return "redirect:/bkList?userId=" + userId;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Locale locale, Model model) {
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 제거
		return "redirect:/loginForm"; // 로그아웃 후 이동할 페이지
	}

	@RequestMapping(value = "/newInfo", method = RequestMethod.GET)
	public String newInfo(@RequestParam String a, @RequestParam String b, Locale locale, Model model) {
		ArrayList<HashMap<String, Object>> rankList = loginService.getRankList();
		ArrayList<HashMap<String, Object>> deptList = loginService.getDeptList();
		ArrayList<HashMap<String, Object>> gndrList = loginService.getGenderList();

		model.addAttribute("rankList", rankList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("gndrList", gndrList);
		model.addAttribute("a", a);
		model.addAttribute("b", b);

		return "newInfo";
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(@RequestParam String userId, Locale locale, Model model) {
		model.addAttribute("userId", userId);
		
		System.out.println("myPage userId : " + userId);
		
		return "myPage";
	}
	
	@RequestMapping(value = "/idList", method = RequestMethod.GET)

	   public String idList(Locale locale, Model model) {
		
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      ArrayList<HashMap<String, Object>> idList = loginService.getIdList(map);
	      model.addAttribute("idList", idList);

	      return "idList";

	   }
	

}