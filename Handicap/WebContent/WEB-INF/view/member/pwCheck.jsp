<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
	<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnOk").click(function(){
			if($("#passwd").val()==""){
				alert("비밀번호를 입력해주세요!!");
				$("passwd").focus();
			} else{
				$("#pwcheckForm").attr({
					action : "pwcheckaction",
					method : 'get'
				});
				$("#pwcheckForm").submit();
			}
		});
	});
</script>
</head>
<body>
<center>
<table align="center">

	<tr align="center"><td><%@include file="../top.jsp" %></td><td></td></tr>	
	<tr align="center"><td><%@include file="../menu.jsp" %></td><td></td></tr>
	<tr><td valign="top">

	<form name="pwcheckForm" id="pwcheckForm" style="width: 249px; ">
	<div  align="center" style="width: 881px; ">
	
	
	<pre style="height: 69px; "></pre>
		<table align="center" style="width: 634px; margin-bottom: 100px;" class="mem"  width="800px">
		<tr>
							<!-- 개인정보 메인 -->
							
							<td colspan="2" 
								style="font-size: xx-large; font-weight: bold; color: black;  " align="center"><pre></pre>비밀번호 확인<pre></pre>
							</td>
							
							</tr>
							<tr>
									<th style="color:silver; ">  통합회원 정보 수정을 위해  비밀번호 확인 절차를 거칩니다.</th>
							</tr>
							
			
			<tr>
				<td align="center">
				<pre></pre>
					<input type="password" name="passwd" id="passwd" ></td>
				
			</tr>
			<tr>
					<td><pre></pre> ※ 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시한번 입력하시기 바랍니다. </td>
			</tr>
			<tr>
				<td align="center"><pre ></pre><button type="button" class="ml-button" id="btnOk" >확인</button><pre></pre></td>
			</tr>
			<tr>
				<th></th>
			</tr>
			
		</table>
		
		</div>
		
	</form>
	
	</td>
	<%-- <td><%@include file="../banner.jsp" %> </td> --%>
	
	</tr>
	<tr>
			<td>
					<%@include file = "../Footer.jsp" %>
			</td>
	</tr>
	
	</table>
	
	</center>
	
</body>

</html>