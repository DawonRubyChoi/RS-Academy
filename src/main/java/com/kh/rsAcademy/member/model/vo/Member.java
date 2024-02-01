package com.kh.rsAcademy.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private String mbId;
	private String mbPwd;
	private String mbName;
	private String mbEmail;
	private Date mbBirth;
	private String mbTel;
	private String mbAddress;
	private String mbIsAdmin;
	private int mbLevel;
	private String mbStatus;
	

}
