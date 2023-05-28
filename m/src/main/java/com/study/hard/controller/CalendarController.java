package com.study.hard.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController {
	@RequestMapping(value = "/Calendar", method = RequestMethod.GET)
	public String Calendar(Locale locale, Model model) {
		
		return "Calendar";
	}
	
	@RequestMapping(value = "/addScheduleForm", method = RequestMethod.GET)
	public String addScheduleForm(Locale locale, Model model) {

		return "addScheduleForm";
	}

	@RequestMapping(value = "/addHolidayForm", method = RequestMethod.GET)
	public String addHolidayForm(Locale locale, Model model) {

		return "addHolidayForm";
	}
	
	@RequestMapping(value = "/holidayChart", method = RequestMethod.GET)
	public String holidayChart(Locale locale, Model model) {

		return "holidayChart";
	}

}
