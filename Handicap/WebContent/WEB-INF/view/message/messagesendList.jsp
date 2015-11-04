<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import = "com.handicap.model.beans.MessageVO" %>
    <%@ page import = "com.handicap.model.dao.MessageDAO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
<title>메세지 리스트</title>
</head>
<!-- messageList.jsp -->
<body>
	<table class="gmlwn">
		<tr>
			<td>● 메시지 목록</td>
		</tr>
	</table>

	<table class="btn" style="margin-top: 5px">
		<!-- 메세지 리스트 제목창 -->
		<tr>
			<td align ="center"width="500px"></td>
			<td align="right" width = "300px">
			<button onclick="location.href='/Handicap/messagelist'" >받은 메시지</button> &nbsp;&nbsp;&nbsp;
					<button onclick="location.href='/Handicap/messageWrite'">쪽지보내기</button></td>
		</tr>
	</table>
	<br>
	<table class="list">
		<tr>
			<th width="20%">수 신 자</th>
			<th width="55%">내 용</th>
			<th width="20%">보낸날짜</th>
			<th width="5%">상 태</th>
		</tr>
		<tr>
			<c:forEach var="message" items="${messageList}">
				<tr>
					<td>${message.recipient }</td>
					<td><a
						href="/Handicap/messagesendcontent?messageno=${message.messageno }&pageNumber=${pageNumber}">${message.contents }</a></td>
					<td>${message.senddate }</td>
					<td>${message.status }</td>
				</tr>
			</c:forEach>
		</tr>
		<input type="hidden" name="pageNumber" value="${pageNumber }">
	</table>
	<table class="list">
		<tr>
			<td><c:if test="${startPage>1 }">
					<span> <a
						href="/Handicap/messagesendlist?pageNumber=${startPage-1}">이전</a>
					</span>
				</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage }">
					<c:choose>
						<c:when test="${pageNumber==i}">
							<span> <a href="/Handicap/messagesendlist?pageNumber=${i}"
								style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
							</span>
						</c:when>
						<c:otherwise>
							<span> <a href="/Handicap/messagesendlist?pageNumber=${i}"
								style="text-decoration: none; color: gray;">${i}</a>&nbsp;
							</span>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${endPage<totalPageCount}">
					<span> <a
						href="/Handicap/messagesendlist?pageNumber=${endPage+1 }">다음</a>
					</span>
				</c:if></td>
		</tr>
	</table>
</body>
</html>