<%@page import="vo.SawonVO"%>
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
    
    <!-- 디비 연동 및 어레이리스트에 담는 작업  -->
    <%
		InitialContext ic = new InitialContext();
		Context ctx = (Context)ic.lookup("java:comp/env");
		DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
		Connection conn = dataSource.getConnection();
		
		//부서번호를 파라미터를 통해 가져옴.(파라미터는 string으로 전달되므로 int형 변환)
		int no = Integer.parseInt(request.getParameter("deptno"));
		
   		String sql = "select * from sawon where deptno = " + no;
   		
   		//문자열로된 쿼리문을 진짜 쿼리문으로 인식하게 해주는 객체
   		PreparedStatement pstmt = conn.prepareStatement(sql);
   		
   		//실행된 sql문장을 통해
   		ResultSet rs = pstmt.executeQuery();
   		
   		List<SawonVO> sawon_list = new ArrayList<SawonVO>();
   		
   		//한행씩 읽기
   		while(rs.next()) {
   			SawonVO vo = new SawonVO();
   			
   			//현재 필드값을 vo에 담는다.
   			vo.setDeptno(rs.getInt("deptno"));
   			vo.setSabun(rs.getInt("sabun"));
   			vo.setSaname(rs.getString("saname"));
   			vo.setSajob(rs.getString("sajob"));
   			
   			sawon_list.add(vo);
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
			<th>부서번호</th>
			<th>사번</th>
			<th>직책</th>
			<th>사원이름</th>
		</tr>
		
		<% for(int i=0; i<sawon_list.size(); i++) { 
			SawonVO sv = sawon_list.get(i); %>
			<tr>
				<td><%= sv.getDeptno() %></td>
				<td><%= sv.getSabun() %></td>
				<td><%= sv.getSajob() %></td>
				<td><%= sv.getSaname() %></td>
				
			</tr>
		<%} %>
</body>
</html>