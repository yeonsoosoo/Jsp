<%@page import="vo.GogekVo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	InitialContext ic = new InitialContext();
		Context ctx = (Context)ic.lookup("java:comp/env");
		DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
		Connection conn = dataSource.getConnection();
	
		String sql = "select * from gogek";
		
		//문자열로된 쿼리문을 진짜 쿼리문으로 인식하게 해주는 객체
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//실행된 sql문장을 통해
		ResultSet rs = pstmt.executeQuery();
		
		List<GogekVo> gogek_list = new ArrayList<GogekVo>();
		
		//한행씩 읽기
		while(rs.next()) {
			GogekVo vo = new GogekVo();
			
			//현재 필드값을 vo에 담는다.
			vo.setGobun(rs.getInt("gobun"));
			vo.setGodam(rs.getInt("godam"));
			vo.setGoname(rs.getString("goname"));
			vo.setGoaddr(rs.getString("goaddr"));
			vo.setGojumin(rs.getString("gojumin"));
			
			gogek_list.add(vo);
		}
		//DB접속과 관련된 모든 객체는 생성된 역순으로 반드시 닫아주자.
		rs.close();
		pstmt.close();
		conn.close();
    
	%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = 1>
		<tr>
			<th>고객번호</th>
			<th>고객이름</th>
			<th>고객주소</th>
			<th>주민등록번호</th>
			<th>담당자번호</th>
		</tr>
		
		<% for(int i=0; i<gogek_list.size(); i++) { 
			GogekVo gv = gogek_list.get(i); %>
			<tr>
				<td><%= gv.getGobun() %></td>
				<td><%= gv.getGoname() %></td>
				<td><%= gv.getGoaddr() %></td>
				<td><%= gv.getGojumin() %></td>
				<td><%= gv.getGodam() %></td>
				
			</tr>
		<%} %>
</body>
</html>