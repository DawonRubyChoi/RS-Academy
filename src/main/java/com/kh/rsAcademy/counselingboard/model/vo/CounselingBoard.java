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
public class CounselingBoard {
	private int cbNo;
	private String cbContent;
	private String cbTitle;
	private Date cbDate;
	private int cbNum;
	private String cbStatus;
	private String cbId;
	private String mbName;
}
