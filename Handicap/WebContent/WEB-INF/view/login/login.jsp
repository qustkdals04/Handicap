<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </HEAD>
    <BODY>
       <form action="sessionLogin.jsp" method="post">
    <table border="0" width="200" height="100">
        <tr>
            <td align=right><font size="2">아이디 : </font></td>
            <td><input type="text" name="id" size="10"></td>
        </tr>
        <tr>
		<td align=right><font size="2">비밀번호 : </font></td>
		<td><input type="password" name="password" size="10"></td>
		</tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="로그인">
                <input type="button"  value="회원가입" onclick="registerForm.jsp">
            </td>
        </tr>
    </table>
</form>
</body>
</html>