package com.study.hard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface SMemberDao {

	public ArrayList<HashMap<String, Object>> selectMemberList();
}
