package com.study.hard.controller;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
/**
 * Handles requests for the application home page.
 */
@Controller
public class CrawlingController {


    public static void main(String[] args) {
        final String animateUrl = "https://animate-onlineshop.co.kr/goods/goods_list.php?brandCd=061";
        Connection conn = Jsoup.connect(animateUrl);

        try {
            Document document = conn.get();
            Elements imageUrlElements = document.getElementsByClass("item_photo_box");
                       

            for (Element element : imageUrlElements) {
            	//System.out.println(element);
            	Element link = element.select("a").first();
            	String linkHref = link.attr("abs:href");

                System.out.println(linkHref);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
	
	
//	public static void main(String[] args) throws ParseException {
//		
//		String URL = "https://animate-onlineshop.co.kr/goods/goods_list.php?brandCd=061";
//		Document doc;
//
//		try {
//			doc = Jsoup.connect(URL).get();
//			System.out.println("doc : " + doc);
//			Elements elem = doc.select(".date");
//			String[] str = elem.text().split(" ");
//
//			Elements totalDistance =doc.select("#contents > div > div > div.goods_list_item > div.goods_pick_list > span > strong");
//			
//			String  distance = totalDistance.text();
//			
//			  
//		
//			System.out.println("이번달 거리 : "+distance);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
    
    
    
    
    
}

	


