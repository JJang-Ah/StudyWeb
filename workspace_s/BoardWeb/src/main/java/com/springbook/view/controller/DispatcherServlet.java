package com.springbook.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.impl.BoardDAO;
import com.springbook.biz.member.MemberDTO;
import com.springbook.biz.member.impl.MemberDAO;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	
	@Override
	public void init() throws ServletException {
		handlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./");
		viewResolver.setSuffix(".jsp");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 처리
		request.setCharacterEncoding("utf-8");
		
		// 1. 클라이언트의 요청 정보를 통해 *.do를 추출
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		// System.out.println("uri: " + uri);
		// System.out.println("path:" + path);
		
		// 2. HandlerMapping에서 path에 해당하는 Controller를 찾음
		Controller ctrl =  handlerMapping.getController(path);
		
		// 3. 검색한 Controller를 실행
		String viewName = ctrl.handleRequest(request, response);
		
		// 4. ViewResolver를 통해서 완전한 viewName을 생성
		String view = null;
		if(!viewName.contains(".do")) { // .do로 끝나지 않는다면 
			view = viewResolver.getView(viewName);
		} else {			// .do를 포함 한다면
			view = viewName;
		}
		
		// 5. 화면 이동
		response.sendRedirect(view);
		
	}
	
}
