package com.kh.rsAcademy.classes.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rsAcademy.classes.model.dao.ClDAO;
import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;

@Service
public class ClServiceImpl implements ClService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClDAO cDAO;

	@Override
	public ArrayList<Classes> seletBoardList() {
		return cDAO.seletBoardList(sqlSession);
	}
	
	@Override
	public int insertClass(Classes cl) {
		
		return cDAO.insertClass(sqlSession, cl);
	}

	@Override
	public ArrayList<Member> writeClassclId() {
		
		return cDAO.writeClassclId(sqlSession);
	}

	@Override
	public Classes updateFormClass(int clNo) {
		
		return cDAO.updateFormClass(sqlSession, clNo);
	}

	@Override
	public int updateClass(Classes cl) {
		
		return cDAO.updateClass(sqlSession, cl);
	}

	@Override
	public ArrayList<Classes> searchClass1(String ct) {
		
		return cDAO.searchClass1(sqlSession, ct);
	}

	@Override
	public ArrayList<Classes> searchClass2(String lv) {
		
		return cDAO.searchClass2(sqlSession, lv);
	}

	@Override
	public ArrayList<Classes> searchClass3(Classes cl) {

		return cDAO.searchClass3(sqlSession, cl);
	}

	@Override
	public ArrayList<Classes> selectClass(int clNo) {
		
		return cDAO.selectClass(sqlSession, clNo);
	}

	@Override
	public int deleteClass(int clNo) {
		return cDAO.deleteClass(sqlSession, clNo);
	}

	@Override
	public int classApply(HashMap<String, Comparable> map) {

		return cDAO.classApply(sqlSession, map);
	}

	@Override
	public ArrayList<ClassList> classList() {
		
		return cDAO.classList(sqlSession);
	}

	


}
