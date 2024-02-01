package com.kh.rsAcademy.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.notice.model.dao.NoticeDAO;
import com.kh.rsAcademy.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return nDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDAO.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDAO.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectNotice(int nId, String id) {
		//디테일 값 
		Notice n = nDAO.selectNoticeBoard(sqlSession, nId);
		
		if(n != null) {		// 로그인 되어있고 관리자 아이디와 세션아이디가 다르면(다른사람이면)
			if(id != null && !n.getNoticeAdminNo().equals(id)) {
				int result = nDAO.updateNoticeCount(sqlSession, nId);
				System.out.println("조회수 업데이트 : "+result);
				if(result > 0) {
					n.setNoticeNum(n.getNoticeNum() + 1);
				}
			}
		}
		return n;
	}

	@Override
	public int updateNotice(Notice n) {
		return nDAO.updateNotice(sqlSession, n);
		
	}

	@Override
	public int deleteNotice(Notice n) {
		return nDAO.deleteNotice(sqlSession, n);
	}
	
}
