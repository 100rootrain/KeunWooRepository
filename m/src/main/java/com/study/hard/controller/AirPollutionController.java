package com.study.hard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.hard.service.AirPollutionService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AirPollutionController {

	@Autowired
	AirPollutionService airPollutionService;

	@RequestMapping(value = "/airPollution", method = RequestMethod.GET)
	public String airPollution(Locale locale, Model model) { // INNERHTML
		ArrayList<HashMap<String, Object>> locationList = airPollutionService.getLocationList();

		model.addAttribute("locationList", locationList);

		return "airPollution";
	}

	@RequestMapping(value = "/airPollution2", method = RequestMethod.GET)
	public String airPollution2(Locale locale, Model model) {
		ArrayList<HashMap<String, Object>> locationList = airPollutionService.getLocationList();

		model.addAttribute("locationList", locationList);

		return "airPollution2";
	}

}
