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

public class Reply {

	private int ocrNo;
	private String ocrContent;
	private Date ocrDate;
	private String ocrId;
	private int ocrOcbNo;
	private String ocrStatus;
	private String mbName;
}
