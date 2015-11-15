<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이트 소개</title>
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
						<table>
							<tr>
								<td style="vertical-align: top;"><%@include file="../new/NewSubMenu12.jsp"%>
								</td>
								<td>
									<table cellpadding="5" cellspacing="0" align="center">
										<tr>
											<td width="700px" height="300px;" align="center" colspan="3"><img
												alt="메인1이미지" src="/Handicap/img/S1.JPG"
												style="width: 100%; height: 100%"></td>

										</tr>

										<tr>
											<td width="100px"></td>
											<td width="300px" height="300px;" align="center"><img
												alt="메인2이미지" src="/Handicap/img/S2.JPG"
												style="width: 100%; height: 100%; vertical-align: top;"></td>
											<td width="100px"></td>
										</tr>

										<tr>
											<td align="left" colspan="3"><img alt="하단 메뉴 이미지"
												src="/Handicap/img/S3.JPG"
												style="width: 400px; height: 70px"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td><%@include file="../Footer.jsp"%>
				</td>
			</tr>
		</table>
	</div>














</body>
</html>