<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.handicap.control.*" %>
<jsp:useBean id="address" class="com.handicap.control.MyController" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js" ></script>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<script type="text/javascript">
$(document).ready(function() {
	var chkid = false; //아이디 중복검사 유무
	var chknick = false; //회사명(닉네임) 중복검사 유무
	var chkno = false; //사업자등록번호 중복검사 유무
	
	var chkpw = false;
	var chktype = false;
	var chkceo = false;
	var chkadd = false;
	var chkname = false;
	var chkphone2 = false;
	var chkphone3 = false;
	var chkemail = false;
	var chkpq = false;
	var chkpa = false;
	
	var regId = /^[A-Za-z]{1}[A-Za-z0-9]{3,11}$/; //아이디 정규식
	var regNonExcept = /[^가-힣A-Za-z0-9]/;
	var regNo = /^[0-9]{10}$/; //사업자등록번호 정규식
	var regPhone2 = /^[0-9]{3,4}$/; //핸드폰번호 정규식
	var regPhone3 = /^[0-9]{4}$/;
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
						
						//아이디 중복검사
						$("#idCheck").click(function() {
							var checkId = "userid=" + $("#userid").val();
							if ($("#userid").val() == "") {
								alert("아이디를 입력해주세요.");
								$("#userid").focus();
							} else if(!regId.test($("#userid").val())) {
								alert("아이디는 4자~12자 사이의 영문과 숫자로만 가능하며 첫 글자는 반드시 문자여야 합니다.");
								$("#userid").val("");
								$("#userid").focus();
							} else {
								$.ajax({
									type : "GET",
									url : "idCheck",
									data : checkId,
									success : function(data) {
										if ($.trim(data) != "") {
											alert("이미 존재하는 회원입니다.");
											$("#userid").val("");
											$("#userid").focus();
										} else {
											chkid = true;
											alert("사용 가능한 아이디입니다.");
											$("#passwd").focus();
										}
									}
								});
							}
						});
						
						//아이디 변경 시 중복검사 유무 해제
						$("#userid").change(function() {
							chkid = false;
						})
						
						//비밀번호와 비밀번호 확인 일치 유무
						$("#passwd").change(function() {
							$('#messageE').remove();
							$('#message').remove();
							if($("#passwd").val().indexOf("'") != -1){
								$('#pwExcept').append('<font id=\"messageE\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
								chkpw = false;
							} else if($("#passwd").val().length < 6){
								$('#pwExcept').append('<font id=\"messageE\" size=\"2\" color=#FF0000>\최소 6자 이상만 입력이 가능합니다.</font>');
								chkpw = false;
							} else if($("#passwd2").val()!=$("#passwd").val()&&$("#passwd2").val()!=""){
								$('#pwEqual').append('<font id=\"message\" size=\"2\" color=#FF0000>비밀번호가 일치하지 않습니다.</font>');
								chkpw = false;
							} else {
								chkpw = true;
							}
						})
						$("#passwd2").change(function() {
							$('#message').remove();
							if($("#passwd2").val()!=$("#passwd").val()&&$("#passwd").val().indexOf("'") == -1&&$("#passwd").val().length >= 6){
								$('#pwEqual').append('<font id=\"message\" size=\"2\" color=#FF0000>비밀번호가 일치하지 않습니다.</font>');
								chkpw = false;
							} else {
								chkpw = true;
							}
						})
						
						//회사명(닉네임) 중복검사
						$("#nickCheck").click(function() {
							var checkNick = "nickname=" + $("#nickname").val();
							if ($("#nickname").val() == "") {
								alert("회사명을 입력해주세요");
								$("#nickname").focus();
							} else if($("#nickname").val().indexOf("'") != -1){
								alert("\'는 입력할 수 없습니다.");
							} else if($("#nickname").val().length<2||$("#nickname").val().search(/[ㄱ-ㅎ]/)!=-1){
								alert("회사명은 2자~12자 사이의 완성된 글자로만 입력이 가능합니다.");
								$("#nickname").val("");
								$("#nickname").focus();
							} else {
								$.ajax({
									type : "GET",
									url : "nickCheck",
									data : checkNick,
									success : function(data) {
										if ($.trim(data) != "") {
											alert("이미 존재하는 회사명입니다.");
											$("#nickname").val("");
											$("#nickname").focus();
										} else {
											alert("사용 가능한 회사명입니다.");
											chknick = true;
											$("#companytype").focus();
										}
									}
								});
							}
						});
						
						//회사명(닉네임) 변경 시 중복검사 유무 해제
						$("#nickname").change(function() {
							chknick = false;
						})
						
						$("#companytype").change(function() {
							$('#messageT').remove();
							if(regNonExcept.test($("#companytype").val())){
								$('#regType').append('<font id=\"messageT\" size=\"2\" color=#FF0000>\완성된 글자만 입력이 가능합니다.</font>');
								chktype = false;
							} else {
								chktype = true;
							}	
						})
						
						//사업자등록번호 중복검사
						$("#noCheck").click(function() {
							var checkNo = "companyNo=" + $("#companyno").val();
							if ($("#companyno").val() == "") {
								alert("사업자등록번호를 입력해주세요.");
								$("#companyno").focus();
							} else if(!regNo.test($("#companyno").val())) {
								alert("사업자등록번호는 '-'를 제외한 숫자로만 입력해 주세요.");
								$("#companyno").val("");
								$("#companyno").focus();
							}
							else {
								$.ajax({
									type : "GET",
									url : "noCheck",
									data : checkNo,
									success : function(data) {
										if ($.trim(data) != "") {
											alert("이미 존재하는 번호입니다.");
											$("#companyno").val("");
											$("#companyno").focus();
										} else {
											chkno = true;
											alert("사용 가능한 번호입니다.");
											$("#companyceoname").focus();
										}
									}
								});
							}
						});
						
						$("#companyno").change(function() {
							chkno = false;
						})
						
						$("#companyceoname").change(function() {
							$('#messageC').remove();
							if(regNonExcept.test($("#companyceoname").val())){
								$('#regCeo').append('<font id=\"messageC\" size=\"2\" color=#FF0000>\완성된 글자만 입력이 가능합니다.</font>');
								chkceo = false;
							} else {
								chkceo = true;
							}					
						});
						
						$("#findAddress").click(function() {
									var address = window.open('addressForm',
											'', 'top='
													+ (screen.height / 2 - 125)
													+ ',left='
													+ (screen.width / 2 - 310)
													+ ',width=620,height=250');
						});
						
						$("#companyaddress3").change(function() {
							$('#messageA').remove();
							if($("#companyaddress3").val().indexOf("'") != -1){
								$('#regA').append('<font id=\"messageA\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
								chkadd = false;
							} else {
								chkadd = true;
							}
						})
						
						$("#name").change(function() {
							$('#messageN').remove();
							if(regNonExcept.test($("#name").val())){
								$('#regName').append('<font id=\"messageN\" size=\"2\" color=#FF0000>\완성된 글자만 입력이 가능합니다.</font>');
								chkname = false;
							} else {
								chkname = true;
							}						
						});
						
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
						
						$("#email").change(function() {
							$('#messageEmail').remove();
							if(!regEmail.test($("#email").val())){
								$('#regEmail').append('<font id=\"messageEmail\" size=\"2\" color=#FF0000>이메일을 정확히 입력해 주세요.</font>');
								chkemail = false;
							} else {
								chkemail = true;
							}
						})
						
						$("#pquestion").change(function() {
							$('#messagePq').remove();
							if($("#pquestion").val().indexOf("'") != -1){
								$('#regPq').append('<font id=\"messagePq\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
								chkpq = false;
							} else {
								chkpq = true;
							}
						});
						
						$("#panswer").change(function() {
							$('#messagePa').remove();
							if($("#panswer").val().indexOf("'") != -1){
								$('#regPa').append('<font id=\"messagePa\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
								chkpa = false;
							} else {
								chkpa = true;
							}
						});
						
						$("#register").click(function() {
							if($("#userid").val()==""){
								alert("아이디를 입력해 주세요.");
								$("#userid").focus();
							} else if(!chkid){
								alert("아이디 중복확인을 해 주세요.");
							} else if($("#passwd").val()==""){
								alert("비밀번호를 입력해 주세요.");
								$("#passwd").focus();
							} else if($("#passwd2").val()==""){
								alert("비밀번호 확인을 입력해 주세요.");
								$("#passwd2").focus();
							} else if(!chkpw){
								
							} else if($("#nickname").val()==""){
								alert("회사명을 입력해 주세요.");
								$("#nickname").focus();
							} else if(!chknick){
					            alert("회사명 중복확인을 해 주세요.");           
					        } else if($("#companytype").val()==""){
					        	alert("업종을 입력해 주세요.");
					        	$("#companytype").focus();
					        } else if(!chktype){
					        	
					        } else if($("#companyno").val()==""){
					        	alert("사업자등록번호를 입력해 주세요.");
								$("#companyno").focus();
					        } else if(!chkno){
					        	alert("사업자등록번호 중복확인을 해 주세요.");
					        } else if($("#companyceoname").val()==""){
					        	alert("대표자명을 입력해 주세요.");
					        	$("#companyceoname").focus();
					        } else if(!chkceo){
					        	
					        } else if($("#companyaddress1").val()==""){
					        	alert("회사주소를 입력해 주세요.");
					        } else if($("#companyaddress3").val()==""){
					        	alert("상세주소를 입력해 주세요.");
					        	$("#companyaddress3").focus();
					        } else if(!chkadd){
					        	
					        } else if($("#name").val()==""){
					        	alert("담당자명을 입력해 주세요.");
					        	$("#name").focus();
					        } else if(!chkname){
					        	
					        } else if($("#phone2").val()==""){
					        	alert("연락처를 입력해 주세요.");
					        	$("#phone2").focus();
					        } else if(!chkphone2){
					        	
					        } else if($("#phone3").val()==""){
					        	alert("연락처를 입력해 주세요.");
					        	$("#phone3").focus();
					        } else if(!chkphone3){
					        	
					        } else if($("#email").val()==""){
					        	alert("이메일을 입력해 주세요.");
					        	$("#phone3").focus();
					        } else if(!chkemail){
					        	
					        } else if($("#pquestion").val()==""){
					        	alert("비밀번호 찾기 질문을 입력해 주세요.");
					        	$("#pquestion").focus();
					        } else if(!chkpq){
					        	
					        } else if($("#panswer").val()==""){
					        	alert("비밀번호 찾기 답을 입력해 주세요.");
					        	$("#panswer").focus();
					        } else if(!chkpa){
					        	
					        } else {
					        	$("#registForm_C").attr({
					                action : "register",
					                method : 'post'
					            });
					            $("#registForm_C").submit();
					            alert("회원가입이 완료되었습니다.");
					        }
						});
});
</script>
</head>
<!-- registerForm_C.jsp -->
<body>

<center>
		<div id="wrapper" align="left">
			<%@include file="../top.jsp"%>


			<div id="content" align="center">
				<%@include file="../menu.jsp"%>
			</div>
			
			<!-- 시작 -->
			<div id="DD" align="right" style="width: 1016px;">
				<img src="img/bn.jpg" align="right">
			</div>

			<div id="EE" align="left">※ 한번 등록된 ID는 변경할 수 없으므로 신중하게 기입하여
				주십시오.</div>
		
		<form method="post" name="registForm_C" id="registForm_C">
			<div id="dd" align="center">
					<table  class="re">
			<tr>
				<th colspan="4" class="re"
								style="font-size: x-large; font-weight: bold; color: silver;">기업회원가입</th>
						<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*아이디 </td>
					<td><pre> </pre> <input type="text" name="userid" id="userid"
						style="width: 100; height: 22" maxlength="12"></td>
					<td colspan="2" style="width: 299px; "><pre> </pre> <img src="/Handicap/img/check.jpg" width="80" style="height: 30px;" id="idCheck"></td>
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*비밀번호 </td>
					<td colspan="3" id="pwExcept"><pre> </pre> <input type="password" name="passwd" id="passwd"
						style="width: 100; height: 22" maxlength="12"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*비밀번호확인 </td>
					<td  colspan="3" id="pwEqual"><pre> </pre> <input type="password" name="passwd2" id="passwd2"
						style="width: 100; height: 22" maxlength="12" ></td>
					
				</tr>
				<tr>
					<td  width="150" align="left" style="font-weight: bold;"><pre>   </pre>*회사명 </td>
					<td><pre> </pre> <input type="text" name="nickname" id="nickname"
						style="width: 100; height: 22" maxlength="12"></td>
					<td colspan="2"><pre> </pre> <img src="/Handicap/img/check.jpg" width="80" style="height: 30px;"id="nickCheck"></td>
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*업종 </td>
					<td colspan="3" id="regType"><pre> </pre> <input type="text" name="companytype" id="companytype"
						style="width: 100; height: 22" maxlength="12"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*사업자등록번호 </td>
					<td><pre> </pre> <input type="text" name="companyno" id="companyno"
						style="width: 100; height: 22" maxlength="10">('-' 제외)</td>
						<td colspan="2"><img src="/Handicap/img/check.jpg" width="80" style="height: 30px;" id="noCheck"></td>
					
				</tr>				
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*대표자명 </td>
					<td colspan="3" id="regCeo"><pre> </pre> <input type="text" name="companyceoname" id="companyceoname"
						style="width: 100; height: 22" maxlength="10"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*회사주소 </td>
					<td colspan="2" id="regA"><pre> </pre> <input type="text" name="companyaddress1" id="companyaddress1"
						style="width: 50px; height: 22" readonly>
						<input type="text" name="companyaddress2" id="companyaddress2"
						style="width: 350px; height: 22" readonly><br>　
						<pre></pre><span style="font-size: 10pt;">상세주소 : </span><input type="text" name="companyaddress3" id="companyaddress3"
						style="width: 180px; height: 22" readonly="readonly" maxlength="20"></td>
					<td><pre> </pre> <img src="/Handicap/img/searchbtn.png" width="70" style="height: 20px;" id="findAddress"><pre></pre></td>
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*담당자명 </td>
					<td  colspan="3" id="regName"><pre> </pre> <input type="text" name="name" id="name"
						style="width: 100; height: 22" maxlength="10"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*연락처 </td>
					<td colspan="3" id="regPhone"><pre> </pre> <select name="phone1" id="phone1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
					</select> <input type="text" name="phone2" id="phone2"
						style="width: 45px; height: 22" maxlength="4"> <input
						type="text" name="phone3" id="phone3"
						style="width: 45px; height: 22" maxlength="4"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*이메일 </td>
					<td colspan="3" id="regEmail"><pre> </pre> <input type="text" name="email" id="email"
						style="width: 150; height: 22" maxlength="25"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*비밀번호질문 </td>
					<td  colspan="3" id="regPq"><pre> </pre> <input type="text" name="pquestion" id="pquestion"
						style="width: 150; height: 22" maxlength="25"></td>
					
				</tr>
				<tr>
					<td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*비밀번호답 </td>
					<td colspan="3" id="regPa"><pre> </pre> <input type="text" name="panswer" id="panswer"
						style="width: 150; height: 22" maxlength="25"><pre> </pre> </td>
					
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><img src="/Handicap/img/regi2.jpg" width="115" style="height: 30px;" id="register">
						<img src="/Handicap/img/cel.jpg" width="115" style="height: 30px;" id="cancel">
				</tr>
				<tr>
					<th colspan="4"><pre>  </pre></th>
				</tr>
			</table>
			</div>
			<input type="hidden" name="flag" value="company">
		</form>
		
		</div>
		
	</center>
	
</body>
</html>