<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/mainview.css">
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
    <div id="wrapper" >
			<%@include file="../top.jsp"%>


			<div id="content" align="center">
				<%@include file="../menu.jsp"%>
			</div> 
		
	<center>
	<br>
	<br>
	<br>	
	<div id="dd">
	<h3><img src="img/mainlogin.png" width="50" style="width: 306px; height: 79px; "></h3>
       <form name = "login" id="loginform">
    <table  width="200" height="100" style="width: 363px; ">
        <tr>
            <td align="left" width="200px"><font size="5" face="Arial Black">Login</font></td>
            <td width = "200px" ><input type="text" name="userid" size="10" id="userid" style="width: 200px" ></td>

            <td  rowspan="2" style="width: 100px" align="center" valign="bottom">
            
            		<!-- <button type="button" id="login" > -->
 					<div id = "img">
            		<img src="img/login.png" width="50" id="login" style="width: 92px; height: 55px; ">
            		</div>
			</td>
			
			<td rowspan="2" style="width: 100px" align="center" valign="bottom">
            
            		<!-- <button type="button" id="login" > -->
 					<div id = "img">
            		<img src="img/register.png" width="50" id="register" style="width: 92px; height: 55px; ">
            		</div>
			</td>
            		
            		<!-- <button type="button" id="register">회원가입</button> -->
            
        </tr>
        <tr>
		<td align="left"><font size="5" >Password</font></td>
		<td><input type="password" name="passwd" size="10" id="password" style="width: 200px"></td>

		</tr>
        <tr>
			<td	colspan="4">
						<font color="#888888">로그인 후 이용이 가입합니다.</font>
			</td>
  
 
        </tr>
        
    </table>
    
    <font style="font-size: 10;color: red;">${status }</font>
    
</form>
</div>
</center>
</div>
</body>
</html>