package com.kh.rsAcademy.classes.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;


@Repository
public class ClDAO {

	public int insertClass(SqlSessionTemplate sqlSession, Classes cl) {
		
		return sqlSession.insert("yhClassesMapper.insertClass", cl);
	}

	public ArrayList<Classes> seletBoardList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("yhClassesMapper.seletBoardList");
	}

	public ArrayList<Member> writeClassclId(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("yhClassesMapper.writeClassclId");
	}

	public Classes updateFormClass(SqlSessionTemplate sqlSession, int clNo) {
		
		return sqlSession.selectOne("yhClassesMapper.updateFormClass", clNo);
	}

	public int updateClass(SqlSessionTemplate sqlSession, Classes cl) {
		
		return sqlSession.update("yhClassesMapper.updateClass", cl);
	}

	public ArrayList<Classes> searchClass1(SqlSessionTemplate sqlSession, String ct) {
		
		return (ArrayList)sqlSession.selectList("yhClassesMapper.searchClass1", ct);
	}

	public ArrayList<Classes> searchClass2(SqlSessionTemplate sqlSession, String lv) {
		
		return (ArrayList)sqlSession.selectList("yhClassesMapper.searchClass2", lv);
	}

	public ArrayList<Classes> searchClass3(SqlSessionTemplate sqlSession, Classes cl) {

		return (ArrayList)sqlSession.selectList("yhClassesMapper.searchClass3", cl);
	}

	public ArrayList<Classes> selectClass(SqlSessionTemplate sqlSession, int clNo) {
	
		return (ArrayList)sqlSession.selectList("yhClassesMapper.selectClass", clNo);
	}

	public int deleteClass(SqlSessionTemplate sqlSession, int clNo) {
		
		return sqlSession.update("yhClassesMapper.deleteClass", clNo);
	}

	public int classApply(SqlSessionTemplate sqlSession, HashMap<String, Comparable> map) {
		
		return sqlSession.insert("yhClassesMapper.classApply", map);
	}

	public ArrayList<ClassList> classList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("yhClassesMapper.classList");
	}




	
	
}
