<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String memberid;
	if(session.getAttribute("memberid")!=null){
		memberid = session.getAttribute("memberid").toString();	
%>
<table align="top" width="1050">	
	<tr>
		<td width="300" height="163"><img src="/Handicap/img/logo1.jpg" width="276" height="157" onclick="location.href='/Handicap/main'"></td>
	
		<td width="300" >
	
	   
   		 <p>검색</p></td>
    
		<td width="300" align="right"> 
	   
	    <p><font size="4"><a href="/Handicap/logout">로그아웃</a> <a href="/Handicap/registerForm">회원가입</a> <a href="">ID/PW찾기</a></font></p></td>
	</tr> 
</table>
<%
	} else {
%>
		<table align="top" width="1050">	
		<tr>
			<td width="300" height="163"><img src="/Handicap/img/logo1.jpg" width="276" height="157" onclick="location.href='/Handicap/main'"></td>
		
			<td width="300" >
		
		   
	   		 <p>검색</p></td>
	    
			<td width="300" align="right"> 
		   
		    <p><font size="4"><a href="/Handicap/loginForm">로그인</a> <a href="/Handicap/registerForm">회원가입</a> <a href="">ID/PW찾기</a></font></p></td>
		</tr> 
	</table>
<%
	}
%>

</body>
</html>