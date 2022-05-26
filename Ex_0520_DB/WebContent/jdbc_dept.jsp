<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   		//톰캣이 JNDI를 검색하기 위해 필요한 클래스
   		InitialContext ic = new InitialContext();
   
   		//Resource위치 검색
   		Context ctx = (Context)ic.lookup("java:comp/env");
   		
   		//검색된 Resource를 통해 필요한 JNDI의 Resource를 검색
   		//context.xml파일의 Resource영역에 참조되어있는 name속성값
   		DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
   		
   		//위에서 준비해둔 경로로 로그인 시도(접속)
   		Connection conn = dataSource.getConnection();
   		
   		System.out.println("----연결성공----");
   		
   		//명령처리객체 얻어오기
   		String sql = "select * from dept";
   		
   		//문자열로된 쿼리문을 진짜 쿼리문으로 인식하게 해주는 객체
   		PreparedStatement pstmt = conn.prepareStatement(sql);
   		
   		//실행된 sql문장을 통해
   		ResultSet rs = pstmt.executeQuery();
   		
   		List<DeptVO> dept_list = new ArrayList<DeptVO>();
   		
   		//한행씩 읽기
   		while(rs.next()) {
   			DeptVO vo = new DeptVO();
   			
   			//현재 필드값을 vo에 담는다.
   			vo.setDeptno(rs.getInt("deptno"));
   			vo.setDname(rs.getString("dname"));
   			vo.setLoc(rs.getString("location"));
   			
   			dept_list.add(vo);
   		}
   		//DB접속과 관련된 모든 객체는 생성된 역순으로 반드시 닫아주자.
   		rs.close();
   		pstmt.close();
		conn.close();
   %> 
    
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		function send(data) {
			var f = document.getElementById("m_home");
			var hid = document.getElementById("hid");
			hid.value = data;
			f.submit();
		}
	</script>
<meta charset="UTF-8">
<title>DB연동후 부서 테이블 출력하기</title>
</head>
<body>
	<form id="m_home" action="jdbc_sawon.jsp">
	<table border = 1>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		
		<% for(int i=0; i<dept_list.size(); i++) { 
			DeptVO dv = dept_list.get(i); %>
			<tr>
				<td><%= dv.getDeptno() %></td>
				<td>
					<a href="javascript:send('<%=dv.getDeptno() %>');" name = "deptno">
					<%= dv.getDname() %>
					</a>
					</td>
				<td><%= dv.getLoc() %></td>
				
			</tr>
		<%} %>
	</table>
	<input type="hidden" value="" id="hid" name="deptno">
	</form>
</body>
</html>