<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script> 
<script type="text/javascript" src="/Handicap/js/jquery.scrollfollow.js"></script> 
    
      <script type="text/javascript">
        $(document).ready(function(){
            $("#testbanner").scrollFollow({
                speed : 300    // 움직이는 속도
                , offset : 300// 웹페이지 상단에서 부터의 거리
                
            });
        });
        
       
    </script>
    <style>
    
        #testbanner{
            position: absolute;
        	border:1px solid #000000;
         
            top : 0px;
            left : 85%;
            width: 125px;
            height: 250px;
        }
    </style> 
</head>
<body>
	<div id="testbanner" >
        <table >
       	<tr>
       <td><a href="http://www.chest.or.kr/"><img src="/Handicap/img/bn7.JPG" style="width: 120px; "></a></td>
       	</tr>
       
       	<tr>
       	<td><a href="https://www.jobable.kr/index_knise.jsp"><img src="/Handicap/img/bn2-2.JPG" style="width: 120px; "></a></td>
       	</tr>
       	
       	<tr>
       	<td><a href="http://life.knise.kr/"><img src="/Handicap/img/bn3-2.JPG" style="width: 120px; "></a></td>
       	</tr>
       	
       	<tr>
       		<td><a href="https://tlc.knise.kr/"><img src="/Handicap/img/bn4-2.JPG" style="width: 120px; "></a></td>
       	</tr>
       	
       	<tr>
       		<td><a href="http://nlid.nl.go.kr/able?act=searchDetail03"><img src="/Handicap/img/bn5-2(2).JPG" style="width: 120px; "></a></td>
       	</tr>
       	
       	<tr>
       		<td><a href="http://iedu.knise.kr/"><img src="/Handicap/img/bn5.JPG" style="width: 120px; "></a></td>
       	</tr>
       </table>
 <div style="cursor:pointer;" onclick="window.scrollTo(0,0);"><img src="/Handicap/img/top.png" style="width: 50px; "></div>
  </div>  
<!--  <ul>
    <li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a<li>a
  </ul> 
 -->
 <ul>
 	<br><br><br><br>
 </ul>
    
</body>
</html>