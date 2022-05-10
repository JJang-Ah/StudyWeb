<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 처리</title>
</head>
<body>

<%
String realFolder = "";
//String saveFolder = "/fileSave"; // 파일이 업로드되는 폴더
String encType = "utf-8"; 		// 인코딩 방식: utf-8
int maxSize = 1024 * 1024 * 5;	// 1024Byte = 1kB, 1kB * 1024 = 1MB, 1MB * 5  = 5MB, 업로드하는 파일의 크기

// 파일이 실제로 저장되는 위치 
// 문제점 -> tomcat이 관리하고 있어서 저장된 이미지 파일을 읽어서 사용할 수 없음
//ServletContext context = getServletContext();
//realFolder = context.getRealPath(saveFolder);

// 해결책 -> 접근 가능한 저장경로 변경
realFolder = "C:/Users/tw5hy/바탕 화면/이젠 아카데미/images_ezenmall";
out.print("realFolder 위치: " + realFolder + "<br>");

/*
cos.jar : 파일 업로드 처리를 위한 라이브러리
MultipartRequest: 파일 업로드 처리를 위한 클래스, request 역할을 함.
DefaultFileRenamePolicy: 같은 이름의 파일을 업로드할 때 자동으로 뒤에 1씩 증가되는 번호를 붙여서 업로드하도록 하는 클래스
*/

try {
	MultipartRequest mr = new MultipartRequest(request, realFolder, maxSize, encType
			, new DefaultFileRenamePolicy());
	
	// 
	out.print("---------------------------<br>");
	Enumeration<?> params = mr.getParameterNames(); // ?는 어떤 파라미터든지 받는다는 의미이다. 
	while(params.hasMoreElements()) {
		String name = (String)params.nextElement();
		String value = mr.getParameter(name);
		out.print("name: " + name + ", value: " + value + "<br>");
	}
	out.print("---------------------------<br>");

	// 실제 업로드한 파일 정보를 출력
	Enumeration<?> files = mr.getFileNames();
	while(files.hasMoreElements()) {
		String name = (String)files.nextElement();
		
		// 원본 파일이름
		String originFileName = mr.getOriginalFileName(name);
		// 서버에 저장된 파일이름
		String saveFileName = mr.getFilesystemName(name);
		// 업로드되는 파일 타입
		String fileType = mr.getContentType(name);
		
		// 업로드되는 파일의 정보 출력
		out.print("파라미터 이름: " + name + "<br>");
		out.print("원본 파일 이름: " + originFileName + "<br>");
		out.print("저장 파일 이름: " + saveFileName + "<br>");
		out.print("업로드 파일 타입: " + fileType + "Byte <br>");
		
		// 파일 크기
		File file = mr.getFile(name);
		if(file != null) out.print("파일 크기: " + file.length() + "Byte<br>");
		
	}
} catch(Exception e) {
	e.printStackTrace();
} finally {
	
}


%>
</body>
</html>