<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function reply() {
		location.href="reply_form.jsp?idx=${vo.idx}";
	}
</script>
</head>
<body>
	<table border="1">
		<caption>:::게시글 상세보기:::</caption>
		<tr>
			<th>제목</th>
			<td>${vo.subject}</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${vo.name}</td>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td>${vo.regdate}</td>
		</tr>
		
		<tr>
			<th>ip</th>
			<td>${vo.ip}</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<!-- pre를 사용한 이유는 줄바꿈을 하기위함. -->
			<td width="500px" height="200px"><pre>${vo.content}</pre></td>
		</tr> 
		
		<tr>
			<td colspan="2">
				<!-- 목록보기 -->
				<img src="img/btn_list.gif" onclick="location.href='board_list.do'">
				
				<!-- depth가 1보다 작다면 답글아이콘이 생기고, 아닌 경우 답글을 달지 못함 -->
				<c:if test="${vo.depth lt 1 }">
					<!-- 답변 -->
					<img src="img/btn_reply.gif" onclick="reply();">
				</c:if>
				
				<!-- 삭제 -->	
				<img src="img/btn_delete.gif" onclick="del();">
			</td>
		</tr>
	</table>
</body>
</html>