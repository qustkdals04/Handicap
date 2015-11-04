
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/main.css">





<title>Insert title here</title>
</head>
<body >	
<table>
<tr>
<td>	
	<div id="wrapper" >
		<%@include file="top.jsp" %>
		
		
	<div id="content" align="center">	
		<%@include file="menu.jsp" %>
	</div><!-- center 끝 -->

	<div id="bbsmain"align="center" >
	<a href='#'><img src='img/pig.JPG' onmouseover='this.src="img/pig3.jpg"' onmouseout='this.src="img/pig.JPG"'></a> 
	<a href='#'><img src='img/phone.JPG' onmouseover='this.src="img/phone3.jpg"' onmouseout='this.src="img/phone.JPG"'></a>
	<a href='#'><img src='img/car.jpg' onmouseover='this.src="img/car3.jpg"' onmouseout='this.src="img/car.jpg"'></a> 

	</div>
	
	<div id="news">
		<!-- <div id="more" >
		<img  src="img/moreicon.png" align="right"> -->
		

		<%@include file="news.jsp" %>
		
	</div>
	
	<div id="Notice" align="center">
		<%@include file="Notice.jsp" %>
	</div>
	
	<div id="JOB" align="center">
		<%@include file="job_Bulletin.jsp" %>
	</div>
  	<%-- <div id="contents" align="center">
		<%@include file="index.html" %><!-- 슬라이드 -->
	</div > --%>
 
  
  
	</div>
	</td>
	
	
 <td>
 <div id="sidebar"  align="right">
 	 <%@include file="banner.jsp" %>  
  	</div>  
  </td> 
  </tr>
  
    
  </table>
</body>
</html>