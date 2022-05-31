<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 서블릿에서 정보 두개가 넘어왔다는걸 알아야 가져다가 쓸 수가 있는데 지금 상황이 아니게 되버렸다. 
	el표기법을 사용할 예정이기 대문에 파라미터를 스코프 영역에 담아서 사용을 해야한다.
-->
	제목 : ${title} <br>
	<img src="upload/${filename}" width="200">
</body>
</html>