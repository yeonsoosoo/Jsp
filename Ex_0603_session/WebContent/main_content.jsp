<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인을 했을 때 볼 수 있는 메인 컨텐츠 화면 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="check_login.jsp"/>
	메인페이지입니다.<br>
	
	${vo.name }님 반갑습니다.
	<input type="button" value="로그아웃" onclick="location.href = 'logout.do'">
</body>
</html>