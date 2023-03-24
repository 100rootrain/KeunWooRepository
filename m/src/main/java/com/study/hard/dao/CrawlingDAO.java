package com.study.hard.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface CrawlingDAO {
	 
//	public void saveCrawlingData(CrawlingVO crawlingVO);

	public void insertCrawlingData(HashMap<String, Object> map);
	 
}

