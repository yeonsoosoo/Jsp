<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	a {
		text-decoration: none;
	}
	
	table {
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<table border="1" width="700">
		<tr>
			<td colspan="5"><img src="img/title_04.gif"></td>
		</tr>
		
		<tr>
			<th>번호</th>
			<th width="350">제목</th>
			<th width="120">작성자</th>
			<th width="100">작성일</th>
			<th width="60">조회수</th>
		</tr>
		
		<c:forEach var="vo" items="${list }">
			<tr>
				<td align="center">${vo.idx }</td>
				
				<td>
					<!-- 댓글이나 대댓글이면 하나씩 들여쓰기 -->
					<c:forEach begin="1" end="${vo.depth }">&nbsp;</c:forEach>
					<!-- 댓글기호 -->
					<c:if test="${vo.depth ne 0 }">ㄴ</c:if>
					<a href="view.do?idx=${vo.idx}">
						<font color="black">${vo.subject }</font>
					</a>
				</td>
				<td>${vo.name }</td>
				<td>${fn:split(vo.regdate, ' ')[0] }</td>
				<td>${vo.readhit }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center">
						◀ 1 2 3 ▶
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<img src="img/btn_reg.gif" onclick="location.href='insert_form.jsp'"
				 style="cursor:pointer;">
			</td>
		</tr>
		
	</table>
</body>
</html>