<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="phone" value="${user.phone }" />
<c:set var="addr" value="${user.companyaddr }" />
<c:set var="addr2" value="${fn:indexOf(addr, ',')}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">

<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var chkpw = true;
	var chkname = true;
	var chkphone2 = true;
	var chkphone3 = true;
	var chkemail = true;
	var chkpq = true;
	var chkpa = true;

	var regNonExcept = /[^가-힣A-Za-z0-9]/;
	var regPhone2 = /^[0-9]{3,4}$/; //핸드폰번호 정규식
	var regPhone3 = /^[0-9]{4}$/;
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	$(document)
			.ready(
					function() {
						$("#delete").click(function() { //삭제버튼
							if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
								$("#registForm").attr({
									action : 'registerdelete',
									method : 'get'
								});
								$("#registForm").submit();
							} else {
								return; // 취소
							}
						});

						//회사명(닉네임) 중복검사
						$("#nickCheck")
								.click(
										function() {
											var checkNick = "nickname="
													+ $("#nickname").val();
											if ($("#nickname").val() == "") {
												alert("닉네임을 입력해주세요");
												$("#nickname").focus();
											} else if ($("#nickname").val()
													.indexOf("'") != -1) {
												alert("\'는 입력할 수 없습니다.");
											} else if ($("#nickname").val().length < 2
													|| $("#nickname").val()
															.search(/[ㄱ-ㅎ]/) != -1) {
												alert("닉네임은 2자~12자 사이의 완성된 글자로만 입력이 가능합니다.");
												$("#nickname").val("");
												$("#nickname").focus();
											} else {
												$
														.ajax({
															type : "GET",
															url : "../nickCheck",
															data : checkNick,
															success : function(
																	data) {
																if ($
																		.trim(data) != "") {
																	alert("이미 존재하는 닉네임입니다.");
																	$(
																			"#nickname")
																			.val(
																					"");
																	$(
																			"#nickname")
																			.focus();
																} else {
																	alert("사용 가능한 닉네임입니다.");
																	chknick = true;
																	$(
																			"#companyno")
																			.focus();
																}
															}
														});
											}
										});

						//회사명(닉네임) 변경 시 중복검사 유무 해제
						$("#nickname").change(function() {
							chknick = false;
						})

						//비밀번호와 비밀번호 확인 일치 유무
						$("#passwd")
								.change(
										function() {
											$('#messageE').remove();
											$('#message').remove();
											if ($("#passwd").val().indexOf("'") != -1) {
												$('#pwExcept')
														.append(
																'<font id=\"messageE\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
												chkpw = false;
											} else if ($("#passwd").val().length < 6) {
												$('#pwExcept')
														.append(
																'<font id=\"messageE\" size=\"2\" color=#FF0000>\최소 6자 이상만 입력이 가능합니다.</font>');
												chkpw = false;
											} else if ($("#passwd2").val() != $(
													"#passwd").val()
													&& $("#passwd2").val() != "") {
												$('#pwEqual')
														.append(
																'<font id=\"message\" size=\"2\" color=#FF0000>비밀번호가 일치하지 않습니다.</font>');
												chkpw = false;
											} else {
												chkpw = true;
											}
										})
						$("#passwd2")
								.change(
										function() {
											$('#message').remove();
											if ($("#passwd2").val() != $(
													"#passwd").val()
													&& $("#passwd").val()
															.indexOf("'") == -1
													&& $("#passwd").val().length >= 6) {
												$('#pwEqual')
														.append(
																'<font id=\"message\" size=\"2\" color=#FF0000>비밀번호가 일치하지 않습니다.</font>');
												chkpw = false;
											} else {
												chkpw = true;
											}
										})

						$("#companytype")
								.change(
										function() {
											$('#messageT').remove();
											if (regNonExcept.test($(
													"#companytype").val())) {
												$('#regType')
														.append(
																'<font id=\"messageT\" size=\"2\" color=#FF0000>\완성된 글자만 입력이 가능합니다.</font>');
												chktype = false;
											} else {
												chktype = true;
											}
										})

						$("#companyceoname")
								.change(
										function() {
											$('#messageC').remove();
											if (regNonExcept.test($(
													"#companyceoname").val())) {
												$('#regCeo')
														.append(
																'<font id=\"messageC\" size=\"2\" color=#FF0000>\완성된 글자만 입력이 가능합니다.</font>');
												chkceo = false;
											} else {
												chkceo = true;
											}
										});

						$("#findAddress").click(
								function() {
									var address = window.open(
											'/Handicap/addressForm', '', 'top='
													+ (screen.height / 2 - 125)
													+ ',left='
													+ (screen.width / 2 - 310)
													+ ',width=620,height=250');
								});

						$("#companyaddress3")
								.change(
										function() {
											$('#messageA').remove();
											if ($("#companyaddress3").val()
													.indexOf("'") != -1) {
												$('#regA')
														.append(
																'<font id=\"messageA\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
												chkadd = false;
											} else {
												chkadd = true;
											}
										})

						$("#name")
								.change(
										function() {
											$('#messageN').remove();
											if (regNonExcept.test($("#name")
													.val())) {
												$('#regName')
														.append(
																'<font id=\"messageN\" size=\"2\" color=#FF0000>\완성된 글자만 입력이 가능합니다.</font>');
												chkname = false;
											} else {
												chkname = true;
											}
										});

						$("#phone2")
								.change(
										function() {
											$('#messageP').remove();
											if (!regPhone2.test($("#phone2")
													.val())
													&& $("#phone2").val() != "") {
												$('#regPhone')
														.append(
																'<font id=\"messageP\" size=\"2\" color=#FF0000>연락처를 정확히 입력해 주세요.</font>');
												chkphone2 = false;
											} else {
												chkphone2 = true;
											}
										})
						$("#phone3")
								.change(
										function() {
											$('#messageP').remove();
											if (!regPhone3.test($("#phone3")
													.val())
													&& $("#phone3").val() != "") {
												$('#regPhone')
														.append(
																'<font id=\"messageP\" size=\"2\" color=#FF0000>연락처를 정확히 입력해 주세요.</font>');
												chkphone3 = false;
											} else {
												chkphone3 = true;
											}
										})

						$("#email")
								.change(
										function() {
											$('#messageEmail').remove();
											if (!regEmail.test($("#email")
													.val())) {
												$('#regEmail')
														.append(
																'<font id=\"messageEmail\" size=\"2\" color=#FF0000>이메일을 정확히 입력해 주세요.</font>');
												chkemail = false;
											} else {
												chkemail = true;
											}
										})

						$("#pqid").change(function() {
							if ($("#pqid").val() == 0) {
								alert("비밀번호 질문을 선택해주세요.");
								chkpq = false;
							} else {
								chkpq = true;
								$("#panswer").focus();
							}
						});

						$("#panswer")
								.change(
										function() {
											$('#messagePa').remove();
											if ($("#panswer").val()
													.indexOf("'") != -1) {
												$('#regPa')
														.append(
																'<font id=\"messagePa\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
												chkpa = false;
											} else {
												chkpa = true;
											}
										});

						$("#register").click(function() {
							if ($("#passwd").val() == "") {
								alert("비밀번호를 입력해 주세요.");
								$("#passwd").focus();
							} else if ($("#passwd2").val() == "") {
								alert("비밀번호 확인을 입력해 주세요.");
								$("#passwd2").focus();
							} else if (!chkpw) {

							} else if ($("#name").val() == "") {
								alert("이름을 입력해 주세요.");
								$("#name").focus();
							} else if (!chkname) {

							} else if ($("#phone2").val() == "") {
								alert("연락처를 입력해 주세요.");
								$("#phone2").focus();
							} else if (!chkphone2) {

							} else if ($("#phone3").val() == "") {
								alert("연락처를 입력해 주세요.");
								$("#phone3").focus();
							} else if (!chkphone3) {

							} else if ($("#email").val() == "") {
								alert("이메일을 입력해 주세요.");
								$("#phone3").focus();
							} else if (!chkemail) {

							} else if($("#pqid").val()==0){
		                         alert("비밀번호 찾기 질문을 선택해 주세요.");                          
		                    } else if (!chkpq) {

							} else if ($("#panswer").val() == "") {
								alert("비밀번호 찾기 답을 입력해 주세요.");
								$("#panswer").focus();
							} else if (!chkpa) {

							} else {
								$("#registForm").attr({
									action : "registerupdateformaction",
									method : 'post'
								});
								$("#registForm").submit();
							}
						});

					});
</script>
</head>
<!-- registerForm.jsp -->
<body>

	<center>

		<div id="CssWrapper" align="left">
			<%@include file="../top.jsp"%>


			<div id="CssContent1" align="center">
				<%@include file="../menu.jsp"%>
			</div>
			<!-- 시작 -->
			<table>
			<tr>
			</table>
			<div id="DD" align="right" style="width: 1016px;">
				<img src="/Handicap/img/bn.jpg" align="right">
			</div>

			<!-- <div id="EE" align="left">※ 한번 등록된 ID는 변경할 수 없으므로 신중하게 기입하여
				주십시오.</div> -->


			<form name="registForm" id="registForm">
				<div id="dd" align="center">
					<table class="re2">



						<tr>
							<!-- 기업회원정보 메인 -->

							<th colspan="3" class="re2"
								style="font-size: x-large; font-weight: bold; color: silver;">기업회원정보수정</th>
						<tr>

							<td style="font-weight: bold;" align="left"><pre>   </pre>*아이디</td>
							<!-- <td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*아이디</td> -->

							<td><pre>   </pre><font size="4">${user.userid }</font></td>
						</tr>
						<tr>
							<td width="150" align="left" style="font-weight: bold;"><pre> </pre>*비밀번호</td>
							<td colspan="2" id="pwExcept"><pre>  </pre><input
								type="password" name="passwd" id="passwd"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.passwd }"> <pre>   </pre></td>

						</tr>

						<tr>
							<td width="150" align="left" style="font-weight: bold;">*비밀번호확인</td>

							<td id="pwEqual" colspan="2"><pre></pre><input
								type="password" name="passwd2" id="passwd2"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.passwd }"> <pre> </pre></td>
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*회사명
							</td>
							<td style="width: 176px;"><pre> </pre> <input type="text"
								name="nickname" id="nickname"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.nickname }"></td>
							<td><pre> </pre>

								<button type="button" class="ml-button"
									style="font-weight: bold;" id="nickCheck">중복체크</button></td>
						</tr>
						<tr>
							<td width="150" align="left" style="font-weight: bold;"><pre> </pre>*업종</td>
							<td colspan="2" id="regType"><pre>  </pre><input type="text"
								name="companytype" id="companytype"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.companytype }"> <pre>   </pre></td>
						</tr>
						<tr>
							<td style="font-weight: bold;" align="left"><pre>   </pre>*사업자등록번호
							</td>
							<td><pre>   </pre><font size="4">${user.companyno }</font></td>
						</tr>
						<tr>
							<td width="150" align="left"
								style="font-weight: bold; width: 114px">*대표자명</td>

							<td colspan="2" id="pwEqual" colspan="2"><pre></pre><input
								type="text" name="companyceoname" id="companyceoname"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.companyceoname }"> <pre> </pre></td>

						</tr>
						<!-- <td width="150" align="left" style="font-weight: bold;">*닉네임</td>
							<td><input type="text" name="nickname" id="nickname"
								style="vertical-align:; width: 150; height: 28px">
								</td>
								<td style="width: 593px; ">
								 <button class="ml-button"  style="font-weight: bold;" id="nickCheck">중복체크</button>
								 <button type="button" id="nickCheck">닉네임 중복 검사</button>	
								</td> -->
						<tr>
							<td valign="middle" width="150" align="left"
								style="font-weight: bold;">*회사주소</td>
							<td colspan="2" id="regA" style="width: 514px;"><input
								type="text" name="companyaddress1" id="companyaddress1"
								style="width: 50px; height: 22" readonly
								value="${fn:substring(addr,0, 7)}"> <input type="text"
								name="companyaddress2" id="companyaddress2"
								style="width: 350px; height: 22" readonly
								value="${fn:substring(addr,8, addr2)}"> <pre></pre> <span
								style="font-size: 10pt;">상세주소 : </span><input type="text"
								name="companyaddress3" id="companyaddress3"
								style="width: 180px; height: 22" readonly="readonly"
								maxlength="20" value="${fn:substring(addr, addr2+2, 99)}">
								<button type="button" class="ml-button"
									style="font-weight: bold; width: 30; height: 20;"
									id="findAddress">검색</button></td>

						</tr>

						<tr>
							<td width="150" align="left" style="font-weight: bold;"
								valign="middle"><pre>  </pre>*담당자명</td>

							<td id="regName" colspan="2"><pre> </pre><input type="text"
								name="name" id="name" maxlength="10"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.name }"> <pre> </pre></td>

						</tr>
						<!-- <td ><pre> </pre>

								 <button class="ml-button"  style="font-weight: bold;" id="nickCheck">중복체크</button>
							
								</td> -->

						<tr>
							<td width="150" align="left" style="font-weight: bold;"><pre> </pre>*연락처</td>
							<td id="regPhone" colspan="2"><pre> </pre> <select
								name="phone1" id="phone1" style="width: 50; height: 25">
									<option value="${fn:substring(phone,0,3)}">${fn:substring(phone,0,3)}</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
							</select> <input type="text" name="phone2" id="phone2"
								style="width: 45px; height: 22" maxlength="4"
								value="${fn:substring(phone,3,7)}"> <input type="text"
								name="phone3" id="phone3" style="width: 45px; height: 22"
								maxlength="4" value="${fn:substring(phone,7,11)}"> <pre> </pre>
							</td>

						</tr>
						<tr>
							<td width="150" align="left" style="font-weight: bold;">*이메일</td>
							<td id="regEmail" colspan="2"><input type="text"
								name="email" id="email"
								style="vertical-align:; width: 150; height: 28px"
								value="${user.email }"> <pre> </pre></td>

						</tr>
						<tr>
							<td width="150" align="left" style="font-weight: bold;">*비밀번호
								질문</td>
							<td id="regPq" colspan="2"><select name="pqid" id="pqid">
									<option value="${user.pquestion }">${user.pquestion }</option>
									<option value="0">비밀번호 힌트 질문</option>
									<option value="1">아버지 성함은?</option>
									<option value="2">어머니 성함은?</option>
									<option value="3">출신 고등학교 이름은?</option>
									<option value="4">키우는 애완동물의 이름은?</option>
									<option value="5">초등학교 시절 담임 선생님의 이름은?</option>
									<option value="6">가장 기억에 남는 장소는?</option>
									<option value="7">나의 좌우명은?</option>
									<option value="8">나의 보물 1호는?</option>
									<option value="9">오래도록 기억하고 싶은 날짜는?</option>
									<option value="10">초등학교 시절 나의 꿈은?</option>
							</select> <pre> </pre></td>

						</tr>
						<tr>
							<td colspan="1" width="150" align="left"
								style="font-weight: bold;">*비밀번호 답</td>
							<td colspan="2" id="regPa"><input type="text" name="panswer"
								id="panswer" style="vertical-align:; width: 150; height: 28px"
								value="${user.panswer }"> <pre> </pre></td>

						</tr>
						<tr>
							<td></td>
							<td colspan="2"><pre> </pre>
								<button type="button" class="ml-button"
									style="font-weight: bold;" id="register">수정</button>
								<button type="button" class="ml-button"
									style="font-weight: bold;" id="delete">회원탈퇴</button>
								<button type="button" class="ml-button"
									style="font-weight: bold;" id="cancel"
									onclick="location.href='/Handicap/'">취소</button></td>

						</tr>
						<tr>
							<th colspan="3"><pre>  </pre></th>
						</tr>

					</table>

					<input type="hidden" name="flag" value="2"> <input
						type="hidden" name="userid" value="${user.userid }"> <input
						type="hidden" name="companyno" value="${user.companyno }">

					<input type="hidden" name="image" value="">
				</div>
			</form>


		</div>
	</center>


	<!-- 끝 -->


