<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
		$("#registerupdate").click(function(){	
			var passwd = $("#passwd").val();
			var reg_pw = /^[a-z0-9_]{5,12}$/;
			var email = $("#email").val();		
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			
			if (reg_pw.test(passwd) == false) {
				alert("비밀번호를 입력해주세요..");
				$("#passwd").focus();
			} else if ($("#passwd2").val() == "") {
				$("#passwd2").focus();
				alert("비밀번호확인을 입력해주세요..");
			} else if ($("#passwd").val() != $("#passwd2").val()){
				alert("비밀번호와 비밀번호확인이 일치하지않습니다..")
			} else if ($("#email").val() == "") {
				alert("이메일을 입력해주세요..");
				$("#email").focus();				
			} else if (regEmail.test(email) == false) {
				alert("이메일 형식이 올바르지 않습니다.");
				$("#email").focus();				
			} else if ($("#pquestion").val() == "") {
				alert("비밀번호 질문을 입력해주세요..");
				$("#pquestion").focus();				
			} else if ($("#panswer").val() == "") {
				alert("비밀번호답을 입력해주세요..");
				$("#panswer").focus();				
			} else {
				/* if(chkid==false || chknick==false){
					alert("ID중복체크와 닉네임중복체크를 해주세요");
				}else{ */
				$("#registupdateForm").attr({
					action : "registerupdateformaction",
					method : 'post'
				});
				$("#registupdateForm").submit();
				}
			/* } */
		})		
});
</script>
</head>
<!-- registerForm.jsp -->
<body>

	<table>
	<tr><td><%@include file="../viewtop.jsp" %></td><td></td></tr>	
	<tr><td><%@include file="../menu.jsp" %></td><td></td></tr>
	<tr><td valign="top">
	<center>
		<h3>회원정보수정</h3>
		<form method="post" name="registupdateForm" id="registupdateForm">
			<table border="1">
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="userid" id="userid"
						style="width: 100; height: 22" readonly="readonly" value="${user.userid }"></td>
					
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="passwd" id="passwd"
						style="width: 100; height: 22" value="${user.passwd }"></td>
					
				</tr>
				<tr>
					<td>비밀번호확인 :</td>
					<td><input type="password" name="passwd2" id="passwd2"
						style="width: 100; height: 22" value="${user.passwd }"></td>
					
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="name" id="name"
						style="width: 100; height: 22" readonly="readonly" value="${user.name }"></td>
					
				</tr>
				<tr>
					<td>닉네임 :</td>
					<td><input type="text" name="nickname" id="nickname"
						style="width: 100; height: 22" readonly="readonly" value="${user.nickname }"></td>
					
				</tr>
				<tr>
					<td>연락처 :</td>
					<td><input type="text" name="phone3" id="phone3"
						style="width: 45; height: 22" maxlength="4" value="${user.phone}" readonly="readonly"></td>
					
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="email" id="email"
						style="width: 150; height: 22" value="${user.email }"></td>
					
				</tr>
				<tr>
					<td>비밀번호질문 :</td>
					<td><input type="text" name="pquestion" id="pquestion"
						style="width: 150; height: 22" value="${user.pquestion }"></td>
					
				</tr>
				<tr>
					<td>비밀번호답 :</td>
					<td><input type="text" name="panswer" id="panswer"
						style="width: 150; height: 22" value="${user.panswer }"></td>
					
				</tr>
				<tr>
					<td></td>
					<td><button type="button" id="registerupdate">수정</button>
						<button id="cancel">취소</button></td>
					
				</tr>
			</table>
			<input type="hidden" name="flag" value="member">
		</form>
		</td><td><%@include file="../banner.jsp" %> </td></tr>
	
	</table>
	</center>
</body>
</html>