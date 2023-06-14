package com.study.hard.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.study.hard.service.CalendarService;


/**
 * Handles requests for the application home page.
 */
@RestController /* 데이터통신 */
public class CalendarRestController {

	private static final Logger log = LoggerFactory.getLogger(CalendarRestController.class);
	
	@Autowired
	CalendarService calendarService;

	@RequestMapping(value = "/getCal", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> getCal(@RequestParam String yearBox, @RequestParam String monthBox,
			Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("yearBox", yearBox);
		map.put("monthBox", monthBox);

		log.info("getCal : " + yearBox);
		log.info("getCal : " + monthBox);

		ArrayList<HashMap<String, Object>> CalList = calendarService.getCal(map);
		
		return CalList;
	}
	
	@RequestMapping(value = "/insertSch", method = RequestMethod.POST) // 일정
	public void insertSch(@RequestParam String yearBox, @RequestParam String monthBox, @RequestParam String dateBox,
			@RequestParam String selStartHour, @RequestParam String selStartMinute, @RequestParam String schdlNm,
			Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("yearBox", yearBox);
		map.put("monthBox", monthBox);
		map.put("dateBox", dateBox);
		map.put("selStartHour", selStartHour);
		map.put("selStartMinute", selStartMinute);
		map.put("schdlNm", schdlNm);
		calendarService.insertSch(map);
	}

	@RequestMapping(value = "/insertHoliday", method = RequestMethod.POST) // 휴일
	public void insertHoliday(@RequestParam String yearMonthDate, @RequestParam String holidayNm, Locale locale,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("yearMonthDate", yearMonthDate);
		map.put("holidayNm", holidayNm);
		
		
	    // 중복 체크를 수행하여 이미 저장된 휴일인지 확인
	    ArrayList<HashMap<String, Object>> duplicateHolidays = calendarService.isDuplicateHoliday(map);
	    if (duplicateHolidays != null && duplicateHolidays.size() > 0) {
	        // 이미 저장된 휴일인 경우, 중복 처리를 수행하거나 예외 처리를 진행할 수 있습니다.
	        log.info("Duplicate holiday: " + yearMonthDate + ", " + holidayNm);
	        // 중복 처리 로직을 추가하세요.
	        return;
	    } else {
	        // 중복되지 않은 경우, 휴일을 저장합니다.
	        calendarService.insertHoliday(map);
	        log.info("Holiday inserted: " + yearMonthDate + ", " + holidayNm);
	    }
	}

	@RequestMapping(value = "/getChartData", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> getChartData(@RequestParam String gender, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gender", gender);
		ArrayList<HashMap<String, Object>> getChartData = calendarService.getChartData(map);
		return getChartData;
	}

	@RequestMapping(value = "/getHolidayChartData", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> getHolidayChartData(Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<HashMap<String, Object>> getHolidayChartData = calendarService.getHolidayChartData(map);
		return getHolidayChartData;
	}
	


	
	//
    private WebDriver driver;
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:/Users/qoreh/git/KeunWooRepository/m/src/main/webapp/resources/selenium/chromedriver_win32/chromedriver.exe";
    private String base_url;
    
	
//	  public CalendarRestController() {
//	        super();
//	  }
    
	
	
	@RequestMapping(value = "/getAnniversary", method = RequestMethod.GET)
	public void getAnniversary(@RequestParam String chgYear, @RequestParam String chgMonth,
			Locale locale, Model model) {
		
		HashMap<String, Object> anniversaryMap = new HashMap<String, Object>();

		anniversaryMap.put("chgYear", chgYear);
		anniversaryMap.put("chgMonth", chgMonth);
		base_url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="+anniversaryMap.get("chgYear")+"년"+anniversaryMap.get("chgMonth")+"월";
		
		
		WebDriver driver = null; // WebDriver 객체 선언
	    try {

	        // System Property SetUp
	        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	        
	        // Driver SetUp
	        ChromeOptions options = new ChromeOptions();
	        options.addArguments("--headless"); // 창이 표시되지 않도록 설정 (백그라운드에서 실행)
	        driver = new ChromeDriver(options);
	        driver.get(base_url);
	        		
	        List<WebElement> posts = driver.findElements(By.cssSelector(".cld_base.cld_holi"));
	        System.out.println("posts : " + posts);

	        for (WebElement element : posts) {
            	WebElement parent = element.findElement(By.xpath("./ancestor::div[contains(@class, 'cld_date')][1]"));
                String nyear = parent.getAttribute("nyear");
                String nmonth = parent.getAttribute("nmonth");
                String ndate = parent.getAttribute("ndate");
                
                String title = element.getAttribute("title");
                
                // 왼쪽에 0을 추가하여 2자리로 표현(1~9)
                nmonth = String.format("%02d", Integer.parseInt(nmonth));
                ndate = String.format("%02d", Integer.parseInt(ndate));
                
               String holidayDate = nyear + nmonth + ndate;

               log.info("nyear: " + nyear);
               log.info("nmonth: " + nmonth);
               log.info("ndate: " + ndate);
               log.info("title : " + title);
               log.info("holidayDate : " + holidayDate);
               
               if (holidayDate != null && !holidayDate.isEmpty()) {
            	   // 중복 체크를 수행하여 이미 저장된 휴일인지 확인
                   anniversaryMap.put("yearMonthDate", holidayDate);
                   anniversaryMap.put("holidayNm", title);
                   
                   ArrayList<HashMap<String, Object>> duplicateHolidays = calendarService.isDuplicateHoliday(anniversaryMap);
                   if (duplicateHolidays != null && duplicateHolidays.size() > 0) {
                       // 이미 저장된 휴일인 경우, 중복 처리를 수행하거나 예외 처리를 진행할 수 있습니다.
                       log.info("Duplicate holiday: " + holidayDate + ", " + title);
                       log.info("이미 저장된 휴일입니다!!! 리턴!!!");
                       return;
                   } else {
                       // 중복되지 않은 경우, 휴일을 저장합니다.
                       calendarService.insertHoliday(anniversaryMap);
                       log.info("Holiday inserted: " + holidayDate + ", " + title);
                       log.info("중복되지않은 휴일입니다!!!!!");
                   }
                   
               } else {
                   // holidayDate 값이 없는 경우
                  
               }

	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	    } finally {
	    	 if (driver != null) {
	    	        driver.quit();
	    	    }
	    }
	}
	
	

	
}

