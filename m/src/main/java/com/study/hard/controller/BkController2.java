package com.study.hard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.hard.service.BkService;
import com.study.hard.util.Sha256Enc;

/**
 * Handles requests for the application home page.
 */
@RestController
public class BkController2 {
	@Autowired
	BkService bkService;

	@RequestMapping(value = "/getAccntPwInfo", method = RequestMethod.GET) /* 현재 비밀번호 일치여부 확인 , bkDetail 화면에서 씀 */
	public HashMap<String, Object> getAccntPwInfo(@RequestParam String accntId,
			@RequestParam(required = false, defaultValue = "") String accntNo, @RequestParam String pass, Locale locale,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accntId", accntId);
		map.put("accntNo", accntNo);
		map.put("pass", Sha256Enc.encrypt(pass));

		System.out.println("getAccntPwInfo : " + pass);
		System.out.println("getAccntPwInfo : " + Sha256Enc.encrypt(pass));

		HashMap<String, Object> result = bkService.getAccntPwInfo(map);
		return result;
	}

	@RequestMapping(value = "/getAccntPwInfo2", method = RequestMethod.GET) /* 현재 비밀번호 일치여부 확인 , bkDetail 화면에서 씀 */
	public HashMap<String, Object> getAccntPwInfo2(@RequestParam String accntId,
			@RequestParam(required = false, defaultValue = "") String accntNo, @RequestParam String pass, Locale locale,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accntId", accntId);
		map.put("accntNo", accntNo);
		map.put("pass", Sha256Enc.encrypt(pass));

		System.out.println("getAccntPwInfo2 : " + pass);
		System.out.println("getAccntPwInfo2 : " + Sha256Enc.encrypt(pass));

		HashMap<String, Object> result = bkService.getAccntPwInfo2(map);
		return result;
	}

	@RequestMapping(value = "/updateAccntPw", method = RequestMethod.GET) // 비밀번호 update
	public void updateAccntPw(@RequestParam String accntId, @RequestParam String accntPwChangeChk, Locale locale,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(accntId);
		System.out.println(Sha256Enc.encrypt(accntPwChangeChk));

		map.put("accntId", accntId);
		map.put("accntPwChangeChk", Sha256Enc.encrypt(accntPwChangeChk));

		bkService.updateAccntPw(map);
	}

	@RequestMapping(value = "/AccntPwInfo", method = RequestMethod.GET)
	public String AccntPwInfo(@RequestParam String accntId, @RequestParam String pass, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(accntId);
		System.out.println(pass);
		map.put("accntId", accntId);
		map.put("pass", Sha256Enc.encrypt(pass));

		String pwInfo = bkService.AccntPwInfo(map);
		return pwInfo;
	}

	@RequestMapping(value = "/getBalanceInfo", method = RequestMethod.GET)
	public HashMap<String, Object> getBalanceInfo(@RequestParam String accntId, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accntId", accntId);

		HashMap<String, Object> balanceInfo = bkService.getBalanceInfo(map);
		return balanceInfo;
	}

	@RequestMapping(value = "/getWithdrawMinus", method = RequestMethod.GET) // 비밀번호 update
	public void getWithdrawMinus(@RequestParam String accntId, @RequestParam String accntId2,
			@RequestParam String balance, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(accntId);

		map.put("accntId", accntId);
		map.put("accntId2", accntId2);
		map.put("balance", balance);

		bkService.getWithdrawMinus(map);
		bkService.getDepositPlus(map);
	}
	/*
	 * @RequestMapping(value = "/bankInsert", method = RequestMethod.POST) public
	 * void bankInsert(@RequestParam String bankCd, @RequestParam String
	 * accntNo, @RequestParam String pass, Locale locale, Model model) {
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * map.put("bankCd", bankCd); map.put("accntNo", accntNo); map.put("pass",
	 * Sha256Enc.encrypt(pass));
	 * 
	 * System.out.println("bankInsert : " + pass);
	 * System.out.println("bankInsert : " + Sha256Enc.encrypt(pass));
	 * bkService.bankInsert(map);
	 * 
	 * }
	 */

	@RequestMapping(value = "/bankInsertUpdate", method = RequestMethod.POST)
	public void bankInsertUpdate(@RequestParam String accntId, @RequestParam String pass, @RequestParam String bankCd,
			@RequestParam String accntNo, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("accntId", accntId);
		map.put("bankCd", bankCd);
		map.put("accntNo", accntNo);
		map.put("pass", Sha256Enc.encrypt(pass));

		System.out.println("bankInsert : " + pass);
		System.out.println("bankInsert : " + Sha256Enc.encrypt(pass));
		/* bkService.bankInsert(map); */
		bkService.bankInsertUpdate(map);

	}

	@RequestMapping(value = "/insertUser", method = RequestMethod.POST) // MERGE INTO 연습용
	public void insertUser(@RequestParam String id, @RequestParam String pw, @RequestParam String name,
			@RequestParam String tel, @RequestParam String email, @RequestParam String address, Locale locale,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", Sha256Enc.encrypt(pw)); // 화면에서 입력된 비밀번호 값을 DB에 넣기 위해 SHA-256으로 암호화해서 넣어줌
		map.put("name", name);
		map.put("tel", tel);
		map.put("email", email);
		map.put("address", address);
		bkService.insertUser(map);
	}

	@RequestMapping(value = "/accntHistoryInsert", method = RequestMethod.POST) // history
	public void accntHistoyInsert(@RequestParam String withdrawNo, @RequestParam String depositNo,
			@RequestParam String remittance, Locale locale, Model model) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("withdrawNo", withdrawNo);
		map.put("depositNo", depositNo);
		map.put("remittance", remittance);

		System.out.println("accntHistoyInsert : " + withdrawNo);
		System.out.println("accntHistoyInsert : " + depositNo);
		System.out.println("accntHistoyInsert : " + remittance);
		bkService.accntHistoryInsert(map);

	}

	@RequestMapping(value = "/getBankstatements", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> getBankstatements(@RequestParam String selectAccntId,
			@RequestParam(required = false, defaultValue = "") String start,
			@RequestParam(required = false, defaultValue = "") String end, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("selectAccntId", selectAccntId);
		map.put("start", start);
		map.put("end", end);
		System.out.println("getBankstatements_selectAccntId : " + selectAccntId);
		System.out.println("getBankstatements_start : " + start);
		System.out.println("getBankstatements_end : " + end);

		ArrayList<HashMap<String, Object>> bankstatements = bkService.getBankstatements(map);
		return bankstatements;
	}

	@RequestMapping(value = "/getWithdrawDepositSum", method = RequestMethod.GET)
	public HashMap<String, Object> getWithdrawDepositSum(@RequestParam String selectAccntId,
			@RequestParam(required = false, defaultValue = "") String start,
			@RequestParam(required = false, defaultValue = "") String end, Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("selectAccntId", selectAccntId);
		map.put("start", start);
		map.put("end", end);

		System.out.println("getWithdrawDepositSum_selectAccntId : " + selectAccntId);
		System.out.println("getWithdrawDepositSum_start : " + start);
		System.out.println("getWithdrawDepositSum_end : " + end);


		HashMap<String, Object> withdrawDepositSum = bkService.getWithdrawDepositSum(map);
		return withdrawDepositSum;
	}


}