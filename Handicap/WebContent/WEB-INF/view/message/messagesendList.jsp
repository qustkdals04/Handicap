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
    <link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<title>보낸 메시지</title>
</head>
<!-- messageList.jsp -->
<!-- messageList.jsp -->
<body>
<center>
	<table class="re">
		<tr>
			  <th colspan="3" class="re2" 
								style="font-size: x-large; font-weight: bold; color: black; padding-top: 30px; width: 800">보낸 메시지</th>
		</tr>
	</table>

	
	<br>
	<table class="list2" style="font-size: small;">
		<tr>
			<th width="15%">수 신 자</th>
			<th width="45%">내 용</th>
			<th width="33%">보낸날짜</th>
			<th width="7%">상 태</th>
		</tr>
		<tr>
			<c:forEach var="message" items="${messageList}">
				<tr>
					<td>${message.nickname }</td>
					<td><a
						href="/Handicap/messagesendcontent?messageno=${message.messageno }&pageNumber=${pageNumber}">${message.contents }</a></td>
					<td>${message.senddate }</td>
					<td>
					<c:if test="${message.status==1 }">
						<img alt="안읽음" src="/Handicap/img/1.png" width="25" height="25">
					</c:if>
					<c:if test="${message.status==2 }">
						<img alt="읽음" src="/Handicap/img/2.png" width="25" height="25">
					</c:if>
					
					</td>
				</tr>
			</c:forEach>
		</tr>
		<input type="hidden" name="pageNumber" value="${pageNumber }">
	</table>
	<table align="center">
		<tr>
			<td  style="font-size: large;"><c:if test="${startPage>1 }">
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
	<table  style="margin-top: 5px">
		<!-- 메세지 리스트 제목창 -->
		<tr>
			<td align ="center"width="500px"></td>
			<td align="right" width = "300px">
			<button  class="ml-button2"  type = "button"onclick="location.href='/Handicap/messagelist'"  style="width: 100px">받은 메시지</button>
					<button class="ml-button2"  type = "button" onclick="location.href='/Handicap/messageWrite'" style="width: 100px">쪽지보내기</button></td>
		</tr>
	</table>
	<!-- <table>
	<tr>
		<td align ="center"width="500px"></td>
			<td align="right" width = "300px">
			<button class="ml-button2" type="button" onclick="location.href='/Handicap/messagesendlist'" style="width: 100px">보낸메시지</button>
			<button class="ml-button2" type="button" onclick="location.href='/Handicap/messageWrite'" style="width: 110px">쪽지보내기</button></td>
	</tr> -->

</table>
</center>
</body>
</html>