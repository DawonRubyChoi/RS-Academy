package com.kh.rsAcademy.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.notice.model.vo.Notice;

@Repository
public class NoticeDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hjTeacherMapper.getListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();	// 건너뛸 수
		int limit = pi.getBoardLimit();		// 한 페이지에 표현 될 수
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("hjTeacherMapper.selectNoticeList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("hjTeacherMapper.insertNotice", n);
	}

	public Notice selectNoticeBoard(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.selectOne("hjTeacherMapper.selectNoticeBoard", nId);
	}

	public int updateNoticeCount(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.update("hjTeacherMapper.updateNoticeCount", nId);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("hjTeacherMapper.updateNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("hjTeacherMapper.deleteNotice", n);
	}
	
}
