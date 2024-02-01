package com.kh.rsAcademy.port.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.port.model.vo.Port;
import com.kh.rsAcademy.port.model.vo.Reply;

@Repository
public class PortDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hjTeacherMapper.getPortListCount");
	}

	public ArrayList<Port> selectPortList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 페이징처리
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("hjTeacherMapper.selectPortList", null, rowBounds);
	}

	public int insertPort(SqlSessionTemplate sqlSession, Port p) {
		return sqlSession.insert("hjTeacherMapper.insertPort", p);
	}

	public Port selectPortDetail(SqlSessionTemplate sqlSession, int ocbNo) {
		return sqlSession.selectOne("hjTeacherMapper.selectPortDetail", ocbNo);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int ocbNo) {
		return sqlSession.update("hjTeacherMapper.updateCount", ocbNo);
	}

	public int updatePort(SqlSessionTemplate sqlSession, Port p) {
		return sqlSession.update("hjTeacherMapper.updatePort", p);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int ocbNo) {
		return (ArrayList)sqlSession.selectList("hjTeacherMapper.selectReply", ocbNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("hjTeacherMapper.insertReply", r);
	}

	public int deletePort(SqlSessionTemplate sqlSession, int ocbNo) {
		return sqlSession.update("hjTeacherMapper.deletePort", ocbNo);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("hjTeacherMapper.updateReply", r);
	}

	public Reply selectUpdateReply(SqlSessionTemplate sqlSession, int ocrNo) {
		return sqlSession.selectOne("hjTeacherMapper.selectUpdateReply", ocrNo);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("hjTeacherMapper.deleteReply", r);
	}

}
