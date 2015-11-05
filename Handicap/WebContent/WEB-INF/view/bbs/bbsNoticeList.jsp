<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import ="com.handicap.model.beans.BbsVO" %>
 <%@ page import = "com.handicap.model.dao.BbsDAO" %>
 <jsp:useBean id="BbsVO" class="com.handicap.model.beans.BbsVO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

 
</script>
</head>
<body>
	
	<table width="800" align="center" border="1">
		<tr>
			<td align="center">글번호</td>
			<td align="center">제  목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회수</td>
			<td align="center">추천수</td>		
		</tr>
		<tr>
			<c:forEach var="bbs" items="${list}">
				<tr>
					<td align="center">${bbs.no}</td>
					<td align="center"><a href="bbsNoticeContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.title}</a></td>
					<td align="center">${bbs.author}</td>
					<td align="center">${bbs.writedate}</td>
					<td align="center">${bbs.hits}</td>
					<td align="center">${bbs.good}</td>
				</tr>
			</c:forEach>
		</tr>
		<tr>
			<td colspan="6"><a href="bbsNoticeWriteForm">글쓰기</a></td>
			
		
		</tr>
	</table>

</body>
</html>