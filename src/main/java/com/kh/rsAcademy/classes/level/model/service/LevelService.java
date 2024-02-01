package com.kh.rsAcademy.classes.level.model.service;

import java.util.ArrayList;

import com.kh.rsAcademy.classes.level.model.vo.LevelTest;
import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.member.model.vo.Member;

public interface LevelService {

	int getListCount();
	
	ArrayList<LevelTest> selectList();
	
	ArrayList<LevelTest> selectAllList(PageInfo pi);

	int insertLevelTest(LevelTest l);

	LevelTest selectLevelTest(int ltNo);

	int updateLevelTest(LevelTest l);

	int deleteLevelTest(int[] ltNoArr);

	int getSearchListCount(String search);

	ArrayList<LevelTest> searchLevelTest(String search, PageInfo pi);

	int updateMemberLevel(Member m);

	ArrayList<Classes> selectClassesList();


}
