package com.kh.rsAcademy.classes.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.rsAcademy.classes.model.exception.ClassesException;
import com.kh.rsAcademy.classes.model.service.ClService;
import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;
import com.kh.rsAcademy.notice.model.exception.NoticeException;

@Controller
public class ClController {

	@Autowired
	ClService cService;
	
	@RequestMapping("clListView.yh")
	public String classList(Model model) {		
		
		ArrayList<Classes> list = cService.seletBoardList();	
		ArrayList<Member> member = cService.writeClassclId();	
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("member", member);
			return "clListView";
		} else {
			throw new ClassesException("강의 조회 목록에 실패했습니다.");
		}
		
	}
	
	
	@RequestMapping("clListAdmin.yh")
	public String clListAdmin(Model model) {		
		
		ArrayList<Classes> list = cService.seletBoardList();		
		
		if(list != null) {
			model.addAttribute("list", list);
			return "clListAdmin";
		} else {
			throw new ClassesException("강의 목록 조회에 실패했습니다.");
		}

	}
	
	
	@RequestMapping("writeClass.yh")
	public String writeClass(Model model) {		
		
		ArrayList<Member> member = cService.writeClassclId();			
		
		if(member != null) {
			model.addAttribute("member", member);
			return "clWrite";
		} else {
			throw new ClassesException(" 실패했습니다.");
		}
		
	}
	
	
	@RequestMapping("insertClass.yh")
	public String insertClass(@RequestParam("file") MultipartFile file, HttpServletRequest request,
							  @ModelAttribute Classes cl) {	
		
		if(!file.getOriginalFilename().equals("")) {
			String[] returnArr = saveFile(file, request);
			
			if(returnArr[1] != null) {
				cl.setClImage(returnArr[1]);
			}
		}
		
		int result = cService.insertClass(cl);
		
		if(result > 0) {
			return "redirect:clListAdmin.yh";
		} else {
			deleteFile(cl.getClImage(), request);
			throw new ClassesException("강의 등록에 실패했습니다.");
		}
		
	}
	
	
	private String[] saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadClassPic";
		
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
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "\\uploadClassPic";
		File f = new File(savePath + "\\" + ocbImage);
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	@RequestMapping("updateForm.yh")
	public String updateFormClass(@RequestParam("clNo") int clNo, Model model) {	
		Classes c = cService.updateFormClass(clNo);
		ArrayList<Member> member = cService.writeClassclId();	
		
		model.addAttribute("member", member);
		model.addAttribute("c", c);
		
		return "clEdit";
	}	
	

	
	@RequestMapping("updateClass.yh")
	public String updateClass(@RequestParam("clImage") String clImage, 
							  MultipartFile file, HttpServletRequest request,
							  @ModelAttribute Classes cl) {	
		
		if(!file.getOriginalFilename().equals("")) {
			String[] returnArr = saveFile(file, request);
			
			if(returnArr[1] != null) {
				cl.setClImage(returnArr[1]);
			}
			deleteFile(clImage, request);
		}
		
		int result = cService.updateClass(cl);	
		
		if(result > 0) {
			return "redirect:clListAdmin.yh";
		} else {
			deleteFile(cl.getClImage(), request);
			throw new ClassesException("강의 수정에 실패했습니다.");
		}
	}
	
	
	@RequestMapping("deleteClass.yh")
	public String deleteClass(@RequestParam("clNo") int clNo) {
		int result = cService.deleteClass(clNo);
		
		if(result > 0) {
			return "redirect:clListAdmin.yh";
		} else {
			throw new ClassesException("강의 삭제에 실패했습니다.");
		}
	}
		
	
	@RequestMapping("searchClass.yh")
	public String searchClass(@ModelAttribute Classes cl, Model model) {			
				
		String clCategory = cl.getClCategory();
		String clLevel = cl.getClLevel();		
		
		String ct = clCategory.trim();
		String lv = clLevel.trim();
		
		if( (clCategory == "")&&(clLevel == "") ) {
			
			return "redirect:clListView.yh";
			
		} else if(!(clCategory == "")&&(clLevel == "")){			
			
			ArrayList<Classes> list = cService.searchClass1(ct);			
			
			model.addAttribute("list", list);
			
			return "clListView";
			
		} else if((clCategory == "")&&!(clLevel == "")) {
			
			ArrayList<Classes> list = cService.searchClass2(lv);
			
			model.addAttribute("list", list);
			
			return "clListView";
			
		} else {

			cl.setClLevel(lv);
			cl.setClCategory(ct);
			
			ArrayList<Classes> list = cService.searchClass3(cl);
			
			model.addAttribute("list", list);
			
			return "clListView2";
		}		
	
	}
	
	
	@RequestMapping("selectClass.yh")
	public String selectClass(@RequestParam("clNo") int clNo, Model model, HttpSession session) {			
		
		ArrayList<ClassList> classList = cService.classList();			
		
		Member loginUser=(Member)session.getAttribute("loginUser");		
		
		
		ArrayList<Classes> list = cService.selectClass(clNo);
		
		if(list != null) {
			model.addAttribute("clNo", clNo);
			model.addAttribute("list", list);
			model.addAttribute("classList", classList);
			
			return "clListDetail";
		} else {
			throw new ClassesException("리스트를 불러 올 수 없습니다");
		}
	}
		
	
	
	@RequestMapping("classApply.yh")
	public String classApply(@RequestParam("clNo") int clNo, Model model, HttpSession session) {	
		
		Member loginUser=(Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "redirect:logInView.dw";
		}
		
		String isAdmin = loginUser.getMbIsAdmin();		
		String id = loginUser.getMbId();		
		
		if(isAdmin.equals("3")) {
			
			Classes c = cService.updateFormClass(clNo);
			ArrayList<Member> member = cService.writeClassclId();	
			
			model.addAttribute("member", member);
			model.addAttribute("c", c);			
			
			return "clEdit";			
			
		} else if(isAdmin.equals("2")) {			
			
			System.out.println("강사");
			
			throw new ClassesException(" 실패했습니다.");			
		} else if(isAdmin.equals("1")) {

			HashMap<String, Comparable> map = new HashMap<String, Comparable>();
			map.put("csCode", clNo);
			map.put("csId", id);
			
			int result = cService.classApply(map);
			
			if(result > 0) {
				return "redirect:clListView.yh";
			} else {
				throw new ClassesException("수강 신청에 실패했습니다.");
			}
		} else {					
			throw new ClassesException("수강 신청에 실패했습니다.");
		}

	}	
	

}
