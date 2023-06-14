package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface CalendarDAO {

	public ArrayList<HashMap<String, Object>> getCal(HashMap<String, Object> map);

	public void insertSch(HashMap<String, Object> map);

	public void insertHoliday(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> getChartData(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> getHolidayChartData(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> isDuplicateHoliday(HashMap<String, Object> map);

}
