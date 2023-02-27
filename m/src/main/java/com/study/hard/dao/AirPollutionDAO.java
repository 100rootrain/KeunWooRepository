package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface AirPollutionDAO {

	public ArrayList<HashMap<String, Object>> getLocationList();
	
	public ArrayList<HashMap<String, Object>> getStationList(HashMap<String, Object> map);

}
