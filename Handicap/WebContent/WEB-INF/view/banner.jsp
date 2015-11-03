<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script> 
  <script type="text/javascript" src="js/jquery.scrollfollow.js"></script> 
    
      <script type="text/javascript">
        $(document).ready(function(){
            $("#testbanner").scrollFollow({
                speed : 300    // 움직이는 속도
                , offset : 200// 웹페이지 상단에서 부터의 거리
                
            });
        });
        
       
    </script>
    <style>
    
        #testbanner{
            position: absolute;
            border: 3px solid #fff;
 
            right : 150px;
            top : 50px;
            width: 150px;
            height: 150px;
        }
    </style> 
</head>
<body>
	<div id="testbanner" >
        <table >
       	<tr>
       		<!-- 발달 장애인 지원센터 -->
       		<td><a href="http://www.broso.or.kr/"> <img src="/Handicap/img/cc .png"  ></a></td>
       		
       	</tr>
       
       	<tr>
       		<!-- 중증 장애인 직업 재활동 관리 -->
       		<td><a href="http://vr.koddi.or.kr/"> <img src="/Handicap/img/nou.png"></a></td>
       	</tr>
       	
       	<tr>
       		<!-- 인청전략기금 운영사무국 -->
       		<td><a href="http://mrr.koddi.or.kr/page/index_kor.jsp"> <img src="/Handicap/img/charter.jpg"  ></a></td>
       	</tr>
       </table>
 <div style="cursor:pointer;" onclick="window.scrollTo(0,0);"><img src="/Handicap/img/top.JPG"></div>
  </div>  
<!--  <ul>
    <li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a
  </ul> 
 -->
 <ul>
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </ul>
    
</body>
</html>