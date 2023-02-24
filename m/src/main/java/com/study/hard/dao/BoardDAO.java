package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.study.hard.vo.BoardVO;

@Repository
public interface BoardDAO {
	public ArrayList<BoardVO> selectBoardList(HashMap<String, Object> map);

	public BoardVO selectBoardDetail(String bb);

	public void insertBoard(BoardVO vo);

	public void deleteBoard(String no);

	public void update(HashMap<String, Object> map);

	public int selectBoardListCount(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> getStationList(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> getLocationList();

	public ArrayList<HashMap<String, Object>> getLanguageList();

	public ArrayList<HashMap<String, Object>> getCal(HashMap<String, Object> map);

	public void insertSch(HashMap<String, Object> map);

	public void insertHoliday(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> getChartData(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> getHolidayChartData(HashMap<String, Object> map);

	public void saveFileInfo(HashMap<String, String> fileMap);

	public String getFileOrgName(HashMap<String, String> fileMap);

	public ArrayList<HashMap<String, Object>> getFile();
}
