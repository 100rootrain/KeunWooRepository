package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.RsvDAO;

@Service
public class RsvService {
	@Autowired
	RsvDAO rsvDAO;

	public ArrayList<HashMap<String, Object>> selectRsvList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = rsvDAO.selectRsvList(map);
		return list;
	}
	
	public HashMap<String, Object> selectRsvDetail(HashMap<String, Object> map) {
		return rsvDAO.selectRsvDetail(map);
	}

	public void update(HashMap<String, Object> map) {
		if(map.get("stat").equals("2"))
		 rsvDAO.updateCancel(map);		
		if(map.get("stat").equals("3"))
			 rsvDAO.updateDone(map);	
		
			/* 가끔 오류가아닌데 밑줄 쳐질때는 project - clean - clean */
	}

	public void updateInfo(HashMap<String, Object> map) {
		rsvDAO.updateInfo(map);
		
	}

	public HashMap<String, Object> selectRsvStat(HashMap<String, Object> map) {
		return rsvDAO.selectRsvStat(map);
		
	}


}
