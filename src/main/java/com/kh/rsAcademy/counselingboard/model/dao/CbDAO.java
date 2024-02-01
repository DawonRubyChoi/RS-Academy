package com.kh.rsAcademy.counselingboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingBoard;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingReply;

@Repository
public class CbDAO {

   public int getListCount(SqlSession sqlSession) {
      return sqlSession.selectOne("dwMemberMapper.counselingListCount");
   }

   public ArrayList<CounselingBoard> counselingBoardList(SqlSession sqlSession, PageInfo pi) {
      
      RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
      return (ArrayList)sqlSession.selectList("dwMemberMapper.counselingBoardList", pi, rowBounds);
   }

   public int writeCounselingBoard(SqlSession sqlSession, CounselingBoard cb) {
      return sqlSession.insert("dwMemberMapper.writeCounselingBoard", cb);
   }

	public int updateCount(SqlSession sqlSession, int cbNo) {
		return sqlSession.update("dwMemberMapper.updateCount", cbNo);
	}
	
	public CounselingBoard counselingDetail(SqlSession sqlSession, int cbNo) {
		return sqlSession.selectOne("dwMemberMapper.counselingDetail", cbNo);
	}

	public int editCounselingBoard(SqlSession sqlSession, CounselingBoard cb) {
		return sqlSession.update("dwMemberMapper.editCounselingBoard", cb);
	}

	public CounselingBoard updateCounselingBoard(SqlSession sqlSession, int cbNo) {
		return sqlSession.selectOne("dwMemberMapper.updateCounselingBoard", cbNo);
	}

	public int deleteCounselingBoard(SqlSession sqlSession, CounselingBoard cb) {
		return sqlSession.update("dwMemberMapper.deleteCounselingBoard", cb);
	}

	public int replyCounselingBoard(SqlSession sqlSession, CounselingReply cr) {
		return sqlSession.insert("dwMemberMapper.replyCounselingBoard", cr);
	}

	public CounselingReply replyDetail(SqlSession sqlSession, int cbNo) {
		return sqlSession.selectOne("dwMemberMapper.replyDetail", cbNo);
	}

	public CounselingReply replyEdit(SqlSession sqlSession, int crCbNo) {
		return sqlSession.selectOne("dwMemberMapper.replyEdit", crCbNo);
	}

	public int counselingReplyEdit(SqlSession sqlSession, CounselingReply cr) {
		return sqlSession.update("dwMemberMapper.counselingReplyEdit", cr);
	}

	public CounselingBoard counselingDetail2(SqlSession sqlSession, int cbNo) {
		return sqlSession.selectOne("dwMemberMapper.counselingDetail2", cbNo);
	}

	public int replyDelete(SqlSession sqlSession, CounselingReply cr) {
		return sqlSession.update("dwMemberMapper.replyDelete", cr);
	}
   
}