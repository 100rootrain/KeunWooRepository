package com.study.hard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.hard.dao.SMemberDao;

@Service //서비스 어노테이션 설정
public class SMemberService {
	@Autowired SMemberDao sMemberDao;

	public ArrayList<HashMap<String, Object>> selectMemberList() {
		ArrayList<HashMap<String,Object>> memberList = sMemberDao.selectMemberList(); 
		return memberList;
	}
}
