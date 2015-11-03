<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".a1").mouseenter(function(){
			$(".a1").css("background-color", "#dddddd");
		});
		$(".a1").mouseleave(function(){
			$(".a1").css("background-color", "white");
		});
		$(".a2").mouseenter(function(){
			$(".a2").css("background-color", "#dddddd");
		});
		$(".a2").mouseleave(function(){
			$(".a2").css("background-color", "white");
		});
		$(".a3").mouseenter(function(){
			$(".a3").css("background-color", "#dddddd");
		});
		$(".a3").mouseleave(function(){
			$(".a3").css("background-color", "white");
		});
	});
</script>
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
	   
	    <p><font size="2"><a href="javascrpt:void(0)" class="a1" onclick="window.open('/Handicap/messagelist','popup1','width=800,height=300, top='+(screen.height/2-150)+',left='+(screen.width/2-400)+'')">쪽지함</a>&nbsp;<a href="javascrpt:void(0)" class="a2" onclick="window.open('/Handicap/member/mypage/pwcheck','popup1','width=400,height=200, top='+(screen.height/2-100)+',left='+(screen.width/2-200)+'')">마이페이지</a>&nbsp;<a href="/Handicap/logout" class="a3">로그아웃</a></font></p></td>
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
		   
		    <p><font size="2"><a href="/Handicap/loginForm" class="a1">로그인</a>&nbsp;<a href="/Handicap/registerForm" class="a2">회원가입</a>&nbsp;<a href="javascrpt:void(0)" class="a3" onclick="window.open('/Handicap/membersearch','popup1','width=400,height=200, top='+(screen.height/2-100)+',left='+(screen.width/2-200)+'')">ID/PW찾기</a></font></p></td>
		</tr> 
	</table>
<%
	}
%>

</body>
</html>