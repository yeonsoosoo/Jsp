<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	//싱글톤을 활용한 DB연동
	SjDAO dao = SjDAO.getInstance();
	List<SjVO> list = dao.selectList();
	
	//뷰를 만들기 전 총점과 평균을 구하기 위한 변수
	int total;
	float avg;
%>
<html>
<head>
	<style>
		table {
			width:50%;
			text-align: center;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		//삭제
		function del(no) {
			//아니요 버튼 클릭 시 삭제하지 않음
			if(confirm("정말 삭제하시겠습니까?") == false) {
				return
			} 
			//예 버튼 클릭 시 (no를 get방식으로 파라미터를 전달)
			location.href = 'sung_del.jsp?no='+no;	
		} //del
		
		//수정
		function modify(no, name, kor, eng, mat) {
			location.href =
				'sung_update.jsp?no='+no+"&name="+name+"&kor="+kor+"&eng="+eng+"&mat="+mat;
		} //modify
	</script>
</head>
<body>
	<table border = 1>
		<caption>학생 정보</caption>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
			<th>순위</th>
			<th>비고</th>
			
		</tr>
		<tr>
			<% for(int i=0; i<list.size(); i++) {
				SjVO sv = list.get(i);
			%>
			<td><%= sv.getNo() %>
			<td><%= sv.getName() %></td>
			<td><%= sv.getKor() %></td>
			<td><%= sv.getEng() %></td>
			<td><%= sv.getMat() %></td>
			
			<!-- DB에 뷰를 따로 생성하지 않으면 주석과 같은 방법으로 보여줄 수 있음 -->
			<%-- <% total = sv.getKor() + sv.getEng() + sv.getMat(); %> --%>
			<td><%= sv.getTot() %></td>
			<%-- <% avg = (float)total/3; %> --%>
			<%-- <td><%= String.format("%.1f", avg) %></td> --%>
			<td><%= sv.getAvg() %></td>
			<td><%= sv.getRank() %></td>
			<td colspan="2">
				<!-- 수정을 위해 수정할 값들을 전부 넘겨줌 -->
				<input type="button" value="수정" 
						onclick="modify('<%= sv.getNo() %>', '<%= sv.getName() %>', '<%= sv.getKor() %>', '<%= sv.getEng() %>', '<%= sv.getMat() %>')">
				<input type="button" value="삭제" onclick="del('<%= sv.getNo() %>')">
			</td>
		</tr>
		<%} %>
		
		<tr>
			<td colspan="9" align="center"><input type="button" value="학생정보 추가하기"
			 onclick="location.href='sung_register.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>