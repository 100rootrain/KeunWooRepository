package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.CustomerDAO;

@Service
public class CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	public ArrayList<HashMap<String, Object>> selectCustomerList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = customerDAO.selectCustomerList(map);
		return list;
	}

	public HashMap<String, Object> selectCustomerDetail(HashMap<String, Object> map) {
		return customerDAO.selectCustomerDetail(map);
	}

	public void customerInsert(HashMap<String, Object> map) {
		customerDAO.customerInsert(map);
		
	}

	public void customerInsert2(HashMap<String, Object> map) {
		customerDAO.customerInsert2(map);
		
	}
	
	
	


}