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
<title>Insert title here</title>
</head>
<body>
   <div id="CssWrapper" align="center">
      <%@include file="../top.jsp"%>


      <div id="CssContent1" align="center">
         <%@include file="../menu.jsp"%>
      </div>
      <!-- center 끝 -->
      <div id="registerFormSelect">
         <ul class="registerSelect">
            <li style="margin-bottom: 30px;">환영합니다.</li>
            
            <li>장애인을 위한 커뮤니티</li>
            

         </ul>

         <ul class="registerSelectA">
            회원 종류에 따라 이용하는 게시판이 달라집니다.
            <br> 본인이 해당하는 회원 종류를 선택해 주시길 바랍니다.
         </ul>



         <div id="registerFormtab" class="registerSelectTable" align="center" >

            <img src="/Handicap/img/General.png"
               onclick="location.href='/Handicap/registerForm'">
            <!-- 일반회원 -->

            <img src="/Handicap/img/Company.png"
               onclick="location.href='/Handicap/registerForm_C'" style=" margin-right: 110px;">
            <!-- 기업회원 -->





         </div>
      </div>
   </div>

   

</body>
</html>