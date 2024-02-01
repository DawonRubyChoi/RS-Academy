package com.kh.rsAcademy.counselingboard.model.service;

import java.util.ArrayList;

import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingBoard;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingReply;

public interface CbService {

   int getListCount();

   ArrayList<CounselingBoard> counselingBoardList(PageInfo pi);

   int writeCounselingBoard(CounselingBoard cb);

   CounselingBoard counselingDetail(int cbNo, String id);

   int editCounselingBoard(CounselingBoard cb);

   CounselingBoard updateCounselingBoard(int cbNo);

   int deleteCounselingBoard(CounselingBoard cb);

   int replyCounselingBoard(CounselingReply cr);

   CounselingReply replyDetail(int cbNo);

   CounselingReply replyEdit(int crCbNo);

   int counselingReplyEdit(CounselingReply cr);

   CounselingBoard counselingDetail2(int cbNo);

   int replyDelete(CounselingReply cr);  


}	