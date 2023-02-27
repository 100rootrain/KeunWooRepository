package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.AirPollutionDAO;

@Service
public class AirPollutionService {
	@Autowired
	AirPollutionDAO airPollutionDAO;



	public ArrayList<HashMap<String, Object>> getLocationList() {
		ArrayList<HashMap<String, Object>> list = airPollutionDAO.getLocationList();
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> getStationList(HashMap<String, Object> map) {
		return airPollutionDAO.getStationList(map);
	}


}
