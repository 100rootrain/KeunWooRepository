package com.study.hard.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.CrawlingDAO;

@Service
public class CrawlingService {
	@Autowired
	CrawlingDAO crawlingDAO;
	
//    public void saveCrawlingData(ArrayList<String> animateTitle, ArrayList<String> animateItemPrice, ArrayList<String> animateItemUrl, ArrayList<String> animateItemImgUrl, ArrayList<String> animateLimitedProducts, ArrayList<String> animateSoldOutUrls, ArrayList<String> animateReservationProducts, ArrayList<String> animateMemberProducts, ArrayList<String> animateTextManual) {
//        for (int i = 0; i < animateTitle.size(); i++) {
//            CrawlingVO crawlingVO = new CrawlingVO();
//            crawlingVO.setTitle(animateTitle.get(i));
//            crawlingVO.setPrice(animateItemPrice.get(i));
//            crawlingVO.setUrl(animateItemUrl.get(i));
//            crawlingVO.setImgUrls(animateItemImgUrl.get(i));
//            
//            crawlingDAO.saveCrawlingData(crawlingVO);
//        }
//    }

	public void insertCrawlingData(HashMap<String, Object> map) {
		crawlingDAO.insertCrawlingData(map);
		
	}


}
