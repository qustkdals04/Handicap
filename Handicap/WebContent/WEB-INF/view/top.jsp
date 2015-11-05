<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".a1").mouseenter(function() {
			$(".a1").css("background-color", "#dddddd");
		});
		$(".a1").mouseleave(function() {
			$(".a1").css("background-color", "white");
		});
		$(".a2").mouseenter(function() {
			$(".a2").css("background-color", "#dddddd");
		});
		$(".a2").mouseleave(function() {
			$(".a2").css("background-color", "white");
		});
		$(".a3").mouseenter(function() {
			$(".a3").css("background-color", "#dddddd");
		});
		$(".a3").mouseleave(function() {
			$(".a3").css("background-color", "white");
		});
	});
</script>
</head>
<body>
	<%
		String memberid;
		if (session.getAttribute("memberid") != null) {
			memberid = session.getAttribute("memberid").toString();
	%>

	<table>
		<tr>
			<td width="300" height="163"><img src="/Handicap/img/logo1.jpg"
				width="276" height="157" onclick="location.href='/Handicap/main'"></td>

			<td width="300">


				<p>
					<input type="text" style="width: 455px;">
				</p>
			</td>

			<td width="300" align="center">

				<p>
					<font size="3" id="rigthfont"><a href="javascrpt:void(0)"
						class="a1"
						onclick="window.open('/Handicap/messagelist','popup1','width=900,height=400, top='+(screen.height/2-200)+',left='+(screen.width/2-450)+'')">쪽지함</a>&nbsp;<a
						href="/Handicap/member/mypage/pwcheck" class="a2">마이페이지</a>&nbsp;<a
						href="/Handicap/logout" class="a3">로그아웃</a></font>
				</p>
			</td>
		</tr>
	</table>

	<%
		} else {
	%>





	<table>
		<tr>
			<td width="300" height="163"><img src="/Handicap/img/logo1.jpg"
				width="276" height="157" onclick="location.href='/Handicap/main'"></td>

			<td width="300px" style="vertical-align: middle;">
				<div id="appLoadingIndicator">
					<div id="cell">
						<input type="text" style="width: 100%">
					</div>
				</div>
			</td>




			<td width="300" align="center" style="vertical-align: middle;">
				<div id="appLoadingIndicator">
					<div id="font">
						<font size="4" face="돋음"> <a href="/Handicap/loginForm" class="a1">로그인</a>&nbsp;<a
							href="/Handicap/registertype" class="a2">회원가입</a>&nbsp;<a
							href="javascrpt:void(0)" class="a3"
							onclick="window.open('/Handicap/membersearch','popup1','width=400,height=200, top='+(screen.height/2-100)+',left='+(screen.width/2-200)+'')">ID/PW찾기</a></font>
					</div>
				</div>
			</td>

		</tr>
	</table>


	<%
		}
	%>

</body>
</html>