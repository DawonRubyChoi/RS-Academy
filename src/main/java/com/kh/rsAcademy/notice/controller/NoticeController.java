package com.kh.rsAcademy.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.rsAcademy.common.Pagination;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.member.model.vo.Member;
import com.kh.rsAcademy.notice.model.exception.NoticeException;
import com.kh.rsAcademy.notice.model.service.NoticeService;
import com.kh.rsAcademy.notice.model.vo.Notice;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;

	@RequestMapping("noticeList.hj")
	public String selectNoticeList(@RequestParam(value="page", defaultValue="1") int page,
									Model model) {
		
		// �럹�씠吏� 泥섎━ 以�鍮�
		int currentPage = page;
		int listCount = nService.getListCount();	
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);	
		ArrayList<Notice> nList = nService.selectNoticeList(pi);			
		
		if(nList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("nList", nList);
			
			return "noticeList";
		} else {
			throw new NoticeException("공지사항 리스트 출력을 실패했습니다.");
		}
	}
	
	
	
	@RequestMapping("noticeDetail.hj")
	public ModelAndView selectNoticeDetail(@RequestParam("page") int page,
									@RequestParam( "nId") int nId,
									HttpSession session,
									ModelAndView mv) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		if(loginUser != null) {
			id = loginUser.getMbId();
		}
		Notice n = nService.selectNotice(nId, id);	
		
		
		if(n != null) {
			mv.addObject("n", n);
			mv.addObject("page", page);
			mv.setViewName("noticeDetail");
			
			return mv;
		} else {
			throw new NoticeException("공지사항 상세정보 출력을 실패했습니다.");
		}
	}
	
	
	
	@RequestMapping("noticeWrite.hj")
	public String noticeWrite() {
		return "noticeWrite";
	}
	
	
	@RequestMapping("insertNotice.hj")
	public String insertNotice(@ModelAttribute Notice n, HttpSession session) {
		String loginUser = ((Member)session.getAttribute("loginUser")).getMbId();
		n.setNoticeAdminNo(loginUser);
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:noticeList.hj";
		} else {
			throw new NoticeException();
		}
	}
	
	@RequestMapping("updateForm.hj")
	public String updateForm(@RequestParam("noticeNo") int nId, @RequestParam("page") int page,
							Model model) {
		Notice n = nService.selectNotice(nId, null);	
		
		
		model.addAttribute("n", n);
		model.addAttribute("page", page);
		
		return "noticeEdit";		
	}
	
	@RequestMapping("updateNotice.hj")
	public String updateNotice(@ModelAttribute Notice n, @RequestParam("page") int page,
								Model model) {
		
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			model.addAttribute("nId", n.getNoticeNo());
			model.addAttribute("page", page);
			return "redirect:noticeDetail.hj";
		} else {
			throw new NoticeException("공지사항 수정에 실패했습니다.");
		}
	}
	
	@RequestMapping("deleteNotice.hj")
	public String deleteNotice(@ModelAttribute Notice n, @RequestParam("page") int page,
								Model model) {
		
		int result = nService.deleteNotice(n);
		
		if(result > 0) {
			model.addAttribute("page", page);
			return "redirect:noticeList.hj";
		} else {
			throw new NoticeException("공지사항 삭제에 실패했습니다.");
		}
	}
	
	
	
	
}
