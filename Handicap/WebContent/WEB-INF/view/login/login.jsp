<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){	
	$("#login").click(function(){
		if (login == 2)
		{
			$("#loginform").attr({action:"/Handicap/main", method:'post'});
	        $("#loginform").submit();
		}
		else if (login == 0)
		{
			alert("아이디가 존재하지 않습니다.");
		}
		else if(login == 1)
	   {
			alert("비밀번호가 맞지 않습니다.");
    	}
	});
	

});
</script>


    </HEAD>
    <BODY>
       <form name = "login"action="sessionLogin.jsp" method="post"id="loginform">
    <table border="0" width="200" height="100">
        <tr>
            <td align=right><font size="2">아이디 : </font></td>
            <td><input type="text" name="userid" size="10"></td>
        </tr>
        <tr>
		<td align=right><font size="2">비밀번호 : </font></td>
		<td><input type="password" name="passwd" size="10"></td>
		</tr>
        <tr>
            <td colspan="2" align="center">
                <button type="button" id="login">로그인</button>
                <button type="button" id="register">회원가입</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>