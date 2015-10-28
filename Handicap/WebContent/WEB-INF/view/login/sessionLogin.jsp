<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%session.setAttribute("id", request.getParameter("id")); %>
<%session.setAttribute("password", request.getParameter("password")); %> 
</head>
<body>
<center>
    <h3>로그인 세션</h3>
    <h3>아이디 : <%=(String)session.getAttribute("id") %></h3>   
    <h3>비밀번호 : <%=(String)session.getAttribute("password") %></h3>  
    <a href="sessionLogout.jsp">로그아웃</a>
</center>
</body>
</html>