package com.kh.rsAcademy.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rsAcademy.member.model.dao.MbDAO;
import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;

@Service
public class MbServiceImpl implements MbService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private MbDAO mDAO;
	
	@Override
	public Member selectMember(String string) {

		return mDAO.selectMember(session,string);
	}

	@Override
	public Member logIn(Member m) {
		return mDAO.logIn(session, m);
	}

	@Override
	public int idCheck(String id) {
		return mDAO.idCheck(session,id);
	}

	@Override
	public int enroll(Member m) {
		return mDAO.enroll(session,m);
	}

	@Override
	public ArrayList<ClassList> selectClassList(String mbId) {
		return  mDAO.selectClassList(session,mbId);
	}

	@Override
	public int classCancle(HashMap<String, String> map) {
		return mDAO.classCancle(session,map);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(session,m);
	}

	@Override
	public int deleteMember(String id) {
		return mDAO.deleteMember(session,id);
	}

	@Override
	public ArrayList<Member> memberList() {
		return mDAO.memberList(session);
	}

	@Override
	public ArrayList<ClassList> allClassList() {
		return mDAO.allClassList(session);
	}

	@Override
	public int adminUpdateMember(Member m) {
		return mDAO.adminUpdateMember(session,m);
	}

	@Override
	public int adminUpdateClassList(ClassList cl) {
		return mDAO.adminUpdateClassList(session,cl);
	}
	
	@Override
	   public Member findId(Member m) {
	      return mDAO.findId(session, m);
	   }

	 @Override
	 public Member findPwd(HashMap<String, Object> list) {
	      return mDAO.findPwd(session, list);
	  }

	@Override
	public int tempPwd(Member m) {
		return mDAO.tempPwd(session, m);
	}
	
}
