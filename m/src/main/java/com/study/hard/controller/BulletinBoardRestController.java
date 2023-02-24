package com.study.hard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.hard.service.BulletinBoardService;
import com.study.hard.util.Sha256Enc;

/**
 * Handles requests for the application home page.
 */
@RestController /* 데이터통신 */
public class BulletinBoardRestController {

	@Autowired
	BulletinBoardService bulletinBoardService;

	@RequestMapping(value = "/bullentinBoardInsert", method = RequestMethod.POST) // 게시판 Contents 등록
	public void bullentinBoardInsert(@RequestParam String no, @RequestParam String title,
			@RequestParam(required = false) String contents, @RequestParam String regUser,
			@RequestParam String password, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("title", title);
		map.put("contents", contents);
		map.put("regUser", regUser);
		map.put("password", Sha256Enc.encrypt(password));
		bulletinBoardService.bullentinBoardInsert(map);
	}

	@RequestMapping(value = "/getBulletinBoardList", method = RequestMethod.GET) // 게시판 '목록' & '페이징'
	public HashMap<String, Object> bulletinBoardList(@RequestParam(required = false, defaultValue = "제목") String type,
			@RequestParam(required = false, defaultValue = "") String txt,
			@RequestParam(required = false, defaultValue = "") String start,
			@RequestParam(required = false, defaultValue = "") String end,
			@RequestParam(required = false, defaultValue = "1") String page,
			@RequestParam(required = false, defaultValue = "3") String rows, Locale locale, Model model) {

		String[] arr = txt.split(",");
		String x = "a , b , c";
		x.split(","); // {"a ", " b ", " c"} 문자열을 파라미터로 잘라서 배열로 만들어줌, 공백도 포함

		String a = " a a ";
		a = a.trim(); // "a a"; 문자열 양쪽의 공백을 없앰

		String b = " b b ";
		b.replace("  ", ""); // "bb" //문자열 중 첫번째 파라미터에 해당하는 부분을 두번째 파라미터로 바꿔줌

		for (int i = 0; i < arr.length; i++) {
			System.out.println("txt[" + i + "] : " + arr[i]);
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("txt", txt);
		map.put("arr", arr);
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("rows", rows);
		ArrayList<HashMap<String, Object>> bulletinBoardList = bulletinBoardService.getBulletinBoardList(map); // 게시판
																												// 목록조회
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("bulletinBoardList", bulletinBoardList);

		int cnt = bulletinBoardService.selectBulletinBoardListCount(map);
		map2.put("type", type);
		map2.put("txt", txt);
		map2.put("start", start);
		map2.put("end", end);
		map2.put("cnt", cnt);
		map2.put("page", page);
		map2.put("rows", rows);

		System.out.println("Rest getBulletinBoardList  type :" + type);
		System.out.println("Rest getBulletinBoardList  txt :" + txt);
		System.out.println("Rest getBulletinBoardList  start :" + start);
		System.out.println("Rest getBulletinBoardList  end :" + end);
		System.out.println("Rest getBulletinBoardList  cnt : " + cnt);
		System.out.println("Rest getBulletinBoardList  page : " + page);
		System.out.println("Rest getBulletinBoardList  rows :" + rows);

		return map2;
		// 맵 안에 리스트
		// 리턴은 하나밖에못하니깐 주머니(map)안에 내가보내고싶은거 다보냄
	}

	@RequestMapping(value = "/bulletinBoardFileUpload", method = RequestMethod.POST) // 첨부파일 업로드
	public ArrayList<HashMap<String, String>> bulletinBoardFileUpload(MultipartHttpServletRequest request)
			throws Exception {

		String path = "C:\\uploadFile\\"; // 파일을 업로드할 경로
		String uploadFileName; // 파일 태그 내 name 값
		String fileOrgName; // 업로드한 파일명

		MultipartFile uploadFile; // 업로드한 파일을 담을 파일 객체
		ArrayList<HashMap<String, String>> fileList = new ArrayList<HashMap<String, String>>(); // 리턴할 파일명 목록 리스트
		HashMap<String, String> fileMap = null; // 리턴할 파일정보

		Iterator<String> iterator = request.getFileNames(); // 화면에서 넘어온 파일(목록)을 조회해서 배열(=Iterator, ArrayList와 비슷한 구조)에
															// 넣어줌
		while (iterator.hasNext()) {// 넘어온 파일 갯수만큼 반복
			uploadFileName = iterator.next(); // 작업할 파일 선택
			uploadFile = request.getFile(uploadFileName); // 파일 객체에 선택한 파일 넣어줌
			fileOrgName = uploadFile.getOriginalFilename(); // 파일의 원래 이름을 가져옴
			String fileTempNm = UUID.randomUUID().toString(); // 파일 덮어쓰기 방지용 임시 파일명 생성

			System.out.println("fileOrgName : " + fileOrgName); // 원래 파일명
			System.out.println("fileTempNm : " + fileTempNm); // 임시 파일명

			try {
				uploadFile.transferTo(new File(path + fileTempNm)); // 설정된 경로에 임시 파일명으로 저장

				// 파일정보를 DB에 저장
				fileMap = new HashMap<String, String>();
				fileMap.put("fileOrgName", fileOrgName);
				fileMap.put("fileTempNm", fileTempNm);

				bulletinBoardService.saveBulletinBoardFileInfo(fileMap);

			} catch (Exception e) {
				System.out.println("업로드 오류");
			}
			// DB에 넣어준 파일 정보를 화면으로 반환할 리스트에 담음
			fileList.add(fileMap);
		}
		return fileList;
	}

	@RequestMapping("/bulletinBoardFileDownload")
	public void bulletinBoardFileDownload(@RequestParam String fileTempName, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String browser = ""; // 사용자 브라우저명을 담을 문자열
		String userAgent = request.getHeader("User-Agent"); // 클라이언트에서 보낸 요청이 어느 브라우저인지 확인(=브라우저마다 한글 처리 방식이 달라서 그럼)
		if (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1 || userAgent.indexOf("Edge") > -1) {
			browser = "MSIE";
		} else if (userAgent.indexOf("Chrome") > -1) {
			browser = "Chrome";
		} else if (userAgent.indexOf("Opera") > -1) {
			browser = "Opera";
		} else if (userAgent.indexOf("Safari") > -1) {
			browser = "Safari";
		} else if (userAgent.indexOf("Firefox") > -1) {
			browser = "Firefox";
		} else {
			browser = null;
		}

		System.out.println("브라우저는 " + browser); // 사용자의 브라우저 정보

		// 화면에서 넘어온 임시 파일명으로 원래 파일명 조회
		HashMap<String, String> fileMap = new HashMap<String, String>();
		fileMap.put("fileTempName", fileTempName);

		String fileOrgName = bulletinBoardService.getBulletinBoardFileOrgName(fileMap);
		System.out.println("다운로드 파일명 : " + fileOrgName);

		try {
			String path = "C:\\uploadFile\\" + fileTempName; // 파일 업로드 경로 + 임시파일명 = 서버에 저장된 파일 경로

			// 임시파일명으로 원래 파일명 조회해서 원래 파일명으로 다운되도록 함
			File file = new File(path); // 파일 경로의 파일을 가져와 파일 객체 생성

			int bytes = (int) file.length(); // 파일의 크기

			// 응답 헤더 정보 생성
			response.setHeader("Content-Disposition", "attachment;filename="
					+ bulletinBoardService.getBulletinBoardFileNm(browser, fileOrgName /* 원래 파일명 */)); // 파일명이 한글인 경우
			// 사용자의
			// 브라우저에 따라
			// 인코딩해줌
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");
			response.setContentType("application/download; UTF-8");
			response.setContentLength(bytes);

			FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기
			OutputStream out = response.getOutputStream();

			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream(출력)에 보내줌, -1이 나오면 더이상
																	// 읽을게 없으므로 종료
				out.write(buffer, 0, read);
			}

		} catch (Exception e) {
			throw new Exception("다운로드 오류");
		}
	}

	@RequestMapping(value = "/getBullentinBoardPwChk", method = RequestMethod.GET) /*
																					 * 현재 비밀번호 일치여부 확인 , 수정 전 비밀번호 입력
																					 * 화면에서 씀
																					 */
	public HashMap<String, Object> getBullentinBoardPwChk(@RequestParam String no, @RequestParam String password,
			Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("password", Sha256Enc.encrypt(password));

		System.out.println("bulletinBoard_Modify : " + no);
		System.out.println("bulletinBoard_Modify : " + Sha256Enc.encrypt(password));

		HashMap<String, Object> bulletinBoard_Modify_Result = bulletinBoardService.getBullentinBoardPwChk(map);
		return bulletinBoard_Modify_Result;
	}

	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)

	public void deleteFile(@RequestParam String fileNm, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileNm", fileNm);

		bulletinBoardService.deleteFile(map);

		File file = new File("C:\\uploadFile\\" + fileNm);
		if (file.exists()) { // 해당 경로에 파일이 있는지 체크
			if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}

		}

	}

}
