package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface TestDAO {
	//DAO에 연결된 mapper 파일에서 메서드명과 동일한 쿼리 실행
	void insert(HashMap<String, Object> m); 

	ArrayList<HashMap<String, Object>> select();

	void delete(String k);
}
