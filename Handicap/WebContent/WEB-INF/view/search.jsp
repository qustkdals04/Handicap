<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">

<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<title>검색 결과</title>
</head>
<body>
	<div id="CssWrapper" align="center">

		
					<div id="top">
						<%@include file="top.jsp"%>
						</div>
				
					<div id="CssContent1">
						<%@include file="menu.jsp"%>
					</div>
					
					
					<c:if test="${list == null }">
			<a>메인으로 돌아가기</a>
		</c:if>
		<c:if test="${list != null }">
			<c:forEach var="result" items="${list }">
				<c:choose>
					<c:when test="${result.boardno == 10 }">
						<table border="0" width="800px"  class="re4">
							<tr >
							
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%"> ${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%"> ${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>소식 - 공지사항</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용 </td>
								<td colspan="5" >${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td colspan="3"> ${result.good }</td>
								
							</tr>
						</table>
					</c:when>
				</c:choose>

		
				<c:choose>
					<c:when test="${result.boardno == 11 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" align="center">작성위치</td>
								<td>소식 - 뉴스</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천 </td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 20 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center" >제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>게시판 - 신체적장애</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 21 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" align="center">작성위치</td>
								<td>게시판 - 정신적장애</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td>${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 22 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>게시판 - 동호회</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 23 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>게시판 - 여행</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 30 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>의료장비 - 사고팔기</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 31 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>의료장비 - 질문과답변</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 32 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center"> 제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center"width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>의료장비 - 사용후기</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td>${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 40 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>일자리정보</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 50 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649" align="center">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" align="center" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%" align="center">작성위치</td>
								<td>고객센터 - QnA</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 51 }">
						<table border="0" width="800px"  class="re4">
							<tr>
							<td bgcolor="#F4B649">제목</td>
								<td width="25%">${result.title }</td>
								<td bgcolor="#F4B649" width="10%">작성일</td>
								<td width="20%">${result.writedate }</td>
								<td bgcolor="#F4B649" width="10%">작성위치</td>
								<td>고객센터 - 게시판요청</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">내용</td>
								<td colspan="5">${result.contents }</td>
							</tr>
							<tr>
							<td bgcolor="#F4B649" align="center">조회</td>
								<td> ${result.hits }</td>
								<td bgcolor="#F4B649" align="center">추천</td>
								<td> ${result.good }</td>
							</tr>
						</table>
					</c:when>
				</c:choose>
			</c:forEach>
		</c:if>
		
		<div id="Foot" align="center">
			<%@include file="Footer.jsp"%>
		</div>
		</div>
		
</body>
</html>