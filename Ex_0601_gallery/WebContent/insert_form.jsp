<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function send(f) {
			var title = f.title.value;
			var pwd = f.pwd.value;
			var photo = f.photo.value;
			
			//유효성 검사
			if(title == '') {
				alert("제목을 입력하세요");
				return;
			}
			
			if(pwd == '') {
				alert("비밀번호를 입력해주세요");
				return;
			}
			
			if(photo == '') {
				alert("파일을 입력해주세요");
				return;
			}
			f.submit(); //insert.do로 파라미터를 가지고 화면 전환
		}
	</script>
</head>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<table border = "1" align="center">
			<caption>사진 등록하기</caption>
			
			<tr>
				<th>제목</th>
				<td><input name="title"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password"></td>
			</tr>
			
			<tr>
				<th>등록할 사진</th>
				<td><input type="file" name="photo"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록하기" onclick="send(this.form)">
					
					<!-- 보낼때도 자바명이아니라 매핑해준 값으로 보내주기 -->
					<input type="button" value="목록으로" onclick="location.href = 'list.do'">
				</td>
			</tr> 
		</table>
	</form>
</body>
</html>