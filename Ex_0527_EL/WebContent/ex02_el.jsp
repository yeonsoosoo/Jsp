<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 파라미터 전달 -->
	EL표현식(파라미터) : ${param.msg } <br>
	EL산술연산자<br>
	<!-- \${1+1} -->
	\${ 1+1} = ${1 + 1 }<br>
	\${ 2-1 } = ${2 - 1 }<br>
	\${ 3*2 } = ${3 * 2 }<br>
	
	<!-- 나머지와 나눗셈은 햇갈림을 방지하기 위해 mod, div 사용 가능-->
	\${ 10/3 } = ${10/3 } = ${10 / 3 } <br> <!-- div = / -->
	\${ 10 % 3 } = ${10 % 3 } = ${10 mod 3 } <br>
	<br>
	EL관계(비교)연산자<br>
	<!-- 항상 왼쪽을 기준으로 보기 때문에 >는 크다 <는 작다 -->
	\${ 3 > 2 } = ${3 > 2 } ${3 gt 2 } <br>
	\${ 3>= 2 } = ${ 3>= 2 } ${3 ge 2 } <br>
	\${ 3 < 2 } = ${ 3 < 2 } ${3 lt 2 } <br>
	\${3 <=2 } = ${ 3<=2 } ${3 le 2 } <br>
	\${ 3 == 2 } = ${ 3 ==2 } ${ 3 eq 2 } <br>
	\${ 3!= 2 } = ${3!=2 } ${3 != 2 } <br> <!-- ne == !=  -->
	
	EL삼항 연산자<br>
	<!-- 파라미터로 넘어온 값이(ex02_el.jsp?msg="값이 있다") 있을 때와 없을 때를 비교 -->
	파라미터 값 : ${param.msg eq null ? '그래 참이다' : '거짓이다' }<br>
	파라미터 값 : ${empty param.msg ? '그래 참이다' : '거짓이다' }<br>
	
	EL논리 연산자<br>
	파라미터값:
	${ empty param.msg || param.msg eq 10 } <br>
	파라미터값:
	${ empty param.msg or param.msg eq 10 } <br>
	
	파라미터값:
	${ empty param.msg && param.msg eq 10 } <br>
	
	파라미터값:
	${ empty param.msg and param.msg eq 10 } <br>
	
	
</body>
</html>