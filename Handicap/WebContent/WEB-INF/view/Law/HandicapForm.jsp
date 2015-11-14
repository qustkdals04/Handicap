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

<title>장애인 복지법</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
</head>
<body>


	<div id="CssWrapper" align="center">
		<table>

			<tr>
				<td><%@include file="../top.jsp"%></td>
			</tr>

			<tr>
				<td>
					<div align="center">
						<%@include file="../menu.jsp"%>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div id="CssContents">
						<table align="center">
							<tr>
								<td width="100px" align="center"><%@include
										file="HandicapSubMeun.jsp"%></td>
								<td><%@include file="handicapLaw.jsp"%>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>

			<tr>
				<td><%@include file="../Footer.jsp"%></td>
			</tr>

		</table>

	</div>




</body>
</html>
