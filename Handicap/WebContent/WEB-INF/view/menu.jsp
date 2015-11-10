<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/Handicap/css/common.css" rel="stylesheet" type="text/css"  rel="stylesheet"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	  <!--   <script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script> -->
		<script type="text/javascript"  src="/Handicap/js/ui.js"></script>
</head>
<body>
	<script type="text/javascript">
			$(document).ready(function(){
				gnbMenu(6,0); //현재 페이지 위치
			});
		</script>
		<div id="gnb" align="center">
			<h1></h1>
			<ul id="menu" class="menu">
				<li>
					<a href="/Handicap/bbsNoticeList" >소 식</a>
					<ul>
						<li ><a href="/Handicap/bbsNoticeList" style="font:12px small; ">공지사항</a></li>
						<li><a href="/Handicap/News" style="font:12px small; " >뉴스</a></li>
						<li><a href="/Handicap/Introduce" style="font:12px small; ">사이트소개</a></li>
						
					</ul>
				</li>
				<li>
					<a href="/Handicap/body" >게시판</a>
					<ul>
						<li><a href="/Handicap/body" style="font:12px small; ">신체적장애</a></li>
						<li><a href="/Handicap/Mental" style="font:12px small; ">정신적장애</a></li>
						<li><a href="/Handicap/Club" style="font:12px small; ">동호회</a></li>
						<li><a href="/Handicap/travel" style="font:12px small; ">여행</a></li>
					</ul>
					<li>
					<a href="/Handicap/trade">의료장비</a>
					<ul>
						<li><a href="/Handicap/trade" style="font:12px small; ">사고팔기</a></li>
						<li><a href="/Handicap/question" style="font:12px small; ">질문답변</a></li>
						<li><a href="/Handicap/review" style="font:12px small; ">사용후기</a></li>
						
					</ul>
					
					
				</li>
					<li>
					<a href="/Handicap/JOB">일자리 정보 </a>
					
				</li>
				
				
				
				<li>
					<a href="/Handicap/handicaplaw" >장애인 복지법</a>
					
				</li>
					
				
				<li>
				
					<a href="/Handicap/QnA"  >고객센터</a>
					<ul class="gcb">
						<li ><a href="/Handicap/QnA" style="font:12px small; ">Q&A</a></li>
						<li><a href="/Handicap/request" style="font:12px small; ">게시판요청</a></li>
						
					</ul>
					
				</li>
				
			
					
			</ul>
			
			
		 
		</div>
	</body>
</html>