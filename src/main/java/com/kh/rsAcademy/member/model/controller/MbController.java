package com.kh.rsAcademy.member.model.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.rsAcademy.member.model.exception.MemberException;
import com.kh.rsAcademy.member.model.service.MbService;
import com.kh.rsAcademy.member.model.vo.ClassList;
import com.kh.rsAcademy.member.model.vo.Member;



@SessionAttributes("loginUser")

@Controller
public class MbController {

	@Autowired
	private MbService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("myInfo.jy")
	public String selectBoardList(HttpSession session,Model model) {
		
		Member loginUser=(Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "redirect:logInView.dw";
		}
		ArrayList<ClassList> classList = mService.selectClassList(loginUser.getMbId());
		
		model.addAttribute("classList", classList);
		
		return "myInfo";
	}
	
	@RequestMapping("logInView.dw")
	public String memberLogin() {
		return "logIn";
	}
	
	@RequestMapping("logIn.dw")
	public String memberLogin2(@ModelAttribute Member m, Model model) {
		
		Member member = mService.logIn(m);
		
		if(member != null && bcrypt.matches(m.getMbPwd(), member.getMbPwd())) {
			model.addAttribute("loginUser", member);
			return "redirect:/";
			
		} else {
			return "logIn_Error";
		}
	}
	
	@RequestMapping("logOut.dw")
	public String logOut(SessionStatus status) {
		status.setComplete();
		return "redirect:/"; 
	}
	
	//회원가입 화면 보여주기
	@RequestMapping("enrollView.jy")
	public String enrollView() {
		return "enroll"; 
	}
	
	//회원가입 아작스
	@RequestMapping("idCheck.jy")
	@ResponseBody
	public String idCheck(@RequestParam("id")String id) {
		
		int count = mService.idCheck(id);
		
		String result = count == 0? "yes" :"no";
		
		return result;
	}
	
	//회원가입 진행
	@RequestMapping("enroll.jy")
	public String enroll(@ModelAttribute Member m,@RequestParam("sample6_postcode")String postcode,@RequestParam("sample6_address")String address,
			@RequestParam("sample6_detailAddress")String detailAddress,@RequestParam("sample6_extraAddress")String extraAddress,
			@RequestParam("tel1")String tel1,@RequestParam("tel2")String tel2,@RequestParam("tel3")String tel3) {
		
		
		String subAddress = postcode +"@"+address+"@"+detailAddress+"@"+extraAddress;
		String tel = tel1+"-"+tel2+"-"+tel3;
		m.setMbAddress(subAddress);
		m.setMbTel(tel);
		
		String encPwd = bcrypt.encode(m.getMbPwd());
		m.setMbPwd(encPwd);
		
		
		int result = mService.enroll(m);
		
		if(result > 0) {
			return "logIn"; 
		}else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	
	//수강취소,철회 관련 아작스
	@RequestMapping("classCancle.jy")
	public String classCancle(@RequestParam("CsStatus")String csStatus,@RequestParam("Id")String id,@RequestParam("CsCode")String csCode) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		System.out.println(csCode);
		map.put("CsStatus", csStatus);
		map.put("Id", id);
		map.put("CsCode", csCode);
		
		int result = mService.classCancle(map);
		
		if(result>0) {
			 return "redirect:myInfo.jy";
		}else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
		
		
	}
	
