package com.study.hard.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.BoardDAO;
import com.study.hard.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	BoardDAO boardDAO;

	public ArrayList<BoardVO> selectBoardList(HashMap<String, Object> map) {
		ArrayList<BoardVO> list = boardDAO.selectBoardList(map);
		return list;
	}

	public BoardVO selectBoardDetail(String no) {
		return boardDAO.selectBoardDetail(no);
	}

	public void insertBoard(BoardVO vo) {
		String regUser = "박경민";
		vo.setRegUser(regUser);
		boardDAO.insertBoard(vo);
	}

	public void deleteBoard(String no) {
		boardDAO.deleteBoard(no);
	}

	public void update(HashMap<String, Object> map) {
		boardDAO.update(map);
	}

	public int selectBoardListCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardListCount(map);
	}

	public ArrayList<HashMap<String, Object>> getLanguageList() {
		ArrayList<HashMap<String, Object>> list = boardDAO.getLanguageList();
		return list;
	}

	public ArrayList<HashMap<String, Object>> getCal(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = boardDAO.getCal(map);
		return list;
	}

	public void insertSch(HashMap<String, Object> map) {
		boardDAO.insertSch(map);
	}

	public void insertHoliday(HashMap<String, Object> map) {
		boardDAO.insertHoliday(map);
	}

	public ArrayList<HashMap<String, Object>> getChartData(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = boardDAO.getChartData(map);
		return list;

	}

	public ArrayList<HashMap<String, Object>> getHolidayChartData(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = boardDAO.getHolidayChartData(map);
		return list;
	}

	// 브라우저에 따른 한글 파일명 처리(화면과 통신하는 메서드가 아니므로 서비스에 위치)
	public String getFileNm(String browser, String fileNm) {
		String reFileNm = null;
		try {
			if (browser.equals("MSIE") || browser.equals("Trident") || browser.equals("Edge")) {
				reFileNm = URLEncoder.encode(fileNm, "UTF-8").replaceAll("\\+", "%20");
			} else {
				if (browser.equals("Chrome")) {
					StringBuffer sb = new StringBuffer();
					for (int i = 0; i < fileNm.length(); i++) {
						char c = fileNm.charAt(i);
						if (c > '~') {
							sb.append(URLEncoder.encode(Character.toString(c), "UTF-8"));
						} else {
							sb.append(c);
						}
					}
					reFileNm = sb.toString();
				} else {
					reFileNm = new String(fileNm.getBytes("UTF-8"), "ISO-8859-1");
				}
				if (browser.equals("Safari") || browser.equals("Firefox"))
					reFileNm = URLDecoder.decode(reFileNm);
			}
		} catch (Exception e) {
		}
		return reFileNm;
	}

	public void saveFileInfo(HashMap<String, String> fileMap) {
		boardDAO.saveFileInfo(fileMap);
	}

	public String getFileOrgName(HashMap<String, String> fileMap) {
		return boardDAO.getFileOrgName(fileMap);
	}

	public ArrayList<HashMap<String, Object>> getFile(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = boardDAO.getFile();
		return list;
	}

}
