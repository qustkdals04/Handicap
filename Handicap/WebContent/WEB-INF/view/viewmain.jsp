<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">


<title>메인</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>

</head>

<body>
	<center>

		<div id="CssWrapper">
			<%@include file="top.jsp"%>


			<div id="CssContent1">
				<%@include file="menu.jsp"%>
			</div>
			<!-- 시작 -->
			<div id="CssContents">
				<table>


					<tr>   
						<td>
							<div id="slider" align="center">
								<%@include file="index.html"%>
							</div>

						</td>
						<%-- 	<td><!-- 사이드 메뉴 -->
					<div id="slider" align="center">
					<%@include file="banner.jsp"%>
					</div>
			</td> --%>
					</tr>

					<tr>
						<td>
							<div id="slider" align="center">
								<%@include file="Notice.jsp"%>
							</div>
						</td>
					</tr>

					<tr>
						<td><div id="slider" align="center">
								<%@include file="club.jsp"%></div></td>
					</tr>

					<tr>
						<td>

							<div id="slider" align="center">
								<%@include file="Footer.jsp"%>
							</div>
						</td>
					</tr>







				</table>
			</div>
		</div>
	</center>

</body>
</html>