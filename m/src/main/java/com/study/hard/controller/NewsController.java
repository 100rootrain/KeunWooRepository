package com.study.hard.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class NewsController {
    
 
 //   public static HashMap<String, String> map;
 
    
	@RequestMapping(value = "/crawling", method = RequestMethod.GET)
    public String startCrawl(Model model) throws IOException {
 
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
        Date currentTime = new Date();
 
        String dTime = formatter.format(currentTime);
        String e_date = dTime;
 
        currentTime.setDate(currentTime.getDate() - 1);
        String s_date = formatter.format(currentTime);
 
        String query = "고양시 덕양구";
        String s_from = s_date.replace(".", "");
        String e_to = e_date.replace(".", "");
        int page = 1;
        ArrayList<String> al1 = new ArrayList<>();
        ArrayList<String> al2 = new ArrayList<>();
 
        while (page < 20) {
            String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds=" + s_date
                    + "&de=" + e_date + "&nso=so%3Ar%2Cp%3Afrom" + s_from + "to" + e_to + "%2Ca%3A&start="
                    + Integer.toString(page);
            Document rawData = Jsoup.connect(address).timeout(5000).get();
            System.out.println("address : " + address);
            Elements blogOption = rawData.select("div.news_area");
//            System.out.println("blogOption : " + blogOption);
            String realURL = "";
            String realTITLE = "";
 
            for (Element option : blogOption) {
                realURL = option.select("a.news_tit").attr("href");
                realTITLE = option.select("a.news_tit").attr("title");
//                System.out.println("realTITLE : " + realTITLE);
                al1.add(realURL);
                al2.add(realTITLE);
            }
            page += 10;
        }
        model.addAttribute("urls", al1);
        model.addAttribute("titles", al2);
        
//		for(int i=0; i<al1.size(); i++) {
//			System.out.println("al1.get(i) : "+ al1.get(i));
//		}
//		
//		for(int i=0; i<al2.size(); i++) {
//			System.out.println("al2.get(i) : " + al2.get(i));
//		}
        
        
 
        return "news";
    }
}