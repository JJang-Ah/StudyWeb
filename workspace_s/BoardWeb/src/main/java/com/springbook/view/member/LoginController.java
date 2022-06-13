package com.springbook.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springbook.biz.member.MemberDTO;
import com.springbook.biz.member.impl.MemberDAO;

public class LoginController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 직접 만든 컨트롤러는 String이 리턴값이었지만
		// spring에서 제공하는 컨트롤러에서는 ModelAndView이다.
		
		System.out.println("로그인 처리");
		// 1. 클라이언트의 입력정보를 획득
		String memberid = request.getParameter("id");
		String pwd = request.getParameter("password");
		// 2. 객체 생성 및 DB 연동
		MemberDTO dto = new MemberDTO();
		dto.setId(memberid);
		dto.setPassword(pwd);
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = memberDAO.getMember(dto);

		// 3. 화면 이동 제어
		// ModelAndView 클래스 - 모델과 뷰를 함께 저장하는 클래스
		// redirect: ViewResolver를 무시하고 redirct를 실행함.
		ModelAndView mav = new ModelAndView();
		if(member != null) {
			mav.addObject("memberId", member.getId());
			mav.setViewName("redirect:getBoardList.do");
		} else {
			mav.setViewName("redirect:login.jsp");
		}		
		return mav;
	}

	
}
