<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
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