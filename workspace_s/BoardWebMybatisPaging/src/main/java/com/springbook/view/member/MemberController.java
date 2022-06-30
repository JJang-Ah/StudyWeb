package com.springbook.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.member.MemberDTO;
import com.springbook.biz.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//######################################## 
	// 로그인, 로그아웃

	// 로그인 처리(폼으로 화면이동) -> GET
	//@RequestMapping(value="/login.do", method=RequestMethod.GET)
	@GetMapping(value="/login.do")
	public String login(HttpSession session) {
		System.out.println("=> MemberController - 로그인 화면이동");
		session.invalidate();
		return "login.jsp";
	}
	
	// 로그인 처리(DB 처리) -> POST
	//@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@PostMapping(value="/login.do")
	public String login(MemberDTO dto, HttpSession session) {
		System.out.println("=> MemberController - 로그인 처리(DB 처리)");
		
		if(dto.getId().equals("")) return "login.jsp";
		if(dto.getPassword().equals("")) return "login.jsp";
		
		MemberDTO member = memberService.loginMember(dto);
		if(member != null) {
			session.setAttribute("member", member);
			return "redirect:getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		System.out.println("=> MemberController - 로그아웃 처리");
		session.invalidate();
		return "redirect:login.do";
	}
	
	//######################################## 
	// 회원아이디 중복 체크, 회원가입, 수정, 삭제, 상세확인
	
	@RequestMapping("/checkIdMember.do")
	public String checkIdMember(MemberDTO dto, Model model, HttpSession session) {
		System.out.println("=> MemberController - 회원아이디 중복 체크");
		session.setAttribute("checkId", dto.getId());
		session.setAttribute("checkMember", memberService.checkIdMember(dto));
		model.addAttribute("member", memberService.checkIdMember(dto));
		return "insertMember.jsp";
	}
	
	@GetMapping("/insertMember.do")
	public String insertMember() {
		System.out.println("=> MemberController - 회원가입화면 이동");
		return "insertMember.jsp";
	}
	
	@PostMapping("/insertMember.do")
	public String insertMember(MemberDTO dto) {
		System.out.println("=> MemberController - 회원등록 처리(DB)");
		
		if(dto.getId().equals("")) return "insertMember.jsp";
		if(dto.getPassword().equals("")) return "insertMember.jsp";
		if(dto.getName().equals("")) return "insertMember.jsp";
		if(dto.getEmail().equals("")) return "insertMember.jsp";
		if(dto.getTel().equals("")) return "insertMember.jsp";
		if(dto.getAddress().equals("")) return "insertMember.jsp";
		
		memberService.insertMember(dto);
		return "login.jsp";
	}
	
	@RequestMapping("/getMember.do")
	public String getMember(MemberDTO dto, Model model) {
		System.out.println("=> MemberController - 회원정보확인");
		model.addAttribute("member", memberService.getMember(dto));
		return "getMember.jsp";
	}
	
	@RequestMapping("/updateMember.do")
	public String updateMember(MemberDTO dto) {
		System.out.println("=> MemberController - 회원정보수정");
		memberService.updateMember(dto);
		return "getMember.do";
	}
	
	@RequestMapping("/deleteMember.do")
	public String deleteMember(MemberDTO dto) {
		System.out.println("=> MemberController - 회원정보삭제(회원탈퇴)");
		memberService.deleteMember(dto);
		return "login.jsp";
	}
	
}
