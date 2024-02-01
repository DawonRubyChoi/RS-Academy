package com.kh.rsAcademy.classes.level.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rsAcademy.classes.level.model.dao.LevelDAO;
import com.kh.rsAcademy.classes.level.model.vo.LevelTest;
import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.member.model.vo.Member;

@Service
public class LevelServiceImpl implements LevelService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private LevelDAO lDAO;

	@Override
	public int getListCount() {
		return lDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<LevelTest> selectList() {
		return lDAO.selectList(sqlSession);
	}
	
	@Override
	public ArrayList<LevelTest> selectAllList(PageInfo pi) {
		return lDAO.selectAllList(sqlSession, pi);
	}

	@Override
	public int insertLevelTest(LevelTest l) {
		return lDAO.insertLevelTest(sqlSession, l);
	}

	@Override
	public LevelTest selectLevelTest(int ltNo) {
		return lDAO.selectLevelTest(sqlSession, ltNo);
	}

	@Override
	public int updateLevelTest(LevelTest l) {
		return lDAO.updateLevelTest(sqlSession, l);
	}

	@Override
	public int deleteLevelTest(int[] ltNoArr) {
		return lDAO.deleteLevelTest(sqlSession, ltNoArr);
	}

	@Override
	public int getSearchListCount(String search) {
		return lDAO.getSearchListCount(sqlSession, search);
	}

	@Override
	public ArrayList<LevelTest> searchLevelTest(String search, PageInfo pi) {
		return lDAO.searchLevelTest(sqlSession, search, pi);
	}

	@Override
	public int updateMemberLevel(Member m) {
		return lDAO.updateMemberLevel(sqlSession, m);
	}

	@Override
	public ArrayList<Classes> selectClassesList() {
		return lDAO.selectClassesList(sqlSession);
	}




}
