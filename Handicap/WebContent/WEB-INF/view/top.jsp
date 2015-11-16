<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<title>Insert title here</title>

<!-- <script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script> -->
<link href="/Handicap/css/common.css" rel="stylesheet" type="text/css"  rel="stylesheet"/>
   <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
<script type="text/javascript">
	$(document).ready(function() {
		$(".a1").mouseenter(function() {
			$(".a1").css("background-color", "#F39C45");
		});
		$(".a1").mouseleave(function() {
			$(".a1").css("background-color", "white");
		});
		$(".a2").mouseenter(function() {
			$(".a2").css("background-color", "#F39C45");
		});
		$(".a2").mouseleave(function() {
			$(".a2").css("background-color", "white");
		});
		$(".a3").mouseenter(function() {
			$(".a3").css("background-color", "#F39C45");
		});
		$(".a3").mouseleave(function() {
			$(".a3").css("background-color", "white");
		});
		
		//검색
		$("#btnSearch").click(function(){
			var category = $("#category").val();
			var keyword = $("#keyword").val();
			if(keyword == ""){
				alert("검색어를 입력해주세요.")
			} else {
				$("#searchForm").attr({ action : "search" , method : "post"});
				$("#searchForm").submit();
			}
			
		});
		
		
	});
	
</script>
</head>
<body>
	<table align="center" style="background-image: url('/Handicap/img/asd.gif');">
		<tr>	
			<td rowspan="2" width="276" height="163" align="right"><img src="/Handicap/img/logo1.jpg" width="276" height="157"  style="vertical-align: middle;"  onclick="location.href='/Handicap/'"></td>
			<c:if test="${memberid!=null }">
			<td width="300" align="right" style="vertical-align: top;" >
				<div id="appLoadingIndicator">
				<div id="gc"  style="font:12px larger;bold; ">${membernick } 님 환영합니다~!!   &nbsp;&nbsp;&nbsp;
					<font size="2" id="rigthfont"><a href="javascrpt:void(0)"
						class="a1"
						onclick="window.open('/Handicap/messagelist','popup1','width=850,height=400, top='+(screen.height/2-200)+',left='+(screen.width/2-500)+'')">쪽지함</a>&nbsp;<a
						href="/Handicap/mypage" class="a2">마이페이지</a>&nbsp;<a
						href="/Handicap/logout" class="a3">로그아웃</a></font>
				</div>
				</div>
			</td>
			</c:if>
			<c:if test="${memberid==null }">
			<td width="300" align="right" style="vertical-align: top;" >
				<div id="appLoadingIndicator">
				<div id="gc">
					<div id="font" >
						<font size="2" face="돋음" class="menu"  > <a href="/Handicap/loginForm" class="a1">로그인</a>&nbsp;<a
							href="/Handicap/registertype" class="a2">회원가입</a>&nbsp;<a
							href="javascrpt:void(0)" class="a3"
							onclick="window.open('/Handicap/membersearch','popup1','width=400,height=200, top='+(screen.height/2-100)+',left='+(screen.width/2-200)+'')">ID/PW찾기</a></font>
					</div>
				</div>
				</div>
			</td>
			</c:if>
		</tr>
		<tr>
			<td   width="300px" align="left" style="vertical-align: bottom; width: 641px; margin-left: 0;">
				<div id="appLoadingIndicator">
					<div id="cell">
						<form id="searchForm" name="searchForm" method="post">
						
						<label id="select">
						<select name="category" id="category" style="outline: none;">
						
							<option value="제목">제목</option>
							<option value="내용">내용</option>
							<option value="제목+내용">제목+내용</option>
							<option value="작성자">작성자</option>
						</select>
						</label>
						<input align="bottom" name="keyword" id="keyword" placeholder="검색어를 입력해주세요."  type="text" style="width: 350px; border: 3px solid #F3B514; height: 20px ; margin-left: 0; outline:none;" >
						<button type="button" id="btnSearch" class="ml-button" style="float: none; width: 64px; height: 30px; margin-left: 0; outline: none;">검색</button>
						</form>
					</div>
				</div>
			</td>
		
		</tr>
	</table>
</body>
</html>