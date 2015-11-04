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
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login").click(function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력해주세요");
				$("#userid").focus();
			} else if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
			} else {
				$("#loginform").attr({
					action : "/Handicap/memberlogin",
					method : 'post'
				});
				$("#loginform").submit();
			}
			/* if($("#userid").val()!=null && $("password").val()!=null){
				$("#loginform").attr({action:"/Handicap/memberlogin", method:'post'});
				$("#loginform").submit();	
			} else{
				alert("올바른 아이디와 비밀번호를 입력해주세요");
			} */
		});
		$("#register").click(function() {
			$("#loginform").attr({
				action : "/Handicap/retype",
				method : 'post'
			});
			$("#loginform").submit();
		});
	});
</script>
</HEAD>
<BODY>
	<div id="wrapper">
		<%@include file="../top.jsp"%>


		<div id="content" align="center">
			<%@include file="../menu.jsp"%>
		</div>


		<center>
			<br> <br> <br>
			<div id="dd">
				<h3>
					<font color="#888888"
								style="font-size: xx-large; font-weight: bold; color: black;;">
								MEMBERSHIP</font>
				</h3>
				<form name="login" id="loginform">
					<table width="200" height="100" style="width: 363px;" class="re">
						<tr>
							<th colspan="3"><font color="#888888"
								style="font-size: large; font-weight: bold; color: silver;">로그인
									후 이용이 가능합니다.</font></th>


						</tr>
						<tr>

							<td rowspan="1" align="left" width="200px"><pre></pre><font
								size="5" style="font-weight: bold;">User Id</font></td>
							<td width="200px"><pre></pre><input type="text"
								name="userid" size="10" id="userid" style="width: 200px"></td>
							<td rowspan="2" > <pre></pre><img src="img/loginok2.jpg" width="80" height="60" id="login"></td>





							<!-- <button type="button" id="register">회원가입</button> -->

						</tr>
						<tr>
							<td align="left"><font size="5" style="font-weight: bold;">Password</font></td>
							<td><input type="password" name="passwd" size="10"
								id="password" style="width: 200px"></td>
							

						</tr>


			<tr>

							<th colspan="3" style="width: 100px" align="center"
								valign="bottom">
								<!-- <button type="button" id="login" > -->
								<div id="img">
									<pre></pre>
									<font style="font-size: 10; color: red;">${status}</font>
									<br>
									<img src="img/regi2.jpg" id="register" style="width: 100px; height: 35px;">
									<pre></pre>
								</div> <!-- </th>
							<th style="width: 100px" align="center" valign="bottom">
								<div id="img">
									<pre></pre>
									<button id="register" style="width: 100px; height: 35px;">회원가입</button>

								</div>
							</th> -->
						</tr>




					</table>

					

				</form>
			</div>
		</center>
	</div>
</body>
</html>