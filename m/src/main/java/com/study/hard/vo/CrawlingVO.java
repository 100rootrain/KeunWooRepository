package com.study.hard.vo;

import org.apache.ibatis.type.Alias;

@Alias("crawlingVO")
public class CrawlingVO {
	
    private String title; 
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    
    private String url; 
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    
    private String price; 
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    
    private String imgUrls; 
    public String getImgUrls() {
        return imgUrls;
    }
    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls;
    }
}
