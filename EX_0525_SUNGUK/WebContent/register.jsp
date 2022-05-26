<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//register.jsp?name=홍길동&kor=90&eng=80&mat=70 이런식으로 넘어옴
    	String name = request.getParameter("name");
    	int kor = Integer.parseInt(request.getParameter("kor"));
    	int eng = Integer.parseInt(request.getParameter("eng"));
    	int mat = Integer.parseInt(request.getParameter("mat"));
    	
    	//db에 추가할 정보를 vo에 묶어준다.
    	SjVO vo = new SjVO();
    	vo.setName(name);
    	vo.setKor(kor);
    	vo.setEng(eng);
    	vo.setMat(mat);
    	
    	//res는 0또는 1만 값으로 넘어옴
    	int res = SjDAO.getInstance().insert(vo);
    	
    	//1이라면 DB에 값이 입력된 것. 디비에 값이 입력되지 않으면 페이지 전환이 아니라 body가 실행됨
    	if(res == 1) {
    		response.sendRedirect("student.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>