</body>
</html>


<style>
button {
	/* display: block; */
	width: 80px;
	height: 30px;
	border-radius: 4px;
	text-align: center;
	line-height: 15px;
	text-decoration: none;
	font-family: 'Helvetica';
	font-weight: bold;
	font-size: 11pt;
	/* float: left; */
	margin: 0px 20px;
}

.ml-button {
	background-color: #F39C45;
	/* border: 1px solid #A87017; */
	-moz-box-shadow: inset 0px 0px 1px rgba(184, 129, 39, 1);
	-webkit-box-shadow: inset 0px 0px 1px rgba(184, 129, 39, 1);
	box-shadow: inset 0px 0px 1px rgba(184, 129, 39, 1);
	/* background-image: -o-linear-gradient(90deg , rgb(250,153,60) 0%, rgb(244,197,140) 100%);
	background-image: -moz-linear-gradient(90deg , rgb(250,153,60) 0%, rgb(244,197,140) 100%);
	background-image: -webkit-linear-gradient(90deg , rgb(250,153,60) 0%, rgb(244,197,140) 100%);
	background-image: -ms-linear-gradient(90deg , rgb(250,153,60) 0%, rgb(244,197,140) 100%);
	background-image: linear-gradient(90deg , rgb(250,153,60) 0%, rgb(244,197,140) 100%); */
	color: #ffffff;
	text-shadow: rgba(254, 252, 252, 0.5) 0px 1px 0px;
}
</style>