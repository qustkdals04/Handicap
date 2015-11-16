<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
var chkid = false; //아이디 중복검사 유무
var chknick = false; //회사명(닉네임) 중복검사 유무
var chkpw = false;
var chkname = false;
var chkphone2 = false;
var chkphone3 = false;
var chkemail = false;
var chkpq = false;
var chkpa = false;

var regId = /^[A-Za-z]{1}[A-Za-z0-9]{3,11}$/; //아이디 정규식
var regNonExcept = /[^가-힣A-Za-z0-9]/;
var regPhone2 = /^[0-9]{3,4}$/; //핸드폰번호 정규식
var regPhone3 = /^[0-9]{4}$/;
var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
   $(document).ready(function() {
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
                        alert("닉네임을 입력해주세요");
                        $("#nickname").focus();
                     } else if($("#nickname").val().indexOf("'") != -1){
                        alert("\'는 입력할 수 없습니다.");
                     } else if($("#nickname").val().length<2||$("#nickname").val().search(/[ㄱ-ㅎ]/)!=-1){
                        alert("닉네임은 2자~12자 사이의 완성된 글자로만 입력이 가능합니다.");
                        $("#nickname").val("");
                        $("#nickname").focus();
                     } else {
                        $.ajax({
                           type : "GET",
                           url : "nickCheck",
                           data : checkNick,
                           success : function(data) {
                              if ($.trim(data) != "") {
                                 alert("이미 존재하는 닉네임입니다.");
                                 $("#nickname").val("");
                                 $("#nickname").focus();
                              } else {
                                 alert("사용 가능한 닉네임입니다.");
                                 chknick = true;
                                 $("#companyno").focus();
                              }
                           }
                        });
                     }
                  });
                  
                  //회사명(닉네임) 변경 시 중복검사 유무 해제
                  $("#nickname").change(function() {
                     chknick = false;
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
                  
                 /*  $("#pquestion").change(function() {
                     $('#messagePq').remove();
                     if($("#pquestion").val().indexOf("'") != -1){
                        $('#regPq').append('<font id=\"messagePq\" size=\"2\" color=#FF0000>\'는 입력할 수 없습니다.</font>');
                        chkpq = false;
                     } else {
                        chkpq = true;
                     }
                  }); */
                  $("#pqid").change(function(){
                	 if($("#pqid").val()==0){
                		 alert("비밀번호 질문을 선택해주세요.");
                		 chkpq = false;
                	 } else {
                		 chkpq = true;
                		 $("#panswer").focus();
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
                        alert("닉네임을 입력해 주세요.");
                        $("#nickname").focus();
                     } else if(!chknick){
                           alert("닉네임 중복확인을 해 주세요.");           
                       } else if($("#name").val()==""){
                          alert("이름을 입력해 주세요.");
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
                          
                       } else if($("#pqid").val()==0){
                          alert("비밀번호 찾기 질문을 선택해 주세요.");                          
                       } else if(!chkpq){
                    	   
                       } else if($("#panswer").val()==""){
                          alert("비밀번호 찾기 답을 입력해 주세요.");
                          $("#panswer").focus();
                       } else if(!chkpa){
                          
                       } else {
                          $("#registForm").attr({
                               action : "register",
                               method : 'post'
                           });
                           $("#registForm").submit();
                           alert("회원가입이 완료되었습니다.");
                       }
                  });

               });
