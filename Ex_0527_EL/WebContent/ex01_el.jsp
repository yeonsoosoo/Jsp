<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* 
    	EL(Expression Language) : JSP에서 사용하는 표현식을 조금 더 간결하게 사용하기
    	위한 표현 언어.
    	
    	1. EL로 값을 표현하려면 4개의 영역(JSP의 내장 객체)
    	 - 기본 객체의 영역은 객체의 유효기간이라고도 불리며, 객체를 누구와 공유할 것인가를 나타낸다.
    	 
    	  (1) pageScope 영역 : 저장된 데이터를 현재 페이지에서만 공유하고 사용하는 것.
    	   - page 영역은 한번의 웹 브라우저(클라이언트)의 요청에 대해 하나의 jsp 페이지가 호출됨
    	   - 클라이언트의 요청이 들어오면 이때 단 한개의 페이지에만 대응이 된다.
    	   - 따라서 page영역은 객체를 하나의 페이지에서만 공유를 한다.
    	  
    	  (2) requestScope 영역(가장 많이 사용하는 영역) - 지역 개념으로 페이지가 닫히면 종료된다.
    	   - 같은 request 영역이면 두 개의 페이지가 같은 요청을 공유할 수 있다.
    	   - 따라서 request영역은 객체를 하나 또는 두 개의 페이지 내에서 공유할 수 있다.
    	   - 주로 페이지 모듈화에 사용된다.
    	   
    	  (3) sessionScope 영역(두번째로 많이 사용하는 영역) - 전역의 개념으로 페이지가 닫혀도 남아있다.
    	   - 톰캣이 실행될 때 자동으로 만들어지는 영역
    	   - session 영역은 하나의 엡 브라우저당 1개의 session 객체가 생성된다.
    	   - 즉, 같은 웹브라우저 내에서 요청되는 페이지들은 같은 객체를 공유하게 된다.
    	    
    	  (4) applicationScope 영역 : 최소한 내가 만든 모든 jsp에서는 값을 공유하는게 가능
    	   - application 영역은 하나의 웹 어플리케이션 당 1개의 application 객체가 생성된다.
    	   - 즉, 같은 웹 어플리케이션에 요청되는 페이지들은 같은 객체를 공유한다.
    */
    
    	String msg = "안녕";
    	  
    	//jsp를 통해서 requestScope영역에 값을 넣는다	
    	request.setAttribute("msg", "requestScope의 영역에 저장됨");
    	
    	pageContext.setAttribute("msg", "페이지영역");
    	session.setAttribute("msg", "세션2");
    	
    	session.setAttribute("msg2", "세션에 저장됨");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	jsp표현식 스크립트릿에 저장된 데이터 : <%= msg %> <br> 
	EL표현식(requestScope 데이터) : ${requestScope.msg} <br>
	EL표현식(sessionScope 데이터) : ${sessionScope.msg2 } <br>
	EL표현식(생략) : ${msg}<br>
	
	<!-- 생략시 영역 참조 순서 
		1.pageScope
		2.requestScope
		3.sessionScope
		4.applicationScope
	 -->
</body>
</html>