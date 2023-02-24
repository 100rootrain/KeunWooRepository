package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.LoginDAO;
import com.study.hard.vo.LoginVO;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO;

	public HashMap<String, Object> getLoginInfo(HashMap<String, Object> map) {
		return loginDAO.getLoginInfo(map);
	}

	public ArrayList<HashMap<String, Object>> getRankList() {
		return loginDAO.getRankList();
	}

	public ArrayList<HashMap<String, Object>> getDeptList() {
		return loginDAO.getDeptList();
	}

	public ArrayList<HashMap<String, Object>> getGenderList() {
		// TODO Auto-generated method stub
		return loginDAO.getGenderList();
	}

	public void insertUserInfo(LoginVO loginVO) {
		loginDAO.insertUserInfo(loginVO);

	}

	public void getLastLoginDate(HashMap<String, Object> map) {
		loginDAO.getLastLoginDate(map);

	}

	public void updatePw(HashMap<String, Object> map) {
		loginDAO.updatePw(map);
	}

	public String getPwInfo(HashMap<String, Object> map) {
		return loginDAO.getPwInfo(map);
	}

	public HashMap<String, Object> getAccountInfo(HashMap<String, Object> map) {
		return loginDAO.getAccountInfo(map);
	}

	public ArrayList<HashMap<String, Object>> getIdList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = loginDAO.getIdList(map);
		return list;
	}

}