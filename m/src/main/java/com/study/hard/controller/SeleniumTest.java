package com.study.hard.controller;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SeleniumTest {
	
	private static final Logger log = LoggerFactory.getLogger(SeleniumTest.class);

 
    public static void main(String[] args) {
 
        SeleniumTest selTest = new SeleniumTest();
        selTest.crawl();
        
    }
 
   
    //WebDriver
    private WebDriver driver;
    
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:/Users/qoreh/git/KeunWooRepository/m/src/main/webapp/resources/selenium/chromedriver_win32/chromedriver.exe";
    
    //크롤링 할 URL
    private String base_url;
    
    public SeleniumTest() {
        super();
 
        //System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        
        //Driver SetUp
        //driver = new ChromeDriver();
        base_url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=2023%EB%85%845%EC%9B%94";
        
        // Driver SetUp
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless"); // 창이 표시되지 않도록 설정 (백그라운드에서 실행)
        driver = new ChromeDriver(options);
    }
 
    public void crawl() {
 
        try {
            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
            driver.get(base_url);
            List<WebElement> posts  = driver.findElements(By.cssSelector(".cld_base.cld_holi"));
            log.info("posts : " + posts);
            
         
            
            for (WebElement element : posts) {
            	WebElement parent = element.findElement(By.xpath("./ancestor::div[contains(@class, 'cld_date')][1]"));
                String nyear = parent.getAttribute("nyear");
                String nmonth = parent.getAttribute("nmonth");
                String ndate = parent.getAttribute("ndate");
                
                String title = element.getAttribute("title");
                
                // 왼쪽에 0을 추가하여 2자리로 표현(1~9)
                nmonth = String.format("%02d", Integer.parseInt(nmonth));
                ndate = String.format("%02d", Integer.parseInt(ndate));

               log.info("nyear: " + nyear);
               log.info("nmonth: " + nmonth);
               log.info("ndate: " + ndate);
               log.info("title : " + title);
            }
//            
//            List<WebElement> hDay = driver.findElements(By.cssSelector(".cld_day.h_day"));
//            log.info("hDay : " + hDay);
//            
//            for (WebElement element : hDay) {
//            	String hDate = element.getText();
//            	log.info("hDate :" +hDate);
//            }
//

        } catch (Exception e) {
            
            e.printStackTrace();
        
        } finally {
	    	 if (driver != null) {
	    	        driver.quit();
	    	    }
        }
 
    }
 
}
