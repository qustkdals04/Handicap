<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	var domain;
	domain = location.href;
	domain = domain.split("/");
	$(document).ready(function() {
		if (domain[4] == "findid") {
			$("#findidForm").show();
			$("#findpwForm").hide();
		} else if (domain[4] == "findpw") {
			$("#findpwForm").show();
			$("#findidForm").hide();
		} else {
			$("#findidForm").hide();
			$("#findpwForm").hide();
		}
		$("#searchid").click(function() {
			$("#findidForm").show();
			$("#findpwForm").hide();
		});
		$("#searchpw").click(function() {
			$("#findidForm").hide();
			$("#findpwForm").show();
		});
		$("#btnfindId").click(function() {
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요..");
				$("#name").focus();
			} else if ($("#email").val() == "") {
				alert("이메일을 입력해주세요..");
				$("#email").focus();
			} else {
				$("#findidForm").attr({
					action : "findid",
					method : "post"
				});
				$("#findidForm").submit();
			}
		});

		$("#btnfindPw").click(function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력해주세요..");
				$("#userid").focus();
			} else if ($("#pquestion").val() == "") {
				alert("비밀번호 질문을 입력해주세요..");
				$("#pquestion").focus();
			} else if ($("#panswer").val() == "") {
				alert("비밀번호 답을 입력해주세요..");
				$("#panswer").focus();
			} else {
				$("#findpwForm").attr({
					action : "findpw",
					method : "post"
				});
				$("#findpwForm").submit();
			}
		});
	});
</script>
</head>
<body>
	<center>
		<img src="/Handicap/img/idsearch.jpg" id="searchid"
			style="width: 150px; height: 50px;">
		<img src="/Handicap/img/pwsearch2.jpg" id="searchpw"
			style="width: 150px; height: 50px;">
		<form id="findidForm" name="findidForm">
			<table class="mem">
				<tr>
					<th colspan="3"></th>
				</tr>
				
				<tr>
					<td style="font-weight: bold;"><pre></pre>이름 :</td>
					<td colspan="2"><pre></pre><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;"><pre></pre>이메일 :</td>
					<td><pre></pre><input type="text" name="email" id="email"></td>
					<td><pre></pre><button type="button" class="ml-button" id="btnfindId">찾기</button></td>
				</tr>
			</table>
		</form>
		<form id="findpwForm" name="findpwForm">
			<table class="mem">
				<tr>
					<th colspan="3"></th>
				</tr>
				
				<tr>
					<td style="font-weight: bold;"><pre></pre>아이디 :</td>
					<td colspan="2"><pre></pre><input type="text" name="userid" id="userid"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;"><pre></pre>비밀번호 질문 :</td>
					<td colspan="2"><pre></pre><input type="text" name="pquestion"
						id="pquestion"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;"><pre></pre>비밀번호 답 :</td>
					<td><pre></pre><input type="text" name="panswer" id="panswer"></td>
					<td><pre></pre><button type="button" class="ml-button" id="btnfindId">찾기</button></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>