<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//값을 전달 받을 때 인코딩 되어 한글이 깨지지 않도록 해줌.(get은 안깨지는데, post일 경우 깨질 수 있음)
    	request.setCharacterEncoding("utf-8");
    
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	int res = SjDAO.getInstance().delete(no);
  		
    	//한 행이 바뀔때마다 res값이 증가하기 때문에 1이상으로 설정
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