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

import com.study.hard.service.BoardService;
import com.study.hard.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(required = false, defaultValue = "") String val,
			@RequestParam(required = false, defaultValue = "") String regUser,
			@RequestParam(required = false, defaultValue = "") String start,
			@RequestParam(required = false, defaultValue = "") String end,
			@RequestParam(required = false, defaultValue = "1") String page,
			@RequestParam(required = false, defaultValue = "3") String rows, Locale locale, Model model) {
		System.out.println(regUser + " // " + regUser);
		String[] arr = regUser.split(",");
		String x = "a , b , c";
		x.split(","); // {"a ", " b ", " c"} 문자열을 파라미터로 잘라서 배열로 만들어줌, 공백도 포함

		String a = " a a ";
		a = a.trim(); // "a a"; 문자열 양쪽의 공백을 없앰

		String b = " b b ";
		b.replace("  ", ""); // "bb" //문자열 중 첫번째 파라미터에 해당하는 부분을 두번째 파라미터로 바꿔줌

		for (int i = 0; i < arr.length; i++) {
			System.out.println("regUser[" + i + "] : " + arr[i]);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("val", val);
		map.put("regUser", regUser);
		map.put("arr", arr);
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("rows", rows);
		ArrayList<BoardVO> list = boardService.selectBoardList(map);

		// 페이징을 위해서 해당 조건으로 조회된 행의 전체 갯수가 필요함
		int cnt = boardService.selectBoardListCount(map);

		model.addAttribute("list", list);
		model.addAttribute("val", val);
		model.addAttribute("regUser", regUser);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("cnt", cnt);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		return "home";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam String no, Locale locale, Model model) {
		BoardVO map = boardService.selectBoardDetail(no);
		model.addAttribute("map", map);/* 데이터 */
		return "detail"; /* 화면 */
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Locale locale, Model model) {
		return "input";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(@RequestParam String title, @RequestParam String contents, Locale locale, Model model) {

		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContents(contents);

		boardService.insertBoard(vo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardVO> list = boardService.selectBoardList(map);
		model.addAttribute("list", list);

		return "home";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam String no, Locale locale, Model model) {
		boardService.deleteBoard(no);

		return "redirect:/list";
	}

	@RequestMapping(value = "/goModify", method = RequestMethod.GET)
	public String goModify(@RequestParam String no, Locale locale, Model model) {
		BoardVO map = boardService.selectBoardDetail(no);
		model.addAttribute("map", map);
		return "modify";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam String no, @RequestParam String title, @RequestParam String regUser,
			@RequestParam String contents, Locale locale, Model model) {
		// 전달받은 데이터 확인
		System.out.println(no);
		System.out.println(title);
		System.out.println(contents);
		System.out.println(regUser);

		// 전달받은 값들을 맵에 넣어줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("title", title);
		map.put("contents", contents);
		map.put("regUser", regUser);

		// 전달받은 데이터가 담긴 맵으로 서비스 메서드 호출
		boardService.update(map);

		// 저장 후 상세화면 url 호출하면서 no를 넘겨줌
		return "redirect:/detail?no=" + no;
	}

	@RequestMapping(value = "/rest", method = RequestMethod.GET)
	public String rest(Locale locale, Model model) {
		return "rest";
	}

	@RequestMapping(value = "/webeditor", method = RequestMethod.GET)
	public String webeditor(Locale locale, Model model) {
		return "webeditor";
	}

	@RequestMapping(value = "/translate", method = RequestMethod.GET)
	public String translate(Locale locale, Model model) {

		ArrayList<HashMap<String, Object>> languageList = boardService.getLanguageList();
		model.addAttribute("languageList", languageList);

		return "translate";
	}


	@RequestMapping(value = "/Calendar2", method = RequestMethod.GET)
	public String Calendar2(Locale locale, Model model) {

		return "Calendar2";
	}



	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Locale locale, Model model) {

		return "chart";
	}


	@RequestMapping(value = "/fileTransfer", method = RequestMethod.GET)
	public String fileTransfer(Locale locale, Model model) {
		return "fileTransfer";
	}

	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	public String fileDownload(Locale locale, Model model) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<HashMap<String, Object>> list = boardService.getFile(map);
		model.addAttribute("list", list);

		return "fileDownload";
	}
}
