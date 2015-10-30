<%@page import="org.apache.taglibs.standard.lang.jstl.Logger"%>
<%@ page import="org.apache.ibatis.session.*" %>  
<%@ page import="com.handicap.model.beans.UserVO" %>
<%@ page import="com.handicap.model.dao.UserDAO" %>
     <jsp:useBean id="UV" class="com.handicap.model.beans.UserVO"></jsp:useBean>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dao" class="com.handicap.model.dao.UserDAOImpl"></jsp:useBean>


<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	
   try
   {
%>
</head>
<body>
	<center>
		<form method="post" action = "main2.jsp">
			<%
			if(session.getAttribute("checkNick") != null)
			{
				
			%>
			<%=name %>님에 닉네임 은 <b><%= UV.getNickname() %></b>입니다.
		<input type="submit" value="메인으로"> 
		
		<%
			}
			else
			{
		%>
			이름 또는 이메일이 틀렸습니다.<p>
			<input type="button" value="다시입력하기" >
			
			<%
			}
			%>
		</form>
	
	</center>

</body>
<% 

			}catch(Exception e){}
%>


</html>