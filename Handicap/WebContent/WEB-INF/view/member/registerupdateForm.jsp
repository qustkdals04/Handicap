<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="phone" value="${user.phone }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<script type="text/javascript">
var chkphone2 = true;
var chkphone3 = true;		

var reg_pw = /^[a-z0-9_]{5,12}$/;
var regPhone2 = /^[0-9]{3,4}$/; //핸드폰번호 정규식
var regPhone3 = /^[0-9]{4}$/;
var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	$(document)
			.ready(function() {
						$("#phone2").change(function() {
							$('#messageP').remove();
							if(!regPhone2.test($("#phone2").val())&&$("#phone2").val()!=""){
								$('#regPhone').append('<font id=\"messageP\" size=\"2\" color=#FF0000>연락처를 정확히 입력해 주세요.</font>');
								chkphone2 = false;
							} else {
								chkphone2 = true;
							}
						})
						$("#phone3").change(function() {
							$('#messageP').remove();
							if(!regPhone3.test($("#phone3").val())&&$("#phone3").val()!=""){
								$('#regPhone').append('<font id=\"messageP\" size=\"2\" color=#FF0000>연락처를 정확히 입력해 주세요.</font>');
								chkphone3 = false;
							} else {
								chkphone3 = true;
							}
						})
						
						
						$("#register")
								.click(					
										function() {
											var passwd = $("#passwd").val();											
											var email = $("#email").val();										
											
											if (reg_pw.test(passwd) == false) {
												alert("비밀번호를 입력해주세요..");
												$("#passwd").focus();
											} else if ($("#passwd2").val() == "") {
												$("#passwd2").focus();
												alert("비밀번호확인을 입력해주세요..");
											} else if ($("#passwd").val() != $(
													"#passwd2").val()) {
												alert("비밀번호와 비밀번호확인이 일치하지않습니다..")
											} else if($("#phone2").val()==""){
									        	alert("연락처를 입력해 주세요.");
									        	$("#phone2").focus();
									        } else if(!chkphone2){
									        	
									        } else if($("#phone3").val()==""){
									        	alert("연락처를 입력해 주세요.");
									        	$("#phone3").focus();
									        } else if(!chkphone3){
									        	
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
												$("#registForm").attr({
													action : "registerupdateformaction",
													method : 'post'
												});
												$("#registForm").submit();
											}
											/* } */
										})

					});
</script>
</head>
<!-- registerupdateForm.jsp -->
<body>
	<center>
		<div id="CssWrapper" align="left">
			<%@include file="../top.jsp"%>
			<div id="CssContent" align="center">
				<%@include file="../menu.jsp"%>
			</div>
			<form method="post" name="registForm" id="registForm">
				<div id="dd" align="center">
					<table width="800px" class="re" align="center">
						<tr>
							<!-- 개인정보 메인 -->

							<th colspan="2"
								style="font-size: x-large; font-weight: bold; color: silver;">회원정보
								수정</th>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*아이디</td>
							<!-- <td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*아이디</td> -->

							<td><pre>   </pre><font size="4">${user.userid }</font></td>

						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*비밀번호</td>
							<td><pre>   </pre><input type="password" name="passwd"
								id="passwd" style="width: 100; height: 22"
								value="${user.passwd }"></td>

						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*비밀번호확인
							</td>
							<td><pre>   </pre><input type="password" name="passwd2"
								id="passwd2" style="width: 100; height: 22"
								value="${user.passwd }"></td>

						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*이름
							</td>
							<td><pre>   </pre><input type="text" name="name" id="name"
								style="width: 100; height: 22" value="${user.name }"></td>

						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*닉네임
							</td>
							<td><pre>   </pre><font size="4">${user.nickname }</font></td>

						</tr>						
						<tr>
							<td width="150" align="left" style="font-weight: bold;"><pre> </pre>*연락처</td>
							<td id="regPhone" colspan="2"><pre> </pre>
							<select name="phone1" id="phone1" style="width: 50; height: 25">
									<option value="${fn:substring(phone,0,3)}">${fn:substring(phone,0,3)}</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
							</select> <input type="text" name="phone2" id="phone2"
								style="width: 45px; height: 22" maxlength="4" value="${fn:substring(phone,3,7)}"> <input
								type="text" name="phone3" id="phone3"
								style="width: 45px; height: 22" maxlength="4" value="${fn:substring(phone,7,11)}"> <pre> </pre>
							</td>    
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*이메일
							</td>
							<td><pre>   </pre><input type="text" name="email" id="email"
								style="width: 150; height: 22" value="${user.email }"></td>

						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*비밀번호질문
							</td>
							<td><pre>   </pre><input type="text" name="pquestion"
								id="pquestion" style="width: 150; height: 22"
								value="${user.pquestion }"></td>

						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*비밀번호답
							</td>
							<td><pre>   </pre><input type="text" name="panswer"
								id="panswer" style="width: 150; height: 22"
								value="${user.panswer }"></td>

						</tr>
						<tr>
							<td></td>
							<td><pre> </pre>
								<button type="button" class="ml-button" id="register">수정</button>
								<button type="button" class="ml-button" id="cancel">취소</button>
								<pre></pre></td>



						</tr>
						<tr>
							<th colspan="2"><pre>  </pre></th>
						</tr>

					</table>
				</div>
				<input type="hidden" name="flag" value="1">
				<input type="hidden" name="userid" value="${user.userid }">
				<input type="hidden" name="nickname" value="${user.nickname }">
				 <input
						type="hidden" name="companyceoname" value=""> <input
						type="hidden" name="companyaddr" value=""> <input
						type="hidden" name="companytype" value="">
			</form>

		</div>

		<div id="sidebar" align="right">
			<%@include file="../banner.jsp"%>
		</div>

	</center>

</body>
</html>