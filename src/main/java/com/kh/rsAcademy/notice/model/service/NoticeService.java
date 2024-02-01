package com.kh.rsAcademy.notice.model.service;

import java.util.ArrayList;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.notice.model.vo.Notice;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	int insertNotice(Notice n);

	Notice selectNotice(int nId, String id);

	int updateNotice(Notice n);

	int deleteNotice(Notice n);

}
