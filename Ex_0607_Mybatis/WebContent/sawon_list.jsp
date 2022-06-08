<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
<script>
	function find() {
		//where절이 있는 쿼리문을 작성해야 한다.
		//선택된 값을 가져와서 sawon_list.do로 값을 넘긴다. 0~50
		var deptno = document.getElementById("deptno").value;
		location.href = "sawon_list.do?deptno=" + deptno;
		
	}
</script>
</head>
<body>
	<div align="center">
		<select id="deptno">
			<option value="0">:::부서를 선택하세요:::</option>
			<option value="10">총무부</option>
			<option value="20">영업부</option>
			<option value="30">전산부</option>
			<option value="40">관리부</option>
			<option value="50">경리부</option>
		</select>
		<input type="button" value="검색" onclick="find()">
	</div>
	<br>
	<table border="1" align="center">
		<caption>:::사원목록:::</caption>
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>사원급여</th>
			<th>사원직종</th>
			<th>사원입사일자</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.sabun }</td>
				<td>${vo.saname }</td>
				<td>${vo.sapay }</td>
				<td>${vo.sajob }</td>
				<c:set var="sahire" value="${vo.sahire }"/>
				<td>${fn:split(sahire,' ')[0]}</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>