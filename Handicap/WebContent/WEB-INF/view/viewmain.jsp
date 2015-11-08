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

<title>Insert title here</title>

</head>

<body>


<div id="wrapper" >




	<div id="top" align="center">

		<%@include file="top.jsp"%>

	</div>
	<!-- top 끝 -->



	<div  align="center">

	

		<%@include file="menu.jsp"%>

	</div>
	<!-- menu 끝 -->

	<div id="slider" align="center">

		<%@include file="index.html"%>

	</div>

	

	<div id="slider" align="center" >
		<%@include file="Notice.jsp"%>
		
	</div>
	

	<div id="slider" align="center" >

		<%@include file="club.jsp"%><table>


			<tr>

				<td><a href="http://fleamarket.seoul.go.kr/"><img src="img/bn1.JPG"></a></td>

				<td><a href="https://www.jobable.kr/index_knise.jsp"><img src="img/bn2.JPG"></a></td>

				<td><a href="http://life.knise.kr/main/index.asp"><img src="img/bn3.JPG"></a></td>

				<td><a href="https://tlc.knise.kr/"><img src="img/bn4.JPG"></a></td>

			<br><%@include file="Footer.jsp"%>

			</tr></table>
	</div>
	
		</div>
		
		
</body>

</html>