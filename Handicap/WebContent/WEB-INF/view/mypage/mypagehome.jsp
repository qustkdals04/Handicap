<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">

<title>mypage home</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#chk_info").change(function(){
			if($("#chk_info").val() == "활동내역"){
				
			} else if($("#chk_info").val() == "댓글내역"){
				
			} else{
				
			}	
		})
		
		$("#btnprofile").click(function(){
			var profile = "profile="+$("#profile").val();
			if($("#profile").val()==""){
				alert("프로필을 변경하시려면 입력후 버튼을 눌러주세요!!");
				$("#profile").focus();
			} else{
				$.ajax({
					type : "get",
					url : "mypage/updateprofile",
					data : profile,
					success : function(data){
						$("#profiletxt").text(data);
						$("#profile").val("");
					},
					error : function(status){
						alert(status);
					}
				})
			}
		});
	});
</script>
</head>
<body>
   <div id="CssWrapper" align="center">
      <%@include file="../top.jsp"%>


      <div align="center">
         <%@include file="../menu.jsp"%>
      </div>
      <!-- center 끝 -->
      <div id="CssContents">
         <table class="mypage">
            <tr>
               <td align="center"><font size="15">마이 페이지</font></td>
            </tr>
         </table>

         <table border="1" class="mypageList"> 
         	<tr><td>닉네임 : ${membernick }</td><td><button type="button" onclick="location.href='/Handicap/mypage/pwcheck'">회원정보수정</button></td></tr>
            <tr>
               <td width="200px" height="200px" align="center"
                  style="vertical-align: middle;">${mypage.image }</td>
               <!-- 이미지 공간 -->
               <td rowspan="5">
                  <table border="1" align="center" width="500px">
                     <tr>
                        <td style="vertical-align: top;" height="20px" align="center">
                           <input type="radio" name="chk_info" id="chk_info" value="활동내역">활동내역 <input
                           type="radio" name="chk_info" id="chk_info" value="댓글내역">댓글내역
                     </tr>
                     <tr>
                        <td align="center" height="500px">[내역 리스트]</td>
                        <!-- 리스트 -->
                     </tr>
                  </table>
               </td>
            </tr>
            <tr>
               <td align="center">
                  <button type="button" class="ml-button"
                     style="vertical-align: middle;">이미지 선택</button>
               </td>
            </tr>
            <tr>
               <td align="center" height="100px" style="vertical-align: middle;" id="profiletxt">${mypage.profile }</td>
               <!-- 한줄말 -->
            </tr>
            <tr>
               <td align="center"><input type="text"
                  style="width: 90%; vertical-align: middle; margin-top: 30px;" name="profile" id="profile">
                  <button type="button" class="ml-button"
                     style="vertical-align: middle;" id="btnprofile">한마디하기</button></td>
            </tr>            

         </table>
      </div>
      <%@include file="../Footer.jsp"%>
   </div>
   <!-- 전체 wapper -->















</body>
</html>