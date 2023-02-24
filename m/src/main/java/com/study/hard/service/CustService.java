package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.CustDAO;

@Service
public class CustService {
	@Autowired
	CustDAO custDAO;
	
	public ArrayList<HashMap<String, Object>> selectCustList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = custDAO.selectCustList(map);
		return list;
	}

	public HashMap<String, Object> selectCustDetail(HashMap<String, Object> map) {
		HashMap<String, Object> custDetail = custDAO.selectCustDetail(map);
		return custDetail;
	}

	public void custDelete(HashMap<String, Object> map) {
		custDAO.custDelete(map);
		
	}

	public void custInsert(HashMap<String, Object> map) {
		custDAO.custInsert(map);		
	}

	public void custUpdate(HashMap<String, Object> map) {
		custDAO.custUpdate(map);
		
	}
	
}

	
