<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 포토갤러리 학습  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/photo.css">
</head>
<body>
	<div id="main_box">
		<h1>:::PhotoGallery:::</h1>
		
		<div align = "center" style="margin:10px;">
			<input type="button" value="사진등록">
		</div>
		
		<div id="photo_box">
			<c:forEach begin="1" end="20">
				<div class="photo_type">
					<img src="">
					
					<div class="title">제목</div>
					<div align="center">
						<input type="button" value="삭제">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>