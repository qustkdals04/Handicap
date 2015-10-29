<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#login").click(function(){	
			if($("#userid").val()==""){
				alert("아이디를 입력해주세요");
				$("#userid").focus();
			} else if($("#password").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
			} else{
				$("#loginform").attr({action:"/Handicap/memberlogin", method:'post'});
				$("#loginform").submit();				
			}	     
			/* if($("#userid").val()!=null && $("password").val()!=null){
				$("#loginform").attr({action:"/Handicap/memberlogin", method:'post'});
				$("#loginform").submit();	
			} else{
				alert("올바른 아이디와 비밀번호를 입력해주세요");
			} */
	});
	$("#register").click(function(){
		$("#loginform").attr({action:"/Handicap/registerForm", method:'post'});
		$("#loginform").submit();
	});
});
</script>
    </HEAD>
    <BODY>    
    <%@include file="../top.jsp" %>
	<%@include file="../menu.jsp" %>
	<center>
	<br>		
	<h3>로그인</h3>
       <form name = "login" id="loginform">
    <table border="0" width="200" height="100">
        <tr>
            <td align=right><font size="2">아이디 : </font></td>
            <td><input type="text" name="userid" size="10" id="userid"></td>
        </tr>
        <tr>
		<td align=right><font size="2">비밀번호 : </font></td>
		<td><input type="password" name="passwd" size="10" id="password"></td>
		</tr>
        <tr>
            <td colspan="2" align="center">
                <button type="button" id="login">로그인</button>
                <button type="button" id="register">회원가입</button>
            </td>
        </tr>
    </table>
    <font style="font-size: 10;color: red;">${status }</font>
</form>
</center>
</body>
</html>