<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	PersonVO vo = new PersonVO();
    	vo.setName("홍길동");
    	vo.setAge(20);

    	PersonVO vo1 = new PersonVO();
    	vo1.setName("박길동");
    	vo1.setAge(30);
    	
    	request.setAttribute("vo", vo);

    	List<PersonVO> list = new ArrayList<PersonVO>();
    	list.add(vo);
    	list.add(vo1);
    	
    	request.setAttribute("list", list);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${ vo.name } 또는 ${requestScope.vo.name } <br> 
	나이 : ${ vo.age } 또는 ${requestScope.vo.age }

	<hr>
	ArrayList에 담아 출력<br>
	이름 : ${ list[0].name } <br>
	나이 : ${ list[0].age } <br>
</body>
</html>