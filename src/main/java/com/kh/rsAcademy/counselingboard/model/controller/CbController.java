package com.kh.rsAcademy.counselingboard.model.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.rsAcademy.common.Pagination;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.counselingboard.model.service.CbService;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingBoard;
import com.kh.rsAcademy.counselingboard.model.vo.CounselingReply;
import com.kh.rsAcademy.member.model.exception.MemberException;
import com.kh.rsAcademy.member.model.vo.Member;

@Controller
public class CbController {
   
   @Autowired
   private CbService cService;
   
   @RequestMapping("counseling.dw")
   public String selectBoardList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
    
       int listCount = cService.getListCount(); 
       
       int currentPage = page;
       
       PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
       ArrayList<CounselingBoard> list = cService.counselingBoardList(pi);
       
       if(list != null) {
          model.addAttribute("pi", pi);
          model.addAttribute("list", list);
          
          return "counselingList";
       } else { 
          throw new MemberException("리스트를 조회할 수 없습니다.");
       }
    }
   
   @RequestMapping("writeCounselingBoard.dw")
   public String writeCounselingBoard() {
      return "insertCounselingBoard";
   }
   
   @RequestMapping("counselingDetail.dw")
   public String counselingDetail(HttpSession session, @RequestParam("cbNo")int cbNo, @RequestParam("page") int page, Model model) {
      Member loginUser = (Member)session.getAttribute("loginUser");
      
      String id = null;
      if(loginUser != null) {
         id = loginUser.getMbId();
      }
      
      CounselingBoard cb = cService.counselingDetail(cbNo, id);
      CounselingReply cr = cService.replyDetail(cbNo);
      
      if(cb != null) {
         model.addAttribute("cb", cb);
         model.addAttribute("cr", cr);
         model.addAttribute("page", page);
         
         return "counselingDetail";
      } else {
         throw new MemberException("게시글을 조회할 수 없습니다.");
      }
   }
   
   @RequestMapping("updateCounselingBoard.dw")
   public String updateCounselingBoard(@RequestParam("cbNo") int cbNo, @RequestParam("page") int page, Model model) {
	    CounselingBoard cb = cService.updateCounselingBoard(cbNo);
		model.addAttribute("cb", cb);
		model.addAttribute("page", page);
		
	   return "counselingEdit";
   }
   
   @RequestMapping("editCounselingBoard.dw")
   public String editCounselingBoard(@ModelAttribute CounselingBoard cb, @RequestParam("page") int page, Model model) {
	   int update = cService.editCounselingBoard(cb);
	   
	   if(update > 0) {
		   model.addAttribute("cbNo", cb.getCbNo());
		   model.addAttribute("page", page);
		   return "redirect:counselingDetail.dw";
	   } else {
		   throw new MemberException("게시글을 수정할 수 없습니다.");
	   }
   }
   
   
   @RequestMapping("deleteCounselingBoard.dw")
   public String deleteCounselingBoard(@ModelAttribute CounselingBoard cb) {
	   int result = cService.deleteCounselingBoard(cb);
	   if(result > 0) {
		   return "redirect:counseling.dw";
	   } else {
		   throw new MemberException("게시글을 삭제할 수 없습니다.");
	   }
   }
   
   @RequestMapping("insertCounselingBoard.dw")
   public String insertCounselingBoard(HttpSession session, @ModelAttribute CounselingBoard cb) {
      
      String boardWriter = ((Member) session.getAttribute("loginUser")).getMbId(); 
      cb.setMbName(boardWriter);
      
      int result = cService.writeCounselingBoard(cb);
      
      if(result > 0) {
         return "redirect:counselingDetail.dw?cbNo=" + cb.getCbNo() + "&page=1";
      } else {
         throw new MemberException("게시글을 등록할 수 없습니다.");
      }
      
   }
   
   @RequestMapping("replyCounselingBoard.dw")
   public String replyCounselingBoard(HttpSession session, @ModelAttribute CounselingReply cr, Model model) {
	   
	   String boardReply = ((Member) session.getAttribute("loginUser")).getMbId();
	   cr.setCrId(boardReply);
	   
	   int result = cService.replyCounselingBoard(cr);
	   
	   if(result>0) {
		   model.addAttribute("cr", result);
		   return "redirect:counselingDetail.dw?cbNo=" + cr.getCrCbNo() + "&page=1";
	   } else {
		   throw new MemberException("답변을 등록에 실패하였습니다.");
	   }
   }
   
   @RequestMapping("replyEdit.dw")
   public String replyEdit(@RequestParam("crCbNo") int cbNo, @RequestParam("page") int page, Model model) {
	   CounselingBoard cb = cService.counselingDetail2(cbNo);
	   CounselingReply cr = cService.replyDetail(cbNo);
	      
	      if(cb != null) {
	         model.addAttribute("cb", cb);
	         model.addAttribute("cr", cr);
	         model.addAttribute("page", page);
	         return "counselingReplyEdit";
	      } else {
	    	  throw new MemberException("조회에 실패하였습니다.");
	      }
		
   }
   
   @RequestMapping("counselingReplyEdit.dw")
   public String counselingReplyEdit (@ModelAttribute CounselingReply cr, @RequestParam("page") int page, Model model) {
	   int update = cService.counselingReplyEdit(cr);
	   System.out.println(cr); //왜안찍혀?
	   if(update > 0) {
		   model.addAttribute("crNo", cr.getCrCbNo());
		   model.addAttribute("page", page);
		   return "redirect:counselingDetail.dw?cbNo=" + cr.getCrCbNo() + "&page=1";
	   } else {
		   throw new MemberException("답변 수정에 실패하였습니다.");
	   }
		  
   }
   
   @RequestMapping("replyDelete.dw")
   public String replyDelete(@ModelAttribute CounselingReply cr) {
	   int result = cService.replyDelete(cr);
	   
	   if(result > 0) {
		   return "redirect:counseling.dw";
	   } else {
		   throw new MemberException("답변 삭제에 실패하셨습니다.");
	   }
   }
   
  @RequestMapping(value = "insertReplyBoard.dw", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
  public String isnertReplyBoard(@ModelAttribute CounselingReply cr) {
	  return null;
  }
}   