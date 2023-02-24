package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface CustomerDAO {

	public ArrayList<HashMap<String, Object>> selectCustomerList(HashMap<String, Object> map);

	public HashMap<String, Object> selectCustomerDetail(HashMap<String, Object> map);

	void customerInsert(HashMap<String, Object> map);

	public void customerInsert2(HashMap<String, Object> map);

	

}