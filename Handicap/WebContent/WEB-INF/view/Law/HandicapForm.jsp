<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<title>장애인 복지법</title>
</head>
<body>




	<div id="wrapper">
		<!-- 전체 틀 -->
		<%@include file="../top.jsp"%>
		<!-- 고정 틀 -->
		<div  align="center">
			<%@include file="../menu.jsp"%>
			<!-- 상단 메뉴 -->
			
				<div id="contents">
			<table align="right">
			<tr>
				<td width="200px">
				
						<%@include file="HandicapSubMeun.jsp"%>
					
				</td>
			</tr>
		</table>
			</div>
		</div>
		<div >
			<table align="center" >
				<tr>
<%-- 
					<div align="left">
						<%@include file="HandicapSubMeun.jsp"%>
					</div> --%>

					<td style="width: 40%; "><%@include file="handicapLaw.jsp"%>
					</td>
				</tr>
			</table>
			<%-- <div id="sidebar" align="right">
				<%@include file="../banner.jsp"%>

			</div> --%>
		
	</div>
</body>
</html>
