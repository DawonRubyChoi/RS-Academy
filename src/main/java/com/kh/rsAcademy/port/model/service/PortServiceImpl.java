package com.kh.rsAcademy.port.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.port.model.dao.PortDAO;
import com.kh.rsAcademy.port.model.vo.Port;
import com.kh.rsAcademy.port.model.vo.Reply;

@Service
public class PortServiceImpl implements PortService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PortDAO pDAO;
	
	@Override
	public int getListCount() {
		return pDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Port> selectPortList(PageInfo pi) {
		return pDAO.selectPortList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Port p) {
		return pDAO.insertPort(sqlSession, p);
	}

	
	// 조회수는 상세페이지 입장 시 증가
	// -> 같은 비즈니스 로직이므로 서비스단에서 처리
	@Override
	public Port selectPortDetail(int ocbNo, String id) {
		
		Port p = pDAO.selectPortDetail(sqlSession, ocbNo);
		if(p != null) {
			if(id != null && !p.getOcbId().equals(id)) {
				int result = pDAO.updateCount(sqlSession, ocbNo);
				if(result > 0) {
					p.setOcbNum(p.getOcbNum() + 1);
				}
			}
		}
		return p;
	}

	@Override
	public int updatePort(Port p) {
		return pDAO.updatePort(sqlSession, p);
	}

	@Override
	public ArrayList<Reply> selectReply(int ocbNo) {
		return pDAO.selectReply(sqlSession, ocbNo);
	}

	@Override
	public int insertReply(Reply r) {
		return pDAO.insertReply(sqlSession, r);
	}

	@Override
	public int deletePort(int ocbNo) {
		return pDAO.deletePort(sqlSession, ocbNo);
	}

	@Override
	public int updateReply(Reply r) {
		return pDAO.updateReply(sqlSession, r);
	}

	@Override
	public Reply selectUpdateReply(int ocrNo) {
		return pDAO.selectUpdateReply(sqlSession, ocrNo);
	}

	@Override
	public int deleteReply(Reply r) {
		return pDAO.deleteReply(sqlSession, r);
	}
	

}
