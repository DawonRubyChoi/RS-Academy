package com.kh.rsAcademy.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;

@Repository
public class MbDAO {

	public Member selectMember(SqlSession session, String string) {
		
		return session.selectOne("jyMemberMapper.selectMember",string);
	}

	public Member logIn(SqlSession session, Member m) {
		return session.selectOne("dwMemberMapper.logIn" , m);
	}

	public int idCheck(SqlSession session, String id) {
		return session.selectOne("jyMemberMapper.idCheck" , id);
	}

	public int enroll(SqlSession session, Member m) {
		return session.insert("jyMemberMapper.enroll", m);
	}

	public ArrayList<ClassList> selectClassList(SqlSession session, String mbId) {
		// TODO Auto-generated method stub
		return (ArrayList)session.selectList("jyMemberMapper.selectClassList", mbId);
	}

	public int classCancle(SqlSession session, HashMap<String, String> map) {
		
		return session.update("jyMemberMapper.classCancle",map);
	}

	public int updateMember(SqlSession session, Member m) {
		return session.update("jyMemberMapper.updateMember",m);
	}

	public int deleteMember(SqlSession session, String id) {
		return session.update("jyMemberMapper.deleteMember",id);
	}

	public ArrayList<Member> memberList(SqlSession session) {
		return (ArrayList)session.selectList("jyMemberMapper.memberList");
	}

	public ArrayList<ClassList> allClassList(SqlSession session) {
		return (ArrayList)session.selectList("jyMemberMapper.allClassList");
	}

	public int adminUpdateMember(SqlSession session, Member m) {
		return session.update("jyMemberMapper.adminUpdateMember",m);
	}

	public int adminUpdateClassList(SqlSession session, ClassList cl) {
		return session.update("jyMemberMapper.adminUpdateClassList",cl);
	}
	
	public Member findId(SqlSession session, Member m) {
	      return session.selectOne("dwMemberMapper.findId", m);
	 }

	public Member findPwd(SqlSession session, HashMap<String, Object> list) {
	     return session.selectOne("dwMemberMapper.findPwd", list);
	 }

	public int tempPwd(SqlSession session, Member m) {
		return session.update("jyMemberMapper.tempPwd", m);
	}
	
}