</script>
</head>
<!-- registerForm.jsp -->
<body>



      <div id="CssWrapper" align="center">
         <%@include file="../top.jsp"%>


         <div id="CssContent" align="center">
            <%@include file="../menu.jsp"%>
         </div>





         <!-- 시작 -->
         <center>
         <div id="DD" align="right" style="width: 800px;">
            <img src="img/bn.jpg" align="right"><br><br><br>
         </div>
         </center>
		<center>
         <div id="EE" align="center">※ 한번 등록된 ID는 변경할 수 없으므로 신중하게 기입하여
            주십시오.</div>
   </center>
 
         <form method="post" name="registForm" id="registForm">
			  <center>
            <div id="CssContent" align="center">
              <center>
              <table  class="re2">
                  <tr>
                     <!-- 개인정보 메인 -->

                       <th colspan="3" class="re2"
                        style="font-size: x-large; font-weight: bold; color: silver;">일반회원가입</th>
                  <tr>

                     <td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*아이디</td>

                     <td style="width: 176px; "><pre> </pre> <input type="text" name="userid"
                        id="userid" style="vertical-align:; width: 150; height: 28px">
                        </td>
                        <td ><pre> </pre>

                         <button type="button" class="ml-button"  style="font-weight: bold;" id="idCheck">중복체크</button>
                     
                        </td>


                  </tr>


                  <tr>
                     <td width="150" align="left" style="font-weight: bold;"><pre> </pre>*비밀번호</td>
                     <td colspan="2" id="pwExcept"><pre>  </pre><input type="password" name="passwd" id="passwd"
                        style="vertical-align:; width: 150; height: 28px"><pre>   </pre> 
                     </td>                  

                  </tr>

                  <tr>
                     <td width="150" align="left" style="font-weight: bold;">*비밀번호확인</td>

                     <td id="pwEqual" colspan="2"><pre></pre><input type="password" name="passwd2" id="passwd2"
                        style="vertical-align:; width: 150; height: 28px"> <pre> </pre>
                     </td>

                  </tr>




                  <tr>
                     <td width="150" align="left" style="font-weight: bold;">*이름</td>
                     <td id="regName" colspan="2"><input type="text" name="name" id="name"
                        style="vertical-align:; width: 150; height: 28px"> <pre> </pre>
                     </td>

                  </tr>
                  <tr>
                     <td width="150" align="left" style="font-weight: bold;"><pre>   </pre>*닉네임</td>

                     <td style="width: 176px; "><pre> </pre> <input type="text"  name="nickname" id="nickname"
                         style="vertical-align:; width: 150; height: 28px">
                        </td>
                        <td ><pre> </pre>
                        
                         <button type="button" class="ml-button"  style="font-weight: bold;" id="nickCheck">중복체크</button>
                     
                        </td>
                     <!-- <td width="150" align="left" style="font-weight: bold;">*닉네임</td>
                     <td><input type="text" name="nickname" id="nickname"
                        style="vertical-align:; width: 150; height: 28px">
                        </td>
                        <td style="width: 593px; ">
                         <button class="ml-button"  style="font-weight: bold;" id="nickCheck">중복체크</button>
                         <button type="button" id="nickCheck">닉네임 중복 검사</button>   
                        </td> -->

                  </tr>
                  <tr>
                     <td width="150" align="left" style="font-weight: bold;"><pre> </pre>*연락처</td>
                     <td id="regPhone" colspan="2"><pre> </pre><select name="phone1" id="phone1"
                        style="width: 50; height: 25">
                           <option value="010">010</option>
                           <option value="011">011</option>
                           <option value="016">016</option>
                           <option value="019">019</option>
                     </select> <input type="text" name="phone2" id="phone2"
                        style="width: 45px; height: 22" maxlength="4"> <input
                        type="text" name="phone3" id="phone3"
                        style="width: 45px; height: 22" maxlength="4"> <pre> </pre>
                     </td>    

                  </tr>
                  <tr>
                     <td width="150" align="left" style="font-weight: bold;">*이메일</td>
                     <td id="regEmail" colspan="2"><input type="text" name="email" id="email"
                        style="vertical-align:; width: 150; height: 28px"> <pre> </pre>
                     </td>

                  </tr>
                  <tr>
                     <td width="150" align="left" style="font-weight: bold;">*비밀번호
                        질문</td>
                     <td id="regPq" colspan="2">
                     <select name="pqid" id="pqid">
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
                     </select>
                     <pre> </pre>
                     <!-- <input type="text" name="pquestion" id="pquestion"
                        style="vertical-align:; width: 150; height: 28px"> <pre> </pre> -->
                     </td>

                  </tr>
                  <tr>
                     <td colspan="1" width="150" align="left" style="font-weight: bold;">*비밀번호
                        답</td>
                     <td  colspan="2" id="regPa"><input type="text" name="panswer" id="panswer"
                        style="vertical-align:; width: 150; height: 28px"> <pre> </pre>
                     </td>

                  </tr>
                  <tr>
                     <td></td>
                     <td colspan="2"><pre> </pre>
                      <button type="button" class="ml-button"  style="font-weight: bold;" id="register">가입</button>
                      <button type="button" class="ml-button"  style="font-weight: bold;"
                        id="cancel">취소</button> <!-- <button type="button" id="register">가입</button>
                  <button id="cancel">취소</button> --></td>

                  </tr>
                  <tr>
                     <th colspan="3" ><pre>  </pre></th>
                  </tr>

               </table>
                        </center>

               <input type="hidden" name="flag" value="1"> <input
                  type="hidden" name="companyno" value=""> <input
                  type="hidden" name="companyceoname" value=""> <input
                  type="hidden" name="companyaddr" value=""> <input
                  type="hidden" name="companytype" value="">
                  <input type="hidden" name="image" value="default.JPG">
            </div>
            </center>
   
         </form>
         <%@include file = "../Footer.jsp" %>


      </div>




   <!-- 끝 -->


</body>
</html>