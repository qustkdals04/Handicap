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
	<div id="CssWrapper" >

		<table>

			<tr>
			<td >
				<div id="top">
				<%@include file="top.jsp"%>
				</div>
				</td>
			</tr>

			<tr>
				<td >
					<div id="CssContent1">
						<%@include file="menu.jsp"%>
					</div>
				
				</td>
			</tr>

			<tr>
				<td >
					<div id="CssContents">

						<table>
							<tr>
								<td>
									<div id="slider" align="center">
										<%@include file="index.html"%>	
									</div> 
									
									
								</td>
							
							</tr>

							<tr>
								<td>
									<div id="slider" >
										<%@include file="Notice.jsp"%>
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div id="slider" >
										<%@include file="news.jsp"%>
									</div>
								</td>
							</tr>

							
							<tr>
								<td>

									<div id="Foot" >
										<%@include file="Footer.jsp"%>
									</div>
								
								
								
							</tr>
						</table>
					</div>
				</td>
			</tr>

		</table>
	</div>
	</center>
</body>
</html>