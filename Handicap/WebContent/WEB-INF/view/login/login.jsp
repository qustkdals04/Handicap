<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
			function userCreate() {
	f.action = "user_write.jsp";
	f.submit();
}

function login() {
	if ( f.userId.value == "" ) {
		alert("사용자 아이디를 입력하십시요.");
		f.userId.focus();
		return false;
	} 
	if ( f.password.value == "" ) {
		alert("비밀번호를 입력하십시요.");
		f.password.focus();
		return false;
	}	
	
	f.action = "login_action.jsp";
	f.submit();
}
</script>
</head>
<body>
		<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br/>
<table width="600" border="0" align="center">
<tr>
	<td>
	  <!-- Login Form  -->
	  <form name="f" method="post" name = "loginForm">
	  <table border="0" cellpadding="5" cellspacing="9" width="100%" bgcolor="BBBBBB">
		  <tr>
			<td width=150 align=center bgcolor="E6ECDE" height="22">아이디</td>
			<td width=450 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:200" name="userId" id= "name">
			</td>
		  </tr>
		  <tr>
			<td width=150 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
			<td width=450 bgcolor="ffffff" style="padding-left:10">
				<input type="password" style="width:200" name="password" id ="pass">
			</td>
		  </tr>
	  </table>
	  </form>
	</td>
</tr>
<tr>
	<td align=center>
		<input type="button" value="로그인" onClick="login_page()"> &nbsp;
		<input type="button" value="회원가입" onClick="registerForm()">
	</td>
</tr>
</table>  
</body>
</html>