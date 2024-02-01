package com.kh.rsAcademy.notice.model.vo;

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

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private Date noticeDate;
	private String noticeContent;
	private String noticeAdminNo;
	private String noticeStatus;
	private String noticeImage;
	private int noticeNum;
	private String mbName;
}