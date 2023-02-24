package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface BulletinBoardDAO {

	ArrayList<HashMap<String, Object>> getBulletinBoardList(HashMap<String, Object> map);

	HashMap<String, Object> getBulletinBoardDetail(HashMap<String, Object> map);

	void bullentinBoardInsert(HashMap<String, Object> map);

	int selectBulletinBoardListCount(HashMap<String, Object> map);

	void saveBulletinBoardFileInfo(HashMap<String, String> fileMap);

	ArrayList<HashMap<String, Object>> getFile(HashMap<String, Object> map);

	String getBulletinBoardFileOrgName(HashMap<String, String> fileMap);

	HashMap<String, Object> getBullentinBoardPwChk(HashMap<String, Object> map);

	void bulletinBoardDelete(HashMap<String, Object> map);

	void bulletinFileDelete(HashMap<String, Object> map);

	void deleteFile(HashMap<String, Object> map);

	void getViewCount(HashMap<String, Object> map);
	
}
