package com.kh.rsAcademy.classes.level.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.rsAcademy.classes.level.model.vo.LevelTest;
import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.member.model.vo.Member;

@Repository
public class LevelDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rsClassesMapper.getListCount");
	}
	
	public ArrayList<LevelTest> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rsClassesMapper.selectList");
	}
	
	public ArrayList<LevelTest> selectAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("rsClassesMapper.selectAllList", null, rowBounds);
	}

	public int insertLevelTest(SqlSessionTemplate sqlSession, LevelTest l) {
		return sqlSession.insert("rsClassesMapper.insertLevelTest", l);
	}

	public LevelTest selectLevelTest(SqlSessionTemplate sqlSession, int ltNo) {
		return sqlSession.selectOne("rsClassesMapper.selectLevelTest", ltNo);
	}

	public int updateLevelTest(SqlSessionTemplate sqlSession, LevelTest l) {
		return sqlSession.update("rsClassesMapper.updateLevelTest", l);
	}

	public int deleteLevelTest(SqlSessionTemplate sqlSession, int[] ltNoArr) {
		return sqlSession.update("rsClassesMapper.deleteLevelTest", ltNoArr);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("rsClassesMapper.getSearchListCount", search);
	}

	public ArrayList<LevelTest> searchLevelTest(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("rsClassesMapper.searchLevelTest", search, rowBounds);
	}

	public int updateMemberLevel(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("rsClassesMapper.updateMemberLevel", m);
	}

	public ArrayList<Classes> selectClassesList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rsClassesMapper.selectClassesList");
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("rsClassesMapper.selectMember", id);
	}

	

}
