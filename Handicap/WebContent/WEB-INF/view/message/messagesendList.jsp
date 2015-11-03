<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import = "com.handicap.model.beans.MessageVO" %>
    <%@ page import = "com.handicap.model.dao.MessageDAO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메세지 리스트</title>
</head>
<!-- messageList.jsp -->
<body>
<table width="800" align="center" border="1">           <!-- 메세지 리스트 제목창 -->
	<tr>
			<td align="left" width="30%"><a href="/Handicap/messagelist">받은메시지함=>></a></td>
			<td align="left" width="55%">
			<font size="4">보낸 메세지</font>
			</td>
			<td align="center" width="15%"><a href="/Handicap/messageWrite">쪽지보내기</a></td>
	</tr>
</table>
<br>
<table width="800" align="center" border="1"> 
	<tr>		
		<td width="17%" bgcolor="#cccccc" align="center">&nbsp;수 신 자</td>
		<td width="53%" bgcolor="#cccccc" align="center">&nbsp;내     용</td>
		<td width="20%" bgcolor="#cccccc" align="center">&nbsp;보낸날짜</td>
		<td width="10%" bgcolor="#cccccc" align="center">&nbsp;상     태</td>
	</tr>
	<tr>
	 		<c:forEach var="message" items="${messageList}" >
	 		<tr>  	 		
  	 		<td>${message.recipient }</td>
  	 		<td><a href="/Handicap/messagesendcontent?messageno=${message.messageno }&pageNumber=${pageNumber}">${message.contents }</a></td>
  	 		<td>${message.senddate }</td>
  	 		<td>${message.status }</td>
  	 		</tr>
  	 </c:forEach>
	</tr>
	<input type="hidden" name="pageNumber" value="${pageNumber }">
</table>
<table width="800">
<tr>
	<td colspan="5" align="center">
		<c:if test="${startPage>1 }">
			<span>
				<a href="/Handicap/messagesendlist?pageNumber=${startPage-1}">이전</a>
			</span>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage }">
			<c:choose>
			<c:when test="${pageNumber==i}">
			<span>
				<a href="/Handicap/messagesendlist?pageNumber=${i}" style="text-decoration:none;color:blue;font-weight:bold;">${i}</a>&nbsp;
			</span>
			</c:when>
			<c:otherwise>
			<span>
				<a href="/Handicap/messagesendlist?pageNumber=${i}" style="text-decoration:none;color:gray;">${i}</a>&nbsp;
			</span>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage<totalPageCount}">
		<span>
			<a href="/Handicap/messagesendlist?pageNumber=${endPage+1 }">다음</a>
		</span>
		</c:if>
	</td>
</tr>
</table>
</body>
</html>