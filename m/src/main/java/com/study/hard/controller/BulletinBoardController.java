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

import com.study.hard.service.BulletinBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BulletinBoardController {

	@Autowired
	BulletinBoardService bulletinBoardService;

	@RequestMapping(value = "/bulletinBoard_List", method = RequestMethod.GET) // 게시물 목록화면
	public String bulletinBoard_List(Locale locale, Model model) {
		return "bulletinBoard_List";
	}

	@RequestMapping(value = "/bulletinBoard_New", method = RequestMethod.GET) // 게시물 등록화면

	public String bulletinBoard_New(Locale locale, Model model) {

		return "bulletinBoard_New";

	}

	@RequestMapping(value = "/bulletinBoard_Detail", method = RequestMethod.GET) // 게시판 상세

	public String bulletinBoard_Detail(@RequestParam String no, Locale locale, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		

		HashMap<String, Object> post_Detail = bulletinBoardService.getBulletinBoardDetail(map); //상세화면
		model.addAttribute("post_Detail", post_Detail);
		bulletinBoardService.getViewCount(map);
		// ArrayList<HashMap<String, Object>> -> post_Detail[0].값 으로 들어감

		
		ArrayList<HashMap<String, Object>> download_Temp_file = bulletinBoardService.getFile(map); // 파일 다운로드
		model.addAttribute("download_Temp_file", download_Temp_file);
		
		
		System.out.println("/bulletinBoard_Detail__no : " + no);
		System.out.println("bulletinBoard_Detail__HashMap<String, Object> post_Detail : " + post_Detail);
		System.out.println("bulletinBoard_Detail__ArrayList<HashMap<String, Object>> download_Temp_file : " + download_Temp_file);
		
		return "bulletinBoard_Detail";

	}

	@RequestMapping(value = "/bulletinBoard_Temp_Modify", method = RequestMethod.GET) // 비밀번호 입력화면

	public String bulletinBoard_Temp_Modify(@RequestParam String no, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);

		HashMap<String, Object> post_Temp = bulletinBoardService.getBulletinBoardDetail(map); // no를 넘겨주기위해서 (꼭필요함)
		model.addAttribute("post_Temp", post_Temp);

		ArrayList<HashMap<String, Object>> download_Temp_file = bulletinBoardService.getFile(map); // 파일 다운로드 (얘는 필요한지
																									// 안필요한지 잘모르겠음)
		model.addAttribute("download_Temp_file", download_Temp_file);

		return "bulletinBoard_Temp_Modify";

	}

	@RequestMapping(value = "/bulletinBoard_Modify", method = RequestMethod.GET) // 게시판 수정

	public String bulletinBoard_Modify(@RequestParam String no, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);

		HashMap<String, Object> post_Modify = bulletinBoardService.getBulletinBoardDetail(map);
		model.addAttribute("post_Modify", post_Modify);
		// ArrayList -> post_Detail[0].값 으로 들어감

		ArrayList<HashMap<String, Object>> download_Temp_file = bulletinBoardService.getFile(map); // 파일 다운로드
		model.addAttribute("download_Temp_file", download_Temp_file);
		return "bulletinBoard_Modify";

	}

	@RequestMapping(value = "/bulletinBoardDelete", method = RequestMethod.GET) // 게시판 수정

	public String bulletinBoardDelete(@RequestParam String no, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);

		bulletinBoardService.bulletinBoardDelete(map); // 게시글 삭제
		bulletinBoardService.bulletinFileDelete(map); // 파일 삭제

		return "redirect:/bulletinBoard_List";

	}

	@RequestMapping(value = "/bulletinBoard_Temp_Delete", method = RequestMethod.GET) // 게시판 수정 전(비밀번호 입력화면)

	public String bulletinBoard_Temp_Delete(@RequestParam String no, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);

		HashMap<String, Object> post_Delete = bulletinBoardService.getBulletinBoardDetail(map); // no을 이용해서 삭제하기위해
		model.addAttribute("post_Delete", post_Delete);

		return "bulletinBoard_Temp_Delete";

	}

	@RequestMapping(value = "/tableLayout", method = RequestMethod.GET) // 테이블 레이아웃 확인용
	public String tableLayout(Locale locale, Model model) {
		return "tableLayout";
	}

}
