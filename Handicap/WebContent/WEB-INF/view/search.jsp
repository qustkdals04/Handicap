<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과</title>
</head>
<body>
<c:if test="${list == null }">
	<a>메인으로 돌아가기</a>
</c:if>
<c:if test="${list != null }">
	<c:forEach var="result" items="${list }">
		<c:choose>
			<c:when test="${result.boardno == 10 }">
				<table>		
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>소식 - 공지사항</td>	
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td><td></td>
					</tr>
				</table>
			</c:when>		
		</c:choose>       
		<c:choose>
			<c:when test="${result.boardno == 11 }">		
				<table>					
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>소식 - 뉴스</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 20 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>게시판 - 신체적장애</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 21 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>게시판 - 정신적장애</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 22 }">		
				<table>	
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>게시판 - 동호회</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 23 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>게시판 - 여행</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 30 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>의료장비 - 사고팔기</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 31 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>의료장비 - 질문과답변</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 32 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>의료장비 - 사용후기</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 40 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>일자리정보</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 50 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>고객센터 - QnA</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
		<c:choose>
			<c:when test="${result.boardno == 51 }">		
				<table>
					<tr>
						<td>${result.title }</td><td>${result.writedate }</td><td>고객센터 - 게시판요청</td>
					</tr>
					<tr>
						<td colspan="2">${result.contents }</td>
					</tr>
					<tr>
						<td>조회 : ${result.hits }</td><td>추천 : ${result.good }</td>
					</tr>
				</table>
			</c:when>		
		</c:choose>
	</c:forEach>
</c:if>
</body>
</html>