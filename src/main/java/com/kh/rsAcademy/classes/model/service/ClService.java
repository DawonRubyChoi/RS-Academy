package com.kh.rsAcademy.classes.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;

public interface ClService {

	int insertClass(Classes cl);

	ArrayList<Classes> seletBoardList();

	ArrayList<Member> writeClassclId();

	Classes updateFormClass(int clNo);

	int updateClass(Classes cl);

	ArrayList<Classes> searchClass1(String ct);

	ArrayList<Classes> searchClass2(String lv);

	ArrayList<Classes> searchClass3(Classes cl);

	ArrayList<Classes> selectClass(int clNo);

	int deleteClass(int clNo);

	int classApply(HashMap<String, Comparable> map);

	ArrayList<ClassList> classList();
	
}
