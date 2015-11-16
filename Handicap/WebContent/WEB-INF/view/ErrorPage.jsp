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
						<table >
								<tr height="50px">
										<td  colspan="2" align="center">
												<img src="/Handicap/img/Daa.png" style="width: 50pt; height: 35pt;padding-left: ">&nbsp;&nbsp;&nbsp;<font size = "9" style="text-align: center;">죄송합니다.</font>
										</td>
								</tr>
								<tr height="100px">
										<td colspan="2" align="center" style="vertical-align: middle;">
												오류가 발생하였습니다. <br>
												현재 페이지 이용이 불가능하게 되었습니다. 
										</td>
								</tr>
								<tr>
										<td>
												<button type = "button" class= "ml-button" style="width: 100pt;" onclick="location.href='/Handicap/'">홈으로 이동</button>
										</td>
										<td>
												<button type = "button" class= "ml-button" style="width: 100pt;" onclick="history.back()">이전페이지 이동</button>
										</td>
								</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
					<td>
						<%@include file = "Footer.jsp" %>
					</td>
			</tr>
		</table>
	</center>
</body>
</html>