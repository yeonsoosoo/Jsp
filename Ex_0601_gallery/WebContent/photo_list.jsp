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
<script src="js/httpRequest.js"></script>
	<script>
		function del(f) {
			var idx = f.idx.value;
			var pwd = f.pwd.value;
			var pwd2 = f.pwd2.value;
			
			if(pwd != pwd2) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			}
			
			if(!confirm("정말로 삭제하시겠습니까?")) {
				return;
			}
			
			//삭제를 원하는 idx를 서버로 전송
			var url = "photo_del.do";
			var param = "idx=" + encodeURIComponent(idx)+"&filename=" + f.filename.value;
			
			sendRequest(url, param, finRes, "post");
		}
		
		function finRes() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				
				//문자열 형태의 json데이터를 실제 json데이터로 파싱
				var json = eval(data);
				
				if(json[0].param == 'yes') {
					alert("삭제 성공");
				} else {
					alert("삭제 실패");
				}
				
				location.href = "list.do";
			}
		}
		
		function download(filename) {
			location.href="download.do?dir=/upload/&filename="+filename;
		}
	</script>

</head>
<body>
	<div id="main_box">
		<h1>:::PhotoGallery:::</h1>
		
		<div align = "center" style="margin:10px;">
			<input type="button" value="사진등록" onclick="location.href='insert_form.jsp'">
		</div>
		
		<div id="photo_box">
			<c:forEach var = "vo" items="${list}">
				<div class="photo_type">
					<img src="upload/${vo.filename }">
					<div class="title">${vo.title }</div>
					
				<form>
					<input type="hidden" name="idx" value="${vo.idx }">
					<input type="hidden" name="pwd" value="${vo.pwd }">
					<input type="hidden" name="filename" value="${vo.filename }">
					
					
					<div align="center">
						<input type="password" name="pwd2" size="5">
						<input type="button" value="down" onclick="download('${vo.filename}')">
						<input type="button" value="삭제" onclick="del(this.form)">
					</div>
				</form>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>