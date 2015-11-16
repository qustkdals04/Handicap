<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">

<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<title>검색 결과</title>
<style>
a.line {
	text-decoration: underline;
	color: blue;
}
</style>
</head>
<body>
	<div id="CssWrapper" align="center">


		<div id="top">
			<%@include file="top.jsp"%>
		</div>

		<div id="CssContent1">
			<%@include file="menu.jsp"%>
		</div>

		<div>
			<h3>검색된결과가 없습니다.</h3>
		</div>
		<c:if test="${list == null }">
			
		</c:if>
		
		<c:if test="${list != null }">
			<c:forEach var="result" items="${list }">
				<c:choose>
					<c:when test="${result.boardno == 10 }">
					
						<table border="0" width="800px" >
						
							<tr>


								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
		
								
								<td width="20%"> ${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>소식 - 공지사항  </pre></font></td>
								

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="2"><font color="silver">추천수 ${result.good }</font></td>

							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>


				<c:choose>
					<c:when test="${result.boardno == 11 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>소식 - 뉴스  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 20 }">
						<table border="0" width="800px" >
							<tr>

								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>게시판 - 신체적장애  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 21 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5" >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>게시판 - 정신적장애  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 22 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>게시판-동호회  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 23 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>게시판 - 여행 </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 30 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5">${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>의료장비 - 사고팔기  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 31 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>의료장비 - 질문과답변  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 32 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5">${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>의료장비 - 사용후기  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 40 }">
						<table border="0" width="800px" >
							<tr>
							<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5">${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>일자리 정보  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 50 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5" >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>고객센터 - QnA  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${result.boardno == 51 }">
						<table border="0" width="800px" >
							<tr>
								<td style="width: 400px;"><a href='/Handicap/bbsContent?no=${result.no }&boardno=${result.boardno}' class="line"><font size="4px">${result.title }</font></a></td>
								
	
								<td width="20%">${result.writedate }</td>


							</tr>
							<tr >
									
								<td colspan="5"  >${fn:substring(result.contents, 0,300) }...</td>
							</tr>
							<tr>
								<td ><font color="silver"><pre>고객센터 - 게시판 요청  </pre></font></td>

								<td align="center"><font color="silver" >조회수 ${result.hits }</font></td>

								<td colspan="3"><font color="silver">추천수 ${result.good }</font></td>
							</tr>
						</table>
						<br>
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