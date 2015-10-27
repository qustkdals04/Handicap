<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#register").click(function(){
			if($("#userid").val()==""){
				$("#userid").focus();
				alert("아이디를 입력해주세요..");
			}else if($("#passwd").val()==""){
				$("#passwd").focus();
				alert("비밀번호를 입력해주세요..");
			}else if($("#passwd2").val()==""){
				$("#passwd2").focus();
				alert("비밀번호확인을 입력해주세요..");
			}else if($("#name").val()==""){
				$("#name").focus();
				alert("이름을 입력해주세요..");
			}else if($("#nickname").val()==""){
				$("#nickname").focus();
				alert("닉네임을 입력해주세요..");
			}else if($("#phone2").val()==""){
				$("#phone2").focus();
				alert("연락처를 입력해주세요..");
			}else if($("#phone3").val()==""){
				$("#phone3").focus();
				alert("연락처를 입력해주세요..");
			}else if($("#email").val()==""){
				$("#email").focus();
				alert("이메일을 입력해주세요..");
			}else if($("#pquestion").val()==""){
				$("#pquestion").focus();
				alert("비밀번호 질문을 입력해주세요..");
			}else if($("#panswer").val()==""){
				$("#panswer").focus();
				alert("비밀번호답을 입력해주세요..");
			}else{
				$("#registForm").submit();
			}			
		});
	});
</script>
</head>
<!-- registerForm.jsp -->
<body>
	<center>
		<h3>일반회원가입폼</h3>
		<form action="" method="post" name="registForm" id="registForm">
		<table border="1">
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="userid" id="userid" style="width:100; height:22"></td>
				<td><button>중복체크</button></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="password" name="passwd" id="passwd" style="width:100; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호확인 : </td>
				<td><input type="password" name="passwd2" id="passwd2" style="width:100; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" id="name" style="width:100; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>닉네임 : </td>
				<td><input type="text" name="nickname" id="nickname" style="width:100; height:22"></td>
				<td><button>중복체크</button></td>
			</tr>
			<tr>
				<td>연락처 : </td>
				<td>
					<select id="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="phone2" id="phone2" style="width:45; height:22">
					<input type="text" name="phone3" id="phone3" style="width:45; height:22">
				</td>
				<td></td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td><input type="text" name="email" id="email" style="width:150; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호질문 : </td>
				<td><input type="text" name="pquestion" id="pquestion" style="width:150; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호답 : </td>
				<td><input type="text" name="panswer" id="panswer" style="width:150; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><button id="register">회원가입</button><button id="cancel">가입취소</button></td>
				<td></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>