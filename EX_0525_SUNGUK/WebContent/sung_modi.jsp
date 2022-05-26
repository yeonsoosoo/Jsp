<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    
    	String name = request.getParameter("name");
    	int no = Integer.parseInt(request.getParameter("no"));
    	int kor = Integer.parseInt(request.getParameter("kor"));
    	int eng = Integer.parseInt(request.getParameter("eng"));
    	int mat = Integer.parseInt(request.getParameter("mat"));
    
    	SjVO vo = new SjVO();
    	vo.setNo(no);
    	vo.setName(name);
    	vo.setKor(kor);
    	vo.setEng(eng);
    	vo.setMat(mat);
    	
    	int res = SjDAO.getInstance().update(vo); 
    	
    	if(res >= 1) {
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