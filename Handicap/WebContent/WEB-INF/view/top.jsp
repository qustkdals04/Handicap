<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="Handicap/js/jquery-1.10.2.min.js"></script>
<link href="/Handicap/css/common.css" rel="stylesheet" type="text/css"  rel="stylesheet"/>
   <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
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
<center>
	<!-- <table>
		<tr>
			<td width="300" height="163"><img src="/Handicap/img/logo1.jpg"
				width="276" height="157" onclick="location.href='/Handicap/'"></td>

			<td width="300">
  

				<p>
					<pre> <input align="bottom"   type="text" style="width: 60%; border: 4px solid #F3B514;" ><button  class="ml-button"  style="float: right; width: 40px; height: 10;" >검색</button></pre>
				</p>
			</td>

			<td width="300"  align="right" style="vertical-align: top;">

			
				<div id="gc" >
					<font size="2" id="rigthfont"><a href="javascrpt:void(0)"
						class="a1"
						onclick="window.open('/Handicap/messagelist','popup1','width=800,height=300, top='+(screen.height/2-150)+',left='+(screen.width/2-400)+'')">쪽지함</a>&nbsp;<a
						href="/Handicap/member/mypage/pwcheck" class="a2">마이페이지</a>&nbsp;<a
						href="/Handicap/logout" class="a3">로그아웃</a></font>
						
			
				</div>
			</td>
			
		</tr>
		
	</table> -->
	
	<table>
		<tr>	
			<td rowspan="2" width="276" height="163"><img src="/Handicap/img/logo1.jpg" width="276" height="157"  style="vertical-align: middle;"  onclick="location.href='/Handicap/'"></td>
			<td width="300" align="right" style="vertical-align: top;" >
				<div id="appLoadingIndicator">
				<div id="gc" >
					<font size="2" id="rigthfont"><a href="javascrpt:void(0)"
						class="a1"
						onclick="window.open('/Handicap/messagelist','popup1','width=800,height=300, top='+(screen.height/2-150)+',left='+(screen.width/2-400)+'')">쪽지함</a>&nbsp;<a
						href="/Handicap/member/mypage/pwcheck" class="a2">마이페이지</a>&nbsp;<a
						href="/Handicap/logout" class="a3">로그아웃</a></font>
						
			
				</div>
				</div>
			</td>
			
	
		</tr>
		<tr>
			
			<td   width="300px" align="left" style="vertical-align: bottom; width: 641px; margin-left: 0;">
				<div id="appLoadingIndicator">
					<div id="cell">
						<input align="bottom"   type="text" style="width: 407px; border: 3px solid #F3B514; height: 20px ; margin-left: 0;" ><button class="ml-button" style="float: none; width: 64px; height: 30px; margin-left: 0;">검색</button>
					</div>
				</div>
			</td>
		
		</tr>
	</table>

	<%
		} else {
	%>





	<!-- <table>
		<tr>
			<td width="300" height="163"></td>
			
			<td width="300px" align="right" style="vertical-align: bottom;">
				<div id="appLoadingIndicator">
					<div id="cell">
						<pre> <input align="bottom"   type="text" style="width: 272px; border: 4px solid #F3B514;" ><button  class="ml-button"  style="float: right;; width: 40px; height: 10;" >검색</button></pre>
					</div>
				</div>
			</td>
			




			<td width="300" align="right" style="vertical-align: top;" >
				<div id="appLoadingIndicator">
				<div id="gc">
					<div id="font" >
						<font size="2" face="돋음" class="menu"  > <a href="/Handicap/loginForm" class="a1">로그인</a>&nbsp;<a
							href="/Handicap/registertype" class="a2">회원가입</a>&nbsp;<a
							href="javascrpt:void(0)" class="a3"
							onclick="window.open('/Handicap/membersearch','popup1','width=400,height=200, top='+(screen.height/2-100)+',left='+(screen.width/2-200)+'')">ID/PW찾기</a></font>
					</div>
				</div>
				</div>
			</td>

		</tr>
	</table> -->
	<table>
		<tr>	
			<td rowspan="2" width="276" height="163"><img src="/Handicap/img/logo1.jpg" width="276" height="157"  style="vertical-align: middle;"  onclick="location.href='/Handicap/'"></td>
			<td width="300" align="right" style="vertical-align: top;" >
				<div id="appLoadingIndicator">
				<div id="gc">
					<div id="font" >
						<font size="2" face="돋음" class="menu"  > <a href="/Handicap/loginForm" class="a1">로그인</a>&nbsp;<a
							href="/Handicap/registertype" class="a2">회원가입</a>&nbsp;<a
							href="javascrpt:void(0)" class="a3"
							onclick="window.open('/Handicap/membersearch','popup1','width=400,height=200, top='+(screen.height/2-100)+',left='+(screen.width/2-200)+'')">ID/PW찾기</a></font>
					</div>
				</div>
				</div>
			</td>
			
	
		</tr>
		<tr>
			
			<td   width="300px" align="left" style="vertical-align: bottom; width: 641px; margin-left: 0;">
				<div id="appLoadingIndicator">
					<div id="cell">
						<input align="bottom"   type="text" style="width: 407px; border: 3px solid #F3B514; height: 20px ; margin-left: 0;" ><button class="ml-button" style="float: none;  width: 64px; height: 30px; margin-left: 0;">검색</button>
					</div>
				</div>
			</td>
		
		</tr>
	</table>
</center>

	<%
		}
	%>

</body>
</html>