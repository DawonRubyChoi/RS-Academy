package com.kh.rsAcademy.counselingboard.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.counselingboard.model.dao.CbDAO;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingBoard;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingReply;

@Service
public class CbServiceImpl implements CbService {
   
   @Autowired
   private SqlSession sqlSession;
   
   @Autowired
   private CbDAO cDAO;

   @Override
   public int getListCount() {
      return cDAO.getListCount(sqlSession);
   }

   @Override
   public ArrayList<CounselingBoard> counselingBoardList(PageInfo pi) {
      return cDAO.counselingBoardList(sqlSession, pi);
   }

   @Override
   public int writeCounselingBoard(CounselingBoard cb) {
      return cDAO.writeCounselingBoard(sqlSession, cb);
   }

   @Override
   public CounselingBoard counselingDetail(int cbNo, String id) {
      CounselingBoard cb = cDAO.counselingDetail(sqlSession, cbNo);
      if(cb != null) {
    	  if(id != null && !cb.getCbId().equals(id)) {
    		  int result = cDAO.updateCount(sqlSession, cbNo);
    		  if(result>0) {
    			  cb.setCbNum(cb.getCbNum() + 1);
    		  }
    	  }
      }
      return cb;
   }

	@Override
	public int editCounselingBoard(CounselingBoard cb) {
		return cDAO.editCounselingBoard(sqlSession, cb);
	}

	@Override
	public CounselingBoard updateCounselingBoard(int cbNo) {
		return cDAO.updateCounselingBoard(sqlSession, cbNo);
	}

	@Override
	public int deleteCounselingBoard(CounselingBoard cb) {
		return cDAO.deleteCounselingBoard(sqlSession, cb);
	}

	@Override
	public int replyCounselingBoard(CounselingReply cr) {
		return cDAO.replyCounselingBoard(sqlSession, cr);
	}

	@Override
	public CounselingReply replyDetail(int cbNo) {
		return cDAO.replyDetail(sqlSession, cbNo);
	}

	@Override
	public CounselingReply replyEdit(int crCbNo) {
		return cDAO.replyEdit(sqlSession, crCbNo);
	}

	@Override
	public int counselingReplyEdit(CounselingReply cr) {
		return cDAO.counselingReplyEdit(sqlSession, cr);
	}

	@Override
	public CounselingBoard counselingDetail2(int cbNo) {
		return cDAO.counselingDetail2(sqlSession, cbNo);
	}

	@Override
	public int replyDelete(CounselingReply cr) {
		return cDAO.replyDelete(sqlSession, cr);
	}


}