package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface CustDAO {
	public ArrayList<HashMap<String, Object>> selectCustList(HashMap<String, Object> map);

	public HashMap<String, Object> selectCustDetail(HashMap<String, Object> map);

	public void custDelete(HashMap<String, Object> map); /* 지우면 끝이니깐 리턴값 없어서 void */

	public void custInsert(HashMap<String, Object> map);

	public void custUpdate(HashMap<String, Object> map);
	
	}
