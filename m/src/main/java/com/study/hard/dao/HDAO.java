package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.study.hard.vo.HVO;

@Repository
public interface HDAO {
	public ArrayList<HVO> selectHList(HashMap<String, Object> map);
	
	public HVO selectHDetail(String aa);

	public void hinsertBoard(HVO hvo);

	public void hdeleteBoard(String id);
	
	public void hupdate(HashMap<String, Object> map);

}
