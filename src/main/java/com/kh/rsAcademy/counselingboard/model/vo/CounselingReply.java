package com.kh.rsAcademy.counselingboard.model.vo;

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
public class CounselingReply {
	private int crNo; 
	private String crContent; 
	private Date crDate;
	private int crCbNo; 
	private String crStatus; 
	private String crId;
	private String mbName;
}
