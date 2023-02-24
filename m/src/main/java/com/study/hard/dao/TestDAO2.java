package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface TestDAO2 {

	ArrayList<HashMap<String, Object>> getList();

	HashMap<String, Object> getEmpDetail(HashMap<String, Object> paramMap);

	ArrayList<HashMap<String, Object>> getDeptList();

}
