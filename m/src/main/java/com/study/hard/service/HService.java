package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.HDAO;
import com.study.hard.vo.HVO;

@Service
public class HService {
	@Autowired
	HDAO hDAO;

	public ArrayList<HVO> selectHList(HashMap<String, Object> map) {
		ArrayList<HVO> hlist = hDAO.selectHList(map);
		return hlist;
	}
	
	public HVO selectHDetail(String id) {
		return hDAO.selectHDetail(id);
	}


	public void hinsertBoard(HVO hvo) {
		hDAO.hinsertBoard(hvo);

	}


	public void hdeleteBoard(String id) {
		hDAO.hdeleteBoard(id);
	}


	public void hupdate(HashMap<String, Object> map) {
		hDAO.hupdate(map);

	}


}