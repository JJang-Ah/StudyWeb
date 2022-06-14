package com.springbook.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.member.MemberDTO;
import com.springbook.biz.member.impl.MemberDAO;

@Controller
public class LogonController {

	// 로그인 처리(폼으로 화면이동) -> GET
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		System.out.println("로그인 화면이동");
		return "login.jsp";
	}
	
	// 로그인 처리(DB 처리) -> POST
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(MemberDTO dto, MemberDAO memberDAO, HttpSession session) {
		System.out.println("로그인 처리(DB 처리)");
		MemberDTO member = memberDAO.getMember(dto);
		if(member != null) {
			session.setAttribute("memberId", member.getId());
			return "getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");
		session.invalidate();
		return "login.jsp";
	}
}
