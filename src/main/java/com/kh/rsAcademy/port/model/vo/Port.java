package com.kh.rsAcademy.port.model.vo;

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


public class Port {
	private int ocbNo;
	private String ocbCategory;
	private String ocbImage;		// 주소값 or lib에 이미지 저장형식
	private Date ocbDate;
	private String ocbTitle;
	private String ocbContent;
	private int ocbNum;
	private String ocbId;
	private String ocbStatus;
	private String mbName;
}
