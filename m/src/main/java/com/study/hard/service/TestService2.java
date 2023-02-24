package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.TestDAO2;

@Service
public class TestService2 {
	@Autowired
	TestDAO2 testDAO2;

	public ArrayList<HashMap<String, Object>> getList() {
		// TODO Auto-generated method stub
		return testDAO2.getList();
	}

	public HashMap<String, Object> getEmpDetail(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return testDAO2.getEmpDetail(paramMap);
	}

	public ArrayList<HashMap<String, Object>> getDeptList() {
		// TODO Auto-generated method stub
		return testDAO2.getDeptList();
	}

}
