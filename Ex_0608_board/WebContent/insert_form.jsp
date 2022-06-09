<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send_check() {
		/* form태그 가져오기 */
		var f = document.f;
		
		f.submit();
	}
</script>
</head>
<body>
	<form name="f" method="post" action="insert.do">
		<table border="1">
			<caption>:::새로운 게시물 작성:::</caption>
			<tr>
				<th>제목</th>
				<td><input name="subject" style="width:370px;"></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="name" style="width:370px;"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<!-- 가로로 50글자, 세로로 10번정도 엔터를 칠 수 있는 크기 -->
				<td><textarea name="content" rows="10" cols="50"
						style="resize:none;"></textarea></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password" style="width:370px;"></td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<img src="img/btn_reg.gif" onclick="send_check();">
					<img src="img/btn_back.gif" onclick="location.href='board_list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>