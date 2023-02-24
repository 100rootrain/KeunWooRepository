package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface BkDAO {

	ArrayList<HashMap<String, Object>> getAccountList(HashMap<String, Object> map);

	HashMap<String, Object> getAccountDetail(HashMap<String, Object> map);

	void deleteAccountInfo(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> getBankList();

	void bkUpdate(HashMap<String, Object> map);

	void updateAccntPw(HashMap<String, Object> map);

	HashMap<String, Object> getAccntPwInfo(HashMap<String, Object> map);

	String AccntPwInfo(HashMap<String, Object> map);

	ArrayList<HashMap<String, Object>> getBankAccountList();

	HashMap<String, Object> getBalanceInfo(HashMap<String, Object> map);

	void getWithdrawMinus(HashMap<String, Object> map);

	void getDepositPlus(HashMap<String, Object> map);

	void insertUser(HashMap<String, Object> map);

	void bankInsert(HashMap<String, Object> map);

	HashMap<String, Object> getAccntPwInfo2(HashMap<String, Object> map);

	void accntHistoryInsert(HashMap<String, Object> map);

	HashMap<String, Object> getWithdrawResult(HashMap<String, Object> map);

	void bankInsertUpdate(HashMap<String, Object> map);



	ArrayList<HashMap<String, Object>> getBankstatements(HashMap<String, Object> map);

	HashMap<String, Object> getWithdrawDepositSum(HashMap<String, Object> map);

}