	//회원 정보 수정 진행
	@RequestMapping("updateMember.jy")
	public String updateMember(@ModelAttribute Member m,@RequestParam("sample6_postcode")String postcode,@RequestParam("sample6_address")String address,
				@RequestParam("sample6_detailAddress")String detailAddress,@RequestParam("sample6_extraAddress")String extraAddress,
				@RequestParam("tel1")String tel1,@RequestParam("tel2")String tel2,@RequestParam("tel3")String tel3,@RequestParam("changePwd")String changePwd,Model model) {
			
			
			String subAddress = postcode +"@"+address+"@"+detailAddress+"@"+extraAddress;
			String tel = tel1+"-"+tel2+"-"+tel3;
			m.setMbAddress(subAddress);
			m.setMbTel(tel);
			
			
			String encPwd = bcrypt.encode(m.getMbPwd());
			m.setMbPwd(encPwd);
			
			if(changePwd != "") {
				encPwd = bcrypt.encode(changePwd);
				m.setMbPwd(encPwd);
			}
			
			
			
			int result = mService.updateMember(m);
			
			if(result> 0) {
				model.addAttribute("loginUser", m);
				return "redirect:myInfo.jy";
			}else {
				throw new MemberException("정보 수정에 실패하였습니다.");
			}
		
	}
	//회원탈퇴 진행
	@RequestMapping("deleteMember.jy")
	public String deleteMember(@RequestParam("Id")String id,SessionStatus status) {
		int result = mService.deleteMember(id);
		status.setComplete();
		if(result>0) {
			return "redirect:/";
		}else {
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("adminMember.jy")
	public String adminMember(Model model) {
		
		//회원 전체 리스트
		ArrayList<Member> list = mService.memberList();
		
		
		//강의 리스트 전체
		ArrayList<ClassList> classList = mService.allClassList();
		
		model.addAttribute("list", list);
		model.addAttribute("classList", classList);
		
		return "adminMember";
	}
	
	
	@RequestMapping(value = "updateMemberList.jy", method=RequestMethod.POST)
	public String updateMemberList(@RequestParam(value = "checkMember", defaultValue="")String checkMember,
			@RequestParam(value = "checkClassList" ,defaultValue="")String checkClassList) {
	
		int memberResult=0;
		int classResult=0; 
		
		//멤버가 null이 아닌 경우에만 진행
		if(!checkMember.equals("")) {
			//멤버 별로 나누기 
			String[] mbids=checkMember.split(",");
			
			//멤버 별 요소
			for(int i=0;i<mbids.length;i++) {
				
				String[] element = mbids[i].split("#");
				System.out.println(element[0]);
				Member m = new Member();
				m.setMbId(element[0]);
				m.setMbName(element[1]);
				m.setMbEmail(element[2]);
				m.setMbStatus(element[3]);
				m.setMbIsAdmin(element[4]);
				
				memberResult += mService.adminUpdateMember(m);
			}
		}
		
		//클래스 변화가 있을 때만 진행
		if(!checkClassList.equals("")) {
			//클래스별로 나누기
			String[] classes=checkClassList.split(",");
			for(int j=0;j<classes.length;j++) {
				String[] classElement = classes[j].split("#");
				
				ClassList cl=new ClassList();
				cl.setCsNo(Integer.parseInt(classElement[2]));
				cl.setCsStatus(classElement[1]);
				classResult += mService.adminUpdateClassList(cl); 
			}
		}
		
		return "redirect:adminMember.jy";
	}
		
	  @RequestMapping("findIdView.dw")
	   public String findIdView() {
	      return "findId";
	   }
	   
	   @RequestMapping("findPwdView.dw")
	   public String findPwdView() {
	      return "findpwd";
	   }
	   
	   @RequestMapping("findId.dw")
	   public String findId(@ModelAttribute Member m, Model model) {
	      Member result = mService.findId(m);
	      //System.out.println(result);
	      
	      if(result != null) {
	         model.addAttribute("result", result);
	         return "resultFindId";
	      } else {
	         model.addAttribute("result", result);
	         return "resultFindId";
	      }
	   }
	   
	   
	   
	    @RequestMapping("pwdCheck.jy")
		@ResponseBody
		public String pwdCheck(HttpSession session,@RequestParam("pwd")String pwd) {
			
		   Member loginUser=(Member)session.getAttribute("loginUser");
			
		   if(loginUser != null && bcrypt.matches(pwd, loginUser.getMbPwd())) {
				return "yes";
				
			} else {
				return "no";
			}
		}
		
		
	
}
