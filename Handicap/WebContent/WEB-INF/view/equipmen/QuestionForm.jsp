<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<title>의료장비_질문답변</title>
</head>
<body>
	<div id="CssWrapper">
		<%@include file="../top.jsp"%>


		<div  align="center">
			<%@include file="../menu.jsp"%>
		</div>
		<!-- center 끝 -->

	<div id="CssContents">
		<table align="right" >
			<tr>
				<td width="200px">
					
						<%@include file="EquipmenSubMenu.jsp"%>
					
				</td>
				
			</tr>
			
		</table>
		</div>
		<%-- <div id="sidebar" align="right">
			<%@include file="../banner.jsp"%>

		</div> --%>
	</div>
</body>
</html>


