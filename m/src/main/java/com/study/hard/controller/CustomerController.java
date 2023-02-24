package com.study.hard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.hard.service.CustomerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@RequestMapping(value = "/customerList", method = RequestMethod.GET)

	public String CustomerList(@RequestParam(required = false, defaultValue = "") String name, Locale locale,
			Model model) { // Local
							// ~
							// model
							// 고정값
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);

		ArrayList<HashMap<String, Object>> list = customerService.selectCustomerList(map);

		model.addAttribute("list", list);
		model.addAttribute("name", name);
		return "customerList";

	}

	@RequestMapping(value = "/customerDetail", method = RequestMethod.GET)

	public String customerDetail(@RequestParam String custNo, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custNo", custNo);

		HashMap<String, Object> customerDetail = customerService.selectCustomerDetail(map);
		model.addAttribute("customerDetail", customerDetail);
		return "customerDetail";

	}

	@RequestMapping(value = "/customerInsert", method = RequestMethod.GET)

	public String customerInsert(Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		HashMap<String, Object> customerDetail = customerService.selectCustomerDetail(map);

		model.addAttribute("customerDetail", customerDetail);
		return "customerInsert";

	}

}
