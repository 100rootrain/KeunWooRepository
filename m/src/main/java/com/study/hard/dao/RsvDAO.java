package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface RsvDAO {
	public ArrayList<HashMap<String, Object>> selectRsvList(HashMap<String, Object> map);

	public HashMap<String, Object> selectRsvDetail(HashMap<String, Object> map);

	public void updateInfo(HashMap<String, Object> map);

	public HashMap<String, Object> selectRsvStat(HashMap<String, Object> map);

	public void updateCancel(HashMap<String, Object> map);

	public void updateDone(HashMap<String, Object> map);



	}
