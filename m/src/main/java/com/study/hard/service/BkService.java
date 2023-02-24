package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.BkDAO;

@Service
public class BkService {
	@Autowired
	BkDAO bkDAO;

	public ArrayList<HashMap<String, Object>> getAccountList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> list = bkDAO.getAccountList(map);
		return list;
	}

	public HashMap<String, Object> getAccountDetail(HashMap<String, Object> map) {
		HashMap<String, Object> result = bkDAO.getAccountDetail(map);
		return result;
	}

	public void deleteAccountInfo(HashMap<String, Object> map) {
		bkDAO.deleteAccountInfo(map);

	}

	public ArrayList<HashMap<String, Object>> getBankList() {
		ArrayList<HashMap<String, Object>> list = bkDAO.getBankList();
		return list;
	}

	public void bkUpdate(HashMap<String, Object> map) {
		bkDAO.bkUpdate(map);
	}

	public void updateAccntPw(HashMap<String, Object> map) {
		bkDAO.updateAccntPw(map);
	}

	public HashMap<String, Object> getAccntPwInfo(HashMap<String, Object> map) {
		return bkDAO.getAccntPwInfo(map);
	}

	public String AccntPwInfo(HashMap<String, Object> map) {

		return bkDAO.AccntPwInfo(map);
	}

	public ArrayList<HashMap<String, Object>> getBankAccountList() {
		ArrayList<HashMap<String, Object>> list = bkDAO.getBankAccountList();
		return list;
	}

	public HashMap<String, Object> getBalanceInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bkDAO.getBalanceInfo(map);
	}

	public void getWithdrawMinus(HashMap<String, Object> map) {
		bkDAO.getWithdrawMinus(map);
	}

	public void getDepositPlus(HashMap<String, Object> map) {
		bkDAO.getDepositPlus(map);

	}

	public void insertUser(HashMap<String, Object> map) {
		bkDAO.insertUser(map);
	}

	public void bankInsert(HashMap<String, Object> map) {
		bkDAO.bankInsert(map);
	}

	public HashMap<String, Object> getAccntPwInfo2(HashMap<String, Object> map) {
		return bkDAO.getAccntPwInfo2(map);
	}

	public void accntHistoryInsert(HashMap<String, Object> map) {
		bkDAO.accntHistoryInsert(map);
	}

	public HashMap<String, Object> getWithdrawResult(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bkDAO.getWithdrawResult(map);
	}

	public void bankInsertUpdate(HashMap<String, Object> map) {
		bkDAO.bankInsertUpdate(map);
	}


	public ArrayList<HashMap<String, Object>> getBankstatements(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bkDAO.getBankstatements(map);
	}

	public HashMap<String, Object> getWithdrawDepositSum(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bkDAO.getWithdrawDepositSum(map);
	}


	

}