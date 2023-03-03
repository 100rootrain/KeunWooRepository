package com.study.hard.controller;

import java.io.IOException;
import java.util.Objects;

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
	
    private static final int FIRST_PAGE_INDEX = 1;
    private static final int LAST_PAGE_INDEX = 16;
    private static final String PLATFORM = "Animate";

    public static void main(String[] args) {
        try {
        	
        	// 상품 모든 페이징 순회
        	for(int i = FIRST_PAGE_INDEX; i<=LAST_PAGE_INDEX; i++) {
                final String animateUrl = "https://animate-onlineshop.co.kr/goods/goods_list.php?page="+i+"&brandCd=061";
                Connection conn = Jsoup.connect(animateUrl);
                Document document = conn.get();
                System.out.println("현재 페이지 :" + i);
                
                //크롤링 항목 필요 리스트
                Elements goodslist = document.select("div.normal_goods"); 
                Elements imageUrlElements = goodslist.select("div.item_photo_box");
                Elements titleElements = goodslist.select("strong.item_name");
                Elements itemPrice = goodslist.select("strong.item_price");
                Elements linkElements = goodslist.select("div.item_photo_box > a"); 
                String[] ImageUrls = new String[imageUrlElements.size()];
                String[] limitedProducts = new String[titleElements.size()];
                String[] reservationProducts = new String[titleElements.size()];
                Elements soldOutYnElements = goodslist.select("div.item_info_cont");
                String[] soldOutUrls = new String[soldOutYnElements.size()];
                Elements memberProductsElements = goodslist.select("div.item_icon_box");
                String[] memberProducts = new String[memberProductsElements.size()];
                

                int setIndex = 0;
                int getIndex = 0;

                for(Element e : imageUrlElements) {
                	Element link = e.select("img").first();
                	ImageUrls[setIndex++] = link.attr("abs:src");
                }
                
                setIndex = 0;
                for(Element e : soldOutYnElements) {
                	Element link;
                	if(e.select("img").first()!=null) {
                		link = e.select("img").first(); // 재고 없는경우
                		soldOutUrls[setIndex++] = link.attr("abs:src");
                	}else {
                		link = e.appendText(""); // 재고 있는경우
                		soldOutUrls[setIndex++] = "N";
                	}

                }
                setIndex = 0;
                for(Element e : titleElements) {
                	Element link;
                	if(e.select("b.anigen").first()!=null) {
                		link = e.select("b.anigen").first(); // 한정상품 있는경우
                		limitedProducts[setIndex++] = "애니메이트한정";
                	}else {
                		link = e.appendText(""); // 한정상품 없는경우
                		limitedProducts[setIndex++] = "N";
                	}
                }
                
                setIndex = 0;
                for(Element e : titleElements) {
                	Element link;
                	if(e.select("b.yoyaku").first()!=null) {
                		link = e.select("b.yoyaku").first(); // 예약상품 있는경우
                		reservationProducts[setIndex++] = "예약상품";
                	}else {
                		link = e.appendText(""); // 예약상품 없는경우
                		reservationProducts[setIndex++] = "N";
                	}
                }
                
                setIndex = 0;
                for(Element e : memberProductsElements) {
                	Element link;
                	if(e.select("img").first()!=null) {
                		link = e.select("img").first(); // 로그인 후 구매가능상품
                		memberProducts[setIndex++] = "Y";
                	}else {
                		link = e.appendText(""); // 로그인 후 구매가능상품 없는경우
                		memberProducts[setIndex++] = "N";
                	}
                }
               
                

                for (int j = 0; j < titleElements.size(); j++) {
                
                    final String title = titleElements.get(j).text().replaceAll("[★](.*?)[★]","").trim();  
                    final String price = itemPrice.get(j).text();
                    final String url = linkElements.get(j).attr("abs:href");
                    

                    System.out.print(j+1+"번째 ");
                    System.out.println("상품 이름 : "+title);
                    System.out.println("한정상품 여부YN : "+limitedProducts[j]);
                    System.out.println("품절상품 여부YN : "+soldOutUrls[j]);
                    System.out.println("예약상품 여부YN : "+reservationProducts[j]);
                    System.out.println("로그인구매 여부YN : "+memberProducts[j]);
                    

                    // 상품 링크 내부
                    Connection innerConn = Jsoup.connect(url);
                    Document innerDocument = innerConn.get();
                    
                    //상품상세정보
                    final String txtManual = innerDocument.selectFirst(".txt-manual").text();
//                    System.out.println("상품상세정보 : " + txtManual);

                }

        	}
           
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }

    
}

	


