<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script>
	function del(idx) {
		if (!confirm("정말로 삭제하시겠습니까?")) {
			//아니요버튼 누를 시 리턴
			return;
		}

		//삭제를 원하는 idx를 서버로 전송
		var url = "member_del.do";
		var param = "idx=" + encodeURIComponent(idx);

		//AJAX 사용
		sendRequest(url, param, resultFn, "post");
	}
	
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			//도착된 데이터 읽어오기
			var data = xhr.responseText;
			
			//문자열 형태의 json데이터를 실제 json데이터로 파싱
			var json = eval(data);
			
			if(json[0].param == 'yes') {
				alert("삭제 성공");
			} else {
				alert("삭제 실패");
			}
			
			location.href = "member_list.do";
		}
	}
</script>
<style>
table {
	border-collapse: collapse;
}

th {
	width: 200px;
	height: 60px;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="5" align="center"><input type="button" value="회원가입"
				onclick="location.href='member_insert_form.jsp'"></td>
		</tr>

		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>비고</th>
		</tr>

		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.idx }</td>
				<td>${vo.name }</td>
				<td>${vo.id }</td>
				<td>${vo.pwd }</td>
				<td><input type="button" value="삭제" onclick="del('${vo.idx}');"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>