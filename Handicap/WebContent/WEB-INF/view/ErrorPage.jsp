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

<title>에러 페이지</title>
</head>
<body>
	<center>
		<table align="center">

			<tr align="center">
				<td><%@include file="top.jsp"%></td>
				<td></td>
			</tr>
			<tr align="center">
				<td><%@include file="menu.jsp"%></td>
				<td></td>
			</tr>
			<tr>
				<td valign="top">
					<div align="center" style="width: 881px;">
						<table>
								<tr>
										<td  colspan="2">
												<img src="/Handicap/img/Daa.png"><font size = "8">죄송합니다.</font>
										</td>
								</tr>
								<tr>
										<td colspan="2">
												오류가 발생하였습니다. <br>
												현재 페이지 이용이 불가능하게 되었습니다. 
										</td>
								</tr>
								<tr>
										<td>
												<button type = "button" class= "ml-button">홈으로 이동</button>
										</td>
										<td>
												<button type = "button" class= "ml-button">이전 페이지로 이동</button>
										</td>
								</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>