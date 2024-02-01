package com.kh.rsAcademy.classes.level.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.rsAcademy.classes.level.model.exception.LevelException;
import com.kh.rsAcademy.classes.level.model.service.LevelService;
import com.kh.rsAcademy.classes.level.model.vo.LevelTest;
import com.kh.rsAcademy.classes.model.vo.Classes;
import com.kh.rsAcademy.common.Pagination;
import com.kh.rsAcademy.common.model.vo.PageInfo;
import com.kh.rsAcademy.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class LevelController {
	
	@Autowired
	private LevelService lService;
	
	@RequestMapping("levelTestExplanation.rs")
	public String golevelTestExplanation() {
		return "levelTestExplanation";
	}
	
	@RequestMapping("levelTest.rs")
	public String levelTest(Model model) {
		
		ArrayList<LevelTest> list = lService.selectList();
		
		if(list != null) {
			model.addAttribute("list", list);
			return "levelTest";
		} else {
			throw new LevelException("레벨테스트 실행에 실패했습니다.");
		}
	}
	
	@RequestMapping("levelTestResult.rs")
	public String levelTestResult(HttpSession session,
								  @RequestParam("ltAnswer") int[] answerArr, // 정답 받아온 배열
								  HttpServletRequest request, // for문을 돌려 parameter를 받아오기 위해 request 추가
								  Model model
									) {
		// 로그인 정보 불러오기
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		// 사용자가 입력한 답 userAnswer1 ~ userAnswer20에 받아와서
		// int[] userAnswer에 넣기
		int[] userAnswer = new int[answerArr.length];
		for (int i = 0; i < answerArr.length; i++) {
			userAnswer[i] = Integer.parseInt(request.getParameter("userAnswer" + (i + 1)));
		}
		
		// 사용자가 입력한 값과 정답이 일치할 경우 변수 score ++
		int score = 0; 
		for (int i = 0; i < answerArr.length; i++) {
			if (userAnswer[i] == answerArr[i]) {
				score++;
			}
		}
		
		// 한문제당 5점씩 총점 100점 기준으로 계산
		// 점수 결과 기준으로 80점 이상은 A, 60점 이상 80점 미만은 B, 60점 미만은 C 레벨 측정
		int resultNum = score * 5;
		String level = null;
		if(resultNum >= 80) {
			level = "A";
		} else if(60 <= resultNum && resultNum > 80) {
			level = "B";
		} else {
			level = "C";
		}
		
		loginUser.setMbLevel(resultNum); // 결과 점수
		int result = lService.updateMemberLevel(loginUser);
		
		// 결과 저장하고 다시 아이디 가져오기
		
		
		// 점수 결과 페이지에 추천할 클래스를 보내기 위해 classes list 받아오기
		ArrayList<Classes> list = lService.selectClassesList();
		
		Classes koClass = null; // 한식 추천 클래스
		Classes jeClass = null; // 일식 추천 클래스
		Classes weClass = null; // 양식 추천 클래스
		Classes baClass = null; // 베이커리 추천 클래스
		
		//받아온 classes list를 for문을 돌려 결과로 나온 레벨과 카테고리 동일한 클래스 classes 객체에 저장
		for(Classes c : list) {
			if(c.getClLevel().equals(level) && c.getClCategory().equals("한식")) {
				koClass = c;
			} else if(c.getClLevel().equals(level) && c.getClCategory().equals("일식")) {
				jeClass = c;
			} else if(c.getClLevel().equals(level) && c.getClCategory().equals("양식")) {
				weClass = c;
			} else if(c.getClLevel().equals(level) && c.getClCategory().equals("베이커리")) {
				baClass = c;
			}
		}
		
		// 저장한 classes 객체 함께 전달
		if(result > 0 && list != null) {
			model.addAttribute("resultNum", resultNum);
			model.addAttribute("koClass", koClass);
			model.addAttribute("jeClass", jeClass);
			model.addAttribute("weClass", weClass);
			model.addAttribute("baClass", baClass);
			model.addAttribute("loginUser", loginUser);
			return "levelTestResult";
		} else {
			throw new LevelException("레벨테스트 결과 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("levelTestManagement.rs")
	public String golevelTestManagement(@RequestParam(value="page", defaultValue="1") int page,
										Model model) {
		
		int listCount = lService.getListCount();
		
		int currentPage = page;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<LevelTest> list = lService.selectAllList(pi);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "levelTestManagement";
		} else {
			throw new LevelException("레벨테스트 조회에 실패했습니다.");
		}
	}
	
	@RequestMapping("insertLevelTest.rs")
	public String insertLevelTest(@ModelAttribute LevelTest l) {
		
		int result = lService.insertLevelTest(l);
		
		if(result > 0) {
			return "redirect:levelTestManagement.rs";
		} else {
			throw new LevelException("레벨테스트 추가에 실패했습니다.");
		}
	}
	
	@RequestMapping("goEditLevelTest.rs")
	public String editLevelTest(@RequestParam("ltNo") int ltNo,
									Model model) {
		
		LevelTest l = lService.selectLevelTest(ltNo);
		
		if(l != null) {
			model.addAttribute("l", l);
			return "LevelTestEdit";
		} else {
			throw new LevelException("레벨테스트 수정페이지 조회에 실패했습니다.");
		}
	}
	
	@RequestMapping("updateLevelTest.rs")
	public String updateLevelTest(@ModelAttribute LevelTest l) {
		
		int result = lService.updateLevelTest(l);
		
		if(result > 0) {
			return "redirect:levelTestManagement.rs";
		} else {
			throw new LevelException("레벨테스트 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("deleteLevelTest.rs")
	public String deleteLevelTest(@RequestParam(value="page", defaultValue="1") int page,
								  @RequestParam("ltNo") int[] ltNoArr) {
		
		int listCount = lService.getListCount();
		
		if(listCount - ltNoArr.length >= 20) {
			int result = lService.deleteLevelTest(ltNoArr);
			
			if(result > 0) {
				return "redirect:levelTestManagement.rs";
			} else {
				throw new LevelException("레벨테스트 삭제에 실패하였습니다.");
			}
		} else {
			throw new LevelException("레벨테스트 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("searchLevelTest.rs")
	   public String searchLevelTest(@RequestParam(value="search", required = false) String search, 
	                          @RequestParam(value="page", defaultValue="1") int page,
	                          Model model) {
	      
	      int listCount = lService.getSearchListCount(search);
	      
	      int currentPage = page;
	      PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
	      
	      ArrayList<LevelTest> list = lService.searchLevelTest(search, pi);
	      
	      if(list != null) {
	         if(!list.isEmpty()) {
	            model.addAttribute("pi", pi);
	            model.addAttribute("list", list);
	            model.addAttribute("search", search);
	            return "levelTestManagement";
	         } else {
	            return "levelTestManagement";
	         }
	      } else {
	         throw new LevelException("레벨테스트 검색 결과 조회에 실패하였습니다.");
	      }
	   }
	
	
	
}
