<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- registerForm.jsp -->
<body>
	<center>
		<h3>일반회원가입폼</h3>
		<form>
		<table border="1">
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="userid" style="width:100; height:22"></td>
				<td><button>중복체크</button></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="password" name="passwd" style="width:100; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호확인 : </td>
				<td><input type="password" name="passwd2" style="width:100; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" style="width:100; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>닉네임 : </td>
				<td><input type="text" name="nickname" style="width:100; height:22"></td>
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
					<input type="text" name="phone2" style="width:45; height:22">
					<input type="text" name="phone3" style="width:45; height:22">
				</td>
				<td></td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td><input type="text" name="email" style="width:150; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호질문 : </td>
				<td><input type="text" name="pquestion" style="width:150; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호답 : </td>
				<td><input type="text" name="panswer" style="width:150; height:22"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><button>회원가입</button><button>가입취소</button></td>
				<td></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>