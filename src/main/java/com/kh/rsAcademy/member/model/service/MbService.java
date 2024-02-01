package com.kh.rsAcademy.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;

public interface MbService {

	Member selectMember(String string);

	Member logIn(Member m);

	int idCheck(String id);

	int enroll(Member m);

	ArrayList<ClassList> selectClassList(String mbId);

	int classCancle(HashMap<String, String> map);

	int updateMember(Member m);

	int deleteMember(String id);

	ArrayList<Member> memberList();

	ArrayList<ClassList> allClassList();

	int adminUpdateMember(Member m);

	int adminUpdateClassList(ClassList cl);
	
	Member findId(Member m);

	Member findPwd(HashMap<String, Object> list);

	int tempPwd(Member m);

}
