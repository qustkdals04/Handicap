<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
var domain;
domain= location.href;
domain=domain.split("/");
	$(document).ready(function(){	
		$("#findidForm").hide();
		$("#findpwForm").hide();
		if(domain[4]=="findid"){
			$("#findidForm").show();
		} else if (domain[4]=="findpw"){
			$("#findpwForm").show();
		} else {
			$("#findidForm").hide();
			$("#findpwForm").hide();
		}		
		$("#searchid").click(function(){
			$("#findidForm").show();
			$("#findpwForm").hide();
		});
		$("#searchpw").click(function(){
			$("#findidForm").hide();
			$("#findpwForm").show();
		});
		$("#btnfindId").click(function(){			
			if($("#name").val()==""){
				alert("이름을 입력해주세요..");				
				$("#name").focus();
			} else if($("#email").val()==""){
				alert("이메일을 입력해주세요..");					
				$("#email").focus();
			} else{
				$("#findidForm").attr({
					action : "findid",
					method : "post"
				});
				$("#findidForm").submit();
			}
		});
		
		$("#btnfindPw").click(function(){			
			if($("#userid").val()==""){
				alert("아이디를 입력해주세요..");
				$("#userid").focus();
			} else if($("#pquestion").val()==""){
				alert("비밀번호 질문을 입력해주세요..");
				$("#pquestion").focus();
			} else if($("#panswer").val()==""){
				alert("비밀번호 답을 입력해주세요..");
				$("#panswer").focus();
			} else{
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
	<button type="button" id="searchid" style="width: 150px;height: 50px;">ID찾기</button><button type="button" id="searchpw" style="width: 150px;height: 50px;">PW찾기</button>
	<form id="findidForm" name="findidForm">
	<table>
	<tr><td>이름 :</td><td colspan="2"><input type="text" name="name" id="name" class="findid"></td></tr>
	<tr><td>이메일 :</td><td><input type="text" name="email" id="email" class="findid"></td><td><button type="button" class="findid" id="btnfindId">찾기</button></td></tr>
	</table>
	</form>
	<form id="findpwForm" name="findpwForm">
	<table>
	<tr><td>아이디 :</td><td colspan="2"><input type="text" name="userid" id="userid" class="findpw"></td></tr>
	<tr><td>비밀번호 질문 :</td><td colspan="2"><input type="text" name="pquestion" id="pquestion" class="findpw"></td></tr>
	<tr><td>비밀번호 답 :</td><td><input type="text" name="panswer" id="panswer" class="findpw"></td><td><button type="button" class="findpw" id="btnfindPw">찾기</button></td></tr>
	</table>
	</form>
</center>
</body>
</html>