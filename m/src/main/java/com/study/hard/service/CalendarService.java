package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.CalendarDAO;

@Service
public class CalendarService {
	@Autowired
	CalendarDAO calendarDAO;
	
	public ArrayList<HashMap<String, Object>> getCal(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = calendarDAO.getCal(map);
		return list;
	}

	public void insertSch(HashMap<String, Object> map) {
		calendarDAO.insertSch(map);
	}

	public void insertHoliday(HashMap<String, Object> map) {
		calendarDAO.insertHoliday(map);
	}
	
	public ArrayList<HashMap<String, Object>> isDuplicateHoliday(HashMap<String, Object> map) {
		return calendarDAO.isDuplicateHoliday(map);
	}
	
	

	public ArrayList<HashMap<String, Object>> getChartData(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = calendarDAO.getChartData(map);
		return list;

	}

	public ArrayList<HashMap<String, Object>> getHolidayChartData(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = calendarDAO.getHolidayChartData(map);
		return list;
	}

}
