<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script>
	var b_idCheck = false;
	
	function send(f) {
		var id = f.id.value.trim();
		var pwd = f.id.value.trim();
		var name = f.name.value.trim();
		
		//유효성 체크
		//db에서 not null로 만들었다고해도 비워놓고 만들어버리면 500에러 발생
		if(!b_idCheck) {
			alert("아이디 중복체크를 하세요.")
			return;
		}
		
		if(pwd == '') {
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		if(name == '') {
			alert("이름을 입력해주세요");
			return;
		}
		
		f.method ="POST";
		f.action="insert.do";
		f.submit();
	} //send()
	
	//아이디 중복체크를 위한 메서드
	function check_id() {
		var id = document.getElementById("id").value.trim();
		
		if(id == '') {
			alert("아이디를 입력해주세요");
			return;
		}
		//중복검사를하고 새로고침을 하면 input태그 안에 있는 내용이 다 날아가서
		//무한으로 중복체크만 하게 될 것이다.
		
		var url = "check_id.do";
		var param = "id=" + encodeURIComponent(id);
		
		sendRequest(url, param, resultFn, "POST");
	} //check_id
	
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText; //"[{'res':'no'}]" -> json형식으로 no or yes가 전달됨
			
			//문자열로 담겨진 data를 실제 json형태로 변환
			var json = eval(data);
			
			if(json[0].res == 'no') {
				alert("이미 사용중인 아이디입니다.");
			} else {
				//회원가입이 가능한 경우
				alert("사용 가능한 아이디입니다.");
				b_idCheck = true;
			}
		}
	}
	
	//아이디를 입력받는 입력상자의 값이 변환되면 호출되는 메서드
	function che() {
		b_idCheck = false;
	}
</script>
</head>
<body>
	<form>
		<table border = "1">
			<caption>:::회원 가입:::</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input name="id" id="id" onclick="che()">
					<input type="button" value="중복체크" onclick="check_id();">
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>
					<input name="name">
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="pwd" type="password">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="가입" onclick="send(this.form)">
					<input type="button" value="목록으로" onclick="location.href='member_list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>