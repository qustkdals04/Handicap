<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/main.css">
<title>소식_공지사항</title>
</head>
<body>
	<div id="wrapper" >
		<%@include file="../viewtop.jsp" %>
		
		
	<div id="content" align="center">	
		<%@include file="../menu.jsp" %>
	</div><!-- center 끝 -->

	
		<table>
			<tr>
				<td width = "300px">
				<div id ="contents">
			<%@include file = "NewSubMenu.jsp"%>
				</td>	
				</div>
									
				
				<td>
					<div id="sidebar"  align="right">
						<%@include file="../banner.jsp" %>  
					</div>  
 				 </td> 
				</tr>		
				</table>
				
				</div> 
<%-- <table>
	<tr>
		<td>	
		<div id="wrapper" >
		<%@include file="../viewtop.jsp" %>
		
		
		<div id="content" align="center">	
		<%@include file="../menu.jsp" %>
		</div><!-- center 끝 -->
		 </div>
		
		</td>
		
		
		<div id ="contents">
			<%@include file="NewSubMenu.jsp" %>
		</div>
		
		
	
 		<td>
		 <div id="sidebar"  align="right">
 		 <%@include file="../banner.jsp" %>  
  		</div> 
  		
  		</td> 
  	</tr>
  
    
  </table>` --%>
</body>
</html>


