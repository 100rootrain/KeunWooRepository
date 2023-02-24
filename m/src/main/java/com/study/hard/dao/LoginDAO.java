package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.study.hard.vo.LoginVO;

@Repository
public interface LoginDAO {

	HashMap<String, Object> getLoginInfo(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> getRankList();

	ArrayList<HashMap<String, Object>> getDeptList();

	ArrayList<HashMap<String, Object>> getGenderList();

	void insertUserInfo(LoginVO loginVO);

	void getLastLoginDate(HashMap<String, Object> map);

	void updatePw(HashMap<String, Object> map);

	String getPwInfo(HashMap<String, Object> map);

	HashMap<String, Object> getAccountInfo(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> getIdList(HashMap<String, Object> map);



}
