<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Test 01</title>
</head>
<body>
<%--
1. EL (Expression Language), 표현 언어
- JSP 2.0 버전에서부터 지원되는 특수한 형태의 스크립트 엄어
- 여러 속성값들을 JSP 스크립트보다 함축적인 코드를 통해서 간결하고, 편리하게 사용할 수 있어서 널리 사용

2. EL의 기능
- JSP 영역객체(pageContenxt, request, session, application)각 제공하는 속성을 사용할 수 있음.
- 수치 연산 관계 연산, 논리 연산에 필요한 연산자를 제공함.
- 자바 클래스 메소드 호출 기능 제공
- 쿠키, 기본 객체의 속성 등 JSP를 사용하기 위한 EL의 기본 객체를 제공
- 람다식을 이용한 함수 정의와 실행 (EL 3.0)
- 스트림 API를 통한 컬렉션 처리 (EL 3.0)
- 정적 메소드 실행 (EL 3.0)

3. EL의 예시
- 예) Member 클래스의 객체인 member의 address변수의 값을 출력
- expression(표현식): <%=member.getAddress() %>
- EL: ${member.address}

4. EL의 데이터 타입: 정수, 실수, 문자열, boolean, null의 5가지 데이터 타입
- 정수: 0~9로 이루어진 값,
- 실수: 0~9로 이루어진 값, 소수점(.)을 사용할 수 있음
- 문자열: 쌍따옴표("")로 둘러싼 값
- boolean: true, false의 값
- null: null 값

5. EL에서 사용할 수 있는 기본 객체
- pageContext: JSP의 내장객체인 pageContext와 동일
- pageScope: pageContext 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저자한 Map 객체 
- requestScopte: request 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장하는 Map 객체
- sessionScope: session 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장하는 Map 객체
- applicationScope: application  기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장하는 Map 객체

6. EL에서 사용할 수 있는 기본 객체 2
- param: 요청 파라미터의 <이름, 값> 매핑을 저장한 Map 객체, 파라미터의 값 타입은 String 타입
ex) expression: <%=request.getParameter(name) %>
	EL: %{requestScope.name}
- paramValues: 요청 파라미터의 <헤더이름, 값>을 매핑을 저장한 Map 객체, 파라미터의 갑 타입은 String[]
- header: 요청 정보의 <헤더이름, 값> 매핑을 저장한 Map 객체
- headerValues: 요청 정보의 <헤더이름, 값의 배열> 매핑을 저장한 Map 객체, 
- initParam: 초기화 파라미터의 <이름, 값> 매핑을 저장한 Map 객체, 
 --%>
 
 <h3>JSP 기본 스크립트 언로드로 출력</h3>
 전달받은 데이터: <%=request.getParameter("data") %><br><br><br>
 
 <h3>EL을 사용하여 출력</h3>
 전받은 데이터: ${param.data }<br><br><br>

</body>
</html>