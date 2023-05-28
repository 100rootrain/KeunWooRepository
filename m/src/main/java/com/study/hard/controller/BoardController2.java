package com.study.hard.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.hard.service.BoardService;
import com.study.hard.service.SMemberService;

/**
 * Handles requests for the application home page.
 */
@RestController /* 데이터통신 */
public class BoardController2 {

	@Autowired
	SMemberService sMemberService;

	@Autowired
	BoardService boardService;

	@RequestMapping("/list2")
	public ArrayList<HashMap<String, Object>> list2(@RequestParam(required = false) String type,
			@RequestParam(required = false) String txt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> memberList = sMemberService.selectMemberList();
		return memberList;
	}

	@RequestMapping(value = "/getPopulationInfo", method = RequestMethod.GET)
	public HashMap<String, Object> getPopulationInfo(@RequestParam String stationName) throws Exception {

		// url과 파라미터를 조합하여 호출할 url 문자열 생성
		StringBuilder urlBuilder = new StringBuilder("http://kosis.kr/openapi/Data/statisticsList.do"); /* URL */
		
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=서비스키"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("vwCd", "UTF-8") + "=" + URLEncoder.encode("MT_ZTITLE",
				"UTF-8")); /*
							 * 서비스뷰 코드 · MT_ZTITLE : 주제별 통계 · MT_OTITLE : 기관별 통계 · MT_CHOSUN_TITLE : 광복이전통계
							 * (1908~1943) · MT_HANKUK_TITLE : 대한민국통계연감 · MT_STOP_TITLE : 작성중지통계 ·
							 * MT_ATITLE01 : 지역통계 (주제별) · MT_ATITLE02 : 지역통계 (기관별) · MT_GTITLE01 :
							 * e-지방지표(주제별) · MT_ETITLE : 영문KOSIS
							 */
		urlBuilder.append(
				"&" + URLEncoder.encode("parentListId", "UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /* 시작목록 ID */
		urlBuilder.append(
				"&" + URLEncoder.encode("format", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 결과 유형 */
		urlBuilder.append(
				"&" + URLEncoder.encode("method", "UTF-8") + "=" + URLEncoder.encode("getList", "UTF-8")); /* 호출메서드 */
		urlBuilder.append("&" + URLEncoder.encode("jsonVD", "UTF-8") + "="
				+ URLEncoder.encode("Y", "UTF-8")); /* JSON 키값 쌍따옴표 유무 */

		// ▼ API 호출 시작 ▼
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		// ▲ API 호출 종료 ▲
		System.out.println("API 호출 결과 : " + sb); // API에서 반환받은 값(문자열)

		// API에서 돌려받은 값을 해시맵으로 변환
		HashMap<String, Object> map = new ObjectMapper().readValue(sb.toString(), HashMap.class);
		return map;
	}



	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public ArrayList<HashMap<String, String>> uploadFile(MultipartHttpServletRequest request) throws Exception {

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

				boardService.saveFileInfo(fileMap);

			} catch (Exception e) {
				System.out.println("업로드 오류");
			}
			// DB에 넣어준 파일 정보를 화면으로 반환할 리스트에 담음
			fileList.add(fileMap);
		}
		return fileList;
	}

	@RequestMapping("/downloadFile")
	public void downloadFile(@RequestParam String fileTempName, HttpServletRequest request,
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

		String fileOrgName = boardService.getFileOrgName(fileMap);
		System.out.println("다운로드 파일명 : " + fileOrgName);

		try {
			String path = "C:\\uploadFile\\" + fileTempName; // 파일 업로드 경로 + 임시파일명 = 서버에 저장된 파일 경로

			// 임시파일명으로 원래 파일명 조회해서 원래 파일명으로 다운되도록 함
			File file = new File(path); // 파일 경로의 파일을 가져와 파일 객체 생성

			int bytes = (int) file.length(); // 파일의 크기

			// 응답 헤더 정보 생성
			response.setHeader("Content-Disposition",
					"attachment;filename=" + boardService.getFileNm(browser, fileOrgName /* 원래 파일명 */)); // 파일명이 한글인 경우
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

}
