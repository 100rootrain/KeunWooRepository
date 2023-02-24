package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.TestDAO;

@Service
public class TestService {
	@Autowired // 자동으로 해당 클래스의 객체를 만들어줌(new TestDAO()와 같은 기능)
	TestDAO testDAO;

	public void insert(HashMap<String, Object> m) {
		// TODO Auto-generated method stub
		testDAO.insert(m); // DAO 객체의 메서드 호출하면서 컨트롤러에서 넘어온 map 전달
	}

	public ArrayList<HashMap<String, Object>> select() {
		// TODO Auto-generated method stub
		return testDAO.select(); //DAO 객체의 메서드 실행 후 ArrayList(데이터) 반환
	}

	public void delete(String k) {
		// TODO Auto-generated method stub
		testDAO.delete(k);
	}

}
