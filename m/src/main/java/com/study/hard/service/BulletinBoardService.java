package com.study.hard.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.BulletinBoardDAO;

@Service
public class BulletinBoardService {
	@Autowired
	BulletinBoardDAO bulletinBoardDAO;

	public ArrayList<HashMap<String, Object>> getBulletinBoardList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = bulletinBoardDAO.getBulletinBoardList(map);
		return list;

	}

	public HashMap<String, Object> getBulletinBoardDetail(HashMap<String, Object> map) {
		return bulletinBoardDAO.getBulletinBoardDetail(map);
	}

	public void bullentinBoardInsert(HashMap<String, Object> map) { // 게시글 작성
		bulletinBoardDAO.bullentinBoardInsert(map);

	}

	public int selectBulletinBoardListCount(HashMap<String, Object> map) { // 페이징
		return bulletinBoardDAO.selectBulletinBoardListCount(map);
	}

	// 브라우저에 따른 한글 파일명 처리(화면과 통신하는 메서드가 아니므로 서비스에 위치)
	public String getBulletinBoardFileNm(String browser, String fileNm) {
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

	public void saveBulletinBoardFileInfo(HashMap<String, String> fileMap) { // 첨부파일 등록
		bulletinBoardDAO.saveBulletinBoardFileInfo(fileMap);

	}

	public String getBulletinBoardFileOrgName(HashMap<String, String> fileMap) {
		return bulletinBoardDAO.getBulletinBoardFileOrgName(fileMap);
	}

	public ArrayList<HashMap<String, Object>> getFile(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = bulletinBoardDAO.getFile(map);
		return list;
	}

	public HashMap<String, Object> getBullentinBoardPwChk(HashMap<String, Object> map) {

		return bulletinBoardDAO.getBullentinBoardPwChk(map);
	}

	public void bulletinBoardDelete(HashMap<String, Object> map) {
		bulletinBoardDAO.bulletinBoardDelete(map);
	}

	public void bulletinFileDelete(HashMap<String, Object> map) {
		bulletinBoardDAO.bulletinFileDelete(map);
		
	}

	public void deleteFile(HashMap<String, Object> map) {
		bulletinBoardDAO.deleteFile(map);		
	}

	public void getViewCount(HashMap<String, Object> map) {
		bulletinBoardDAO.getViewCount(map);
	}

}
