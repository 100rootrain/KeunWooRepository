package com.study.hard.controller;

import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.hard.service.CustomerService;

/**
 * Handles requests for the application home page.
 */
@RestController
public class CustomerController2 {

	@Autowired
	CustomerService customerService;

	@RequestMapping(value = "/customerInsert2", method = RequestMethod.GET)

	public void customerInsert2(@RequestParam String custNo,
			@RequestParam(required = false, defaultValue = "") String name,
			@RequestParam(required = false, defaultValue = "") String birth,
			@RequestParam(required = false, defaultValue = "") String contact,
			@RequestParam(required = false, defaultValue = "") String address, Locale locale, Model model)
	/* 등록할때 custNo이 안넘어가니깐 필요없다. */ {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", custNo);
		map.put("name", name);
		map.put("birth", birth);
		map.put("contact", contact);
		map.put("address", address);
		customerService.customerInsert2(map); /* CUD는 리턴값없다. void */

	}

	@RequestMapping(value = "/customerNew", method = RequestMethod.GET)

	public void customerNew(@RequestParam(required = false, defaultValue = "") String name,
			@RequestParam(required = false, defaultValue = "") String birth,
			@RequestParam(required = false, defaultValue = "") String contact,
			@RequestParam(required = false, defaultValue = "") String address, Locale locale, Model model)
	/* 등록할때 custNo이 안넘어가니깐 필요없다. */ {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("birth", birth);
		map.put("contact", contact);
		map.put("address", address);
		customerService.customerInsert(map); /* CUD는 리턴값없다. void */

	}

}