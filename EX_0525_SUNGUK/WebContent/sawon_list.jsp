<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@page import="vo.SawonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 	<% 
    	//싱글톤을 활용한 DB연동
    	SawonDAO dao = SawonDAO.getInstance();
    	List<SawonVO> list = dao.selectList();
    	
    	//한줄로 표현 가능
    	//List<SawonVO> sawon_list = SawonDAO.getInstance().selectList();
    %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = 1>
		<caption> 사원목록 </caption>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>부서번호</th>
			<th>직책</th>
			<th>입사일자</th>
		</tr>
		
		<% for(int i=0; i<list.size(); i++) {
			SawonVO sv = list.get(i);	
		%>
		<tr>
			<td><%= list.get(i).getSabun() %></td>
			<td><%= list.get(i).getSaname() %></td>
			<td><%= list.get(i).getDeptno() %></td>
			<td><%= list.get(i).getSajob() %></td>			
			<td><%= list.get(i).getSahire() %></td>
		
		<%} %>
	</table>
</body>
</html>