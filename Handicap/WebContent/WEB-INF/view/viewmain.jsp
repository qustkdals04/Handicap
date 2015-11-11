<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
    

<title>메인</title>

</head>

<body>
<center>
	<table>
		<tr>
			<td>
				<!-- 가운데 메뉴 전체 화면 공간 -->
				<div id="CssWrapper">
					<div id="top" align="center">
						<%@include file="top.jsp"%>
					</div>
					<!-- top 끝 -->
					<div align="center">
						<%@include file="menu.jsp"%>
					</div>
					<!-- menu 끝 -->
					<center>
					<div id="slider" align="center">
						<%@include file="index.html"%>
					</div>
					</center>
					<!-- 슬라이드 끝 -->
					<div id="slider" align="center">
						<%@include file="Notice.jsp"%>
					</div>
					<div id="slider" align="center">
						<%@include file="club.jsp"%>

						<br> <br> <br> <br>
						<%@include file="Footer.jsp"%>

					</div>
				</div>
			</td>
			
			<td><!-- 사이드 메뉴 -->
					<%@include file="banner.jsp"%>
			</td>
			
		</tr>

			

	</table>
</center>
</body>
</html>