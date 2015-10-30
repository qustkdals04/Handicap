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
<%
/////////////////////////페이징 준비

int limit = 10;
int offset = 0;
int pagelink = 1;

String offset_get = request.getParameter("offset");
if(offset_get==null){
	offset = 0;
} else {
	offset = Integer.parseInt(offset_get);
}

String pagelink_get = request.getParameter("pagelink");
if(pagelink_get==null){
	pagelink = 1;
} else {
	pagelink = Integer.parseInt(pagelink_get);
}
int rcnt;
///////////////////////////////메시지검색
%>
<body>
<table width="800" align="center" border="1">           <!-- 메세지 리스트 제목창 -->
	<tr>
			<td align="center" width="85%">
			<font size="4" color="">메세지 리스트</font>
			</td>
			<td align="center" width="15%"><a href="/Handicap/messageWrite">쪽지보내기</a></td>
	</tr>
</table>
<br>
<table width="800" align="center" border="1"> 
	<tr>		
		<td width="17%" bgcolor="#cccccc" align="center">&nbsp;발 신 자</td>
		<td width="53%" bgcolor="#cccccc" align="center">&nbsp;내     용</td>
		<td width="20%" bgcolor="#cccccc" align="center">&nbsp;보낸날짜</td>
		<td width="10%" bgcolor="#cccccc" align="center">&nbsp;상     태</td>
	</tr>
	<tr>
	 		<c:forEach var="message" items="${messageList}" >
	 		<tr>  	 		
  	 		<td>${message.sender }</td>
  	 		<td><a href="/Handicap/messagecontent?messageno=${message.messageno }">${message.contents }</a></td>
  	 		<td>${message.senddate }</td>
  	 		<td>${message.status }</td>
  	 		</tr>
  	 </c:forEach>
	</tr>
</table>
 
</form>
</body>
</html>