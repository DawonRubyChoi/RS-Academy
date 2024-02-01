package com.kh.rsAcademy.port.model.service;

import java.util.ArrayList;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.port.model.vo.Port;
import com.kh.rsAcademy.port.model.vo.Reply;

public interface PortService {

	int getListCount();

	ArrayList<Port> selectPortList(PageInfo pi);

	int insertBoard(Port p);

	Port selectPortDetail(int ocbNo, String id);

	int updatePort(Port p);

	ArrayList<Reply> selectReply(int ocbNo);

	int insertReply(Reply r);

	int deletePort(int ocbNo);

	int updateReply(Reply r);

	Reply selectUpdateReply(int ocrNo);

	int deleteReply(Reply r);

}
