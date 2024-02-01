package com.kh.rsAcademy.port.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.rsAcademy.common.Pagination;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.member.model.vo.Member;
import com.kh.rsAcademy.port.model.exception.PortException;
import com.kh.rsAcademy.port.model.service.PortService;
import com.kh.rsAcademy.port.model.vo.Port;
import com.kh.rsAcademy.port.model.vo.Reply;

@Controller
public class PortController {
	
	@Autowired
	private PortService pService;
	
	@RequestMapping("portList.hj")
	public String goPhotoList(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		// 페이징 처리에 필요한 데이터 /6개씩
		int currentPage = page;
		int portCount = pService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, portCount, 6);
		
		// portList 가져오기
		ArrayList<Port> list = pService.selectPortList(pi);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			
			return "portList";
		} else {
			throw new PortException("포트폴리오 게시글 조회를 실패하였습니다");
		}
	}
	
	@RequestMapping("portWrite.hj")
	public String portWrite() {
		return "portWrite";
	}
	
	@RequestMapping("insertPort.hj")
	public String insertPort(@ModelAttribute Port p, @RequestParam("file") MultipartFile file,
							HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMbId();
		p.setOcbId(id);
		
		if(!file.getOriginalFilename().equals("")) {
			String[] returnArr = saveFile(file, request);
			
			if(returnArr[1] != null) {
				p.setOcbImage(returnArr[1]);	// 리네임이자 경로
			}
		}
		
		int result = pService.insertBoard(p);
		
		if(result > 0) {
			return "redirect:portList.hj";
		} else {
			deleteFile(p.getOcbImage(), request);
			throw new PortException();
		}
	}


	private String[] saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadPort";
		
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(time) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}


	private void deleteFile(String ocbImage, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "\\uploadPort";
		File f = new File(savePath + "\\" + ocbImage);
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 상세페이지 화면 - 해당 게시글 정보, 게시글에 달린 댓글
	// 조회수 관리를 위해 로그인세션 유저 정보도 필요.	- 비회원인 경우도 생각하려면 null도 고려
	@RequestMapping("portDetail.hj")
	public String portDetail(@RequestParam("bId") int ocbNo, @RequestParam("page") int page,
							HttpSession session, Model model) {
		
		// 로그인 유저 확인 및 해당되면 아이디를 넘기기(조회수관리)
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		
		if(loginUser != null) {
			id = loginUser.getMbId();
		}
		
		Port p = pService.selectPortDetail(ocbNo, id);
		ArrayList<Reply> list = pService.selectReply(ocbNo);
		
		if(p != null) {
			model.addAttribute("p", p);
			model.addAttribute("page", page);
			model.addAttribute("list", list);
			
			return "portDetail";
		} else {
			throw new PortException("첨부파일 게시글 상세보기를 실패하였습니다.");
		}
	}
	
	@RequestMapping("updatePortGo.hj")
	public ModelAndView updatePort(@RequestParam("ocbNo") int ocbNo, @RequestParam("page")int page,
							ModelAndView mv) {
		// 수정화면은 현재 페이지의 정보들을 뿌리면서 화면을 보여줘야함
		// 그래서 정보프라이머리키 ocbNo를 받아서 데이터 가져올거임 (이전에 만들어놓은 메소드 활용 가능)
		Port p = pService.selectPortDetail(ocbNo, null);	// 이 때 두 번째 매개변수는 조회수 검사를 위한 세션아이디이었음. 지금은 보내기 x
		
		mv.addObject("p", p);
		mv.addObject("page", page);
		mv.setViewName("portEdit");
		
		return mv;
	}
	
	@RequestMapping("updatePort.hj")
	public String updatePortBoard(@ModelAttribute Port p, @RequestParam("ocbImage") String ocbImage,
								  MultipartFile file, HttpServletRequest request,
								  @RequestParam("page") int page, Model model) {
		
		// 만약 file을 검사했을 때 filename이 비어있다면 file이 없는거
		// 있다면 file이 존재하니까 교체 작업 진행
		
		// 넘어온 파일이 있다면
		if(!file.getOriginalFilename().equals("")) {
			// 넘어온 파일 리네임하고
			String[] returnArr = saveFile(file, request);
			if(returnArr[1] != null) {
				p.setOcbImage(returnArr[1]);	// 리네임이자 경로
			}
			// 서버 저장소에서 기존 사진도 삭제하고
			deleteFile(ocbImage, request);
		}

		int result = pService.updatePort(p);
		
		if(result > 0) {
			model.addAttribute("bId", p.getOcbNo());
			model.addAttribute("page", page);
			return "redirect:portDetail.hj";
		} else {
			throw new PortException("포트폴리오 게시판 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("deletePort.hj")
	public String deletePort(@RequestParam("ocbImage") String ocbImage,
							@RequestParam("page") int page, @RequestParam("ocbNo") int ocbNo,
							Model model) {
		int result = pService.deletePort(ocbNo);
		
		if(result > 0) {
			model.addAttribute("page", page);
			return "redirect:portList.hj";
		} else {
			throw new PortException("포트폴리오 게시판 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="insertReply.hj")
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {
		int result = pService.insertReply(r);
		
		ArrayList<Reply> list = pService.selectReply(r.getOcrOcbNo());
		
		// 지슨빌더 객체 생성 -> 지슨 객체 생성
		GsonBuilder gb = new GsonBuilder();
		gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="updateReply.hj")
	public void updateReply(@ModelAttribute Reply r, HttpServletResponse response) {
		
		int result = pService.updateReply(r);
		
		r = pService.selectUpdateReply(r.getOcrNo());
		
		GsonBuilder gb = new GsonBuilder();
		gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			gson.toJson(r, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="deleteReply.hj")
	public void deleteReply(@ModelAttribute Reply r, HttpServletResponse response) {
		
		int oldReplyBoardNo = r.getOcrOcbNo();
		int result = pService.deleteReply(r);
		
		ArrayList<Reply> list = pService.selectReply(oldReplyBoardNo);
		// 지슨빌더 객체 생성 -> 지슨 객체 생성
		GsonBuilder gb = new GsonBuilder();
		gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 달력
	@RequestMapping("schedule.hj")
	public String goSchedule() {
		
		return "schedule";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
