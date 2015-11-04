<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	href="/Handicap/css/mainview.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#idCheck").click(function() {
							var checkId = "userid=" + $("#userid").val();
							if ($("#userid").val() == "") {
								alert("아이디를 입력해주세요");
								$("#userid").focus();
							} else {
								$.ajax({
									type : "GET",
									url : "idcheck",
									data : checkId,
									success : function(data) {
										if ($.trim(data) != "") {
											chkid = false;
											alert("사용불가능합니다");
											$("#userid").val() == "";
											$("#userid").focus();
										} else {
											chkid = true;
											alert("사용가능합니다");
											$("#passwd").focus();
										}
									}
								});
							}
						});

						$("#nickCheck").click(function() {
							var checkNick = "nickname=" + $("#nickname").val();
							if ($("#nickname").val() == "") {
								alert("닉네임을 입력해주세요");
								$("#nickname").focus();
							} else {
								$.ajax({
									type : "GET",
									url : "nickcheck",
									data : checkNick,
									success : function(data) {
										if ($.trim(data) != "") {

											chkNick = false;
											alert("사용불가능합니다");
											$("#nickname").val() == "";
											$("#nickname").focus();
										} else {
											chkNick = true;
											alert("사용가능합니다");
										}
									}
								});
							}
						});

						$("#register")
								.click(
										function() {
											var regId = /^[a-z]+[a-z0-9]{4,12}$/g;
											var userid = $("#userid").val();
											var passwd = $("#passwd").val();
											var reg_pw = /^[a-z0-9_]{5,12}$/;
											var email = $("#email").val();
											var phone2 = $("#phone2").val();
											var phone3 = $("#phone3").val();
											var regPhone2 = /[^0-9]$/g;
											var regPhone3 = /[^0-9]$/g;
											var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

											var chkid = false;
											var chknick = false;
											$("#register")
													.click(
															function() {
																if (userid == "") {
																	alert("아이디를 입력해주세요..");
																	$("#userid")
																			.focus();
																} else if (regId
																		.test(userid) == false) {
																	alert("아이디는 4자~12자영문과 숫자로 입력해주세요");
																	$("#userid")
																			.focus();
																} else if (reg_pw
																		.test(passwd) == false) {
																	alert("비밀번호를 입력해주세요..");
																	$("#passwd")
																			.focus();
																} else if ($(
																		"#passwd2")
																		.val() == "") {
																	$(
																			"#passwd2")
																			.focus();
																	alert("비밀번호확인을 입력해주세요..");
																} else if ($(
																		"#passwd")
																		.val() != $(
																		"#passwd2")
																		.val()) {
																	alert("비밀번호와 비밀번호확인이 일치하지않습니다..")
																} else if ($(
																		"#name")
																		.val() == "") {
																	alert("이름을 입력해주세요..");
																	$("#name")
																			.focus();
																} else if ($(
																		"#nickname")
																		.val() == "") {
																	alert("닉네임을 입력해주세요..");
																	$(
																			"#nickname")
																			.focus();
																} else if (phone2 == "") {
																	alert("연락처를 입력해주세요..");
																	$("#phone2")
																			.focus();
																} else if (regPhone2
																		.test(phone2) == true) {
																	alert("전화번호는 숫자만 입력해주세요");
																	$("#phone2")
																			.focus();
																} else if (regPhone3
																		.test(phone3) == true) {
																	alert("전화번호는 숫자만 입력해주세요");
																	$("#phone3")
																			.focus();
																} else if ($(
																		"#phone2")
																		.val() == "") {
																	alert("연락처를 입력해주세요..");
																	$("#phone3")
																			.focus();
																} else if ($(
																		"#email")
																		.val() == "") {
																	alert("이메일을 입력해주세요..");
																	$("#email")
																			.focus();
																} else if (regEmail
																		.test(email) == false) {
																	alert("이메일 형식이 올바르지 않습니다.");
																	$("#email")
																			.focus();
																} else if ($(
																		"#pquestion")
																		.val() == "") {
																	alert("비밀번호 질문을 입력해주세요..");
																	$(
																			"#pquestion")
																			.focus();
																} else if ($(
																		"#panswer")
																		.val() == "") {
																	alert("비밀번호답을 입력해주세요..");
																	$(
																			"#panswer")
																			.focus();
																} else {
																	/* if(chkid==false || chknick==false){
																		alert("ID중복체크와 닉네임중복체크를 해주세요");
																	}else{ */
																	$(
																			"#registForm")
																			.attr(
																					{
																						action : "register",
																						method : 'post'
																					});
																	$(
																			"#registForm")
																			.submit();
																}
																/* } */
															})
										});

					});
</script>
</head>
<!-- registerForm.jsp -->
<body>
	<center>
		<div id="wrapper" align="left">
			<%@include file="../top.jsp"%>
			<div id="content" align="center">
				<%@include file="../menu.jsp"%>
			</div>

			




			<form method="post" name="registForm" id="registForm">
				<div id="dd" align="center">
					<table width="800px" class="re" align="center">
						<tr>
							<!-- 개인정보 메인 -->

							<th colspan="2" 
								style="font-size: x-large; font-weight: bold; color: silver;">회원정보 수정
							</th>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*아이디</td>
							<!-- <td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*아이디</td> -->
							
							<td><pre>   </pre><input type="text" name="userid" id="userid"
								style="width: 100; height: 22" readonly="readonly"
								value="${user.userid }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*비밀번호</td>
							<td> <pre>   </pre><input type="password" name="passwd" id="passwd"
								style="width: 100; height: 22" value="${user.passwd }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*비밀번호확인 </td>
							<td> <pre>   </pre><input type="password" name="passwd2" id="passwd2"
								style="width: 100; height: 22" value="${user.passwd }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*이름 </td>
							<td> <pre>   </pre><input type="text" name="name" id="name"
								style="width: 100; height: 22" readonly="readonly"
								value="${user.name }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*닉네임 </td>
							<td> <pre>   </pre><input type="text" name="nickname" id="nickname"
								style="width: 100; height: 22" readonly="readonly"
								value="${user.nickname }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*연락처 </td>
							<td> <pre>   </pre><select name="phone1" id="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
							</select>  <%-- </select> <input type="text" name="phone2" id="phone2"
						style="width: 45; height: 22" maxlength="4" value="${fn:substring(${user.phone},3,6) }"> <input
						type="text" name="phone3" id="phone3"
						style="width: 45; height: 22" maxlength="4" value="${fn:substring(${user.phone},6,9) }">></td> --%>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*이메일 </td>
							<td> <pre>   </pre><input type="text" name="email" id="email"
								style="width: 150; height: 22" value="${user.email }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*비밀번호질문 </td>
							<td> <pre>   </pre><input type="text" name="pquestion" id="pquestion"
								style="width: 150; height: 22" value="${user.pquestion }"></td>
							
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"> <pre>   </pre>*비밀번호답 </td>
							<td> <pre>   </pre><input type="text" name="panswer" id="panswer"
								style="width: 150; height: 22" value="${user.panswer }"></td>
							
						</tr>
						<tr>
							<td></td>
							<td><pre> </pre><button type="button" id="register" >수정</button>
								<button id="cancel">취소</button><pre></pre></td>
								
								
							
						</tr>
						<tr>
							<th colspan="2"><pre>  </pre></th>
						</tr>
						
					</table>
					</div>
					<input type="hidden" name="flag" value="member">
			</form>
			
		</div>

		<div id="sidebar" align="right">
			<%@include file="../banner.jsp"%>
		</div>
	
	</center>
	
</body>
</html>