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
public class memberController {
	
	@Autowired
	private MemberService memberService;

	// 로그인 처리(폼으로 화면이동) -> GET
	//@RequestMapping(value="/login.do", method=RequestMethod.GET)
	@GetMapping(value="/login.do") // 위와 같은 기능
	public String login() {
		System.out.println("=> memberController - 로그인 화면이동");
		return "login.jsp";
	}
	
	// 로그인 처리(DB 처리) -> POST
	//@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@PostMapping(value="/login.do") // 위와 같은 기능
	public String login(MemberDTO dto, HttpSession session) {
		System.out.println("=> LogonController - 로그인 처리(DB 처리)");

		// 아이디를 입력하지 않았을 때 예외 발생
		if(dto.getId() == null || dto.getId().equals("")) {
			return "login.jsp";
		}
		
		// 비밀번호를 입력하지 않았을 때 예외 발생
		if(dto.getPassword() == null || dto.getPassword().equals("")) {
			return "login.jsp";
		}
		
		MemberDTO member = memberService.getMember(dto);
		if(member != null) {
			session.setAttribute("member", member);
			return "redirect:getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		System.out.println("=> memberController - 로그아웃 처리");
		session.invalidate();
		return "redirect:login.do";
	}
	
	//#################################333
	// 회원가입, 수정, 삭제, 상세확인
	@GetMapping("/insertMember.do")
	public String insertMember() {
		System.out.println("=> memberController - 회원가입화면 이동");
		return "insertMember.jsp";
	}
	
	@PostMapping("/insertMember.do")
	public String insertMember(MemberDTO dto, HttpSession sessoin) {
		System.out.println("=> memberController - 회원가입 처리(DB)");
		
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
		System.out.println("=> memberController - 회원정보 확인");
		model.addAttribute("member", memberService.getMember(dto));
		return "getMember";
	}
}
