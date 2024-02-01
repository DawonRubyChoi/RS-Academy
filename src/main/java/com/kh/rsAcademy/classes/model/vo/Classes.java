package com.kh.rsAcademy.classes.model.vo;

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
public class Classes {
	
	private int clNo;
	private String clTitle;
	private Date clStartdate;
	private Date clEnddate;
	private String clLevel;
	private int clPrice;
	private String clIntro;
	private String clCategory;
	private int clNum;
	private int clCurrentnum;
	private String clImage;
	private String clStatus;
	private String clId;
	

}
