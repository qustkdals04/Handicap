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
<table class="bbsTitle">
			<tr>
					<td align="left"><font size ="50">공지사항</font></td>
			</tr>
</table>
	
	<table class="bbsList">
		<tr height="20px">
			<th width="10%">글번호</th>
			<th width="40%">제  목</th>
			<th width="15%">작성자</th>
			<th width="20%">작성일</th>
			<th width="7%">조회수</th>
			<th width="8%">추천수</th>		
		</tr>
		<tr>
		
			<%-- <c:forEach var="bbs" items="${list}">
				<tr>
					<td >${bbs.no}</td>
					<td ><a href="bbsNoticeContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.title}</a></td>
					<td >${bbs.author}</td>
					<td >${bbs.writedate}</td>
					<td >${bbs.hits}</td>
					<td >${bbs.good}</td>
				</tr>
			</c:forEach> --%>
			<tr>
					<td>1</td>
					<td>실험용 창입니다.</td>
					<td>김희주</td>
					<td>2015/11/08 18:18:18</td>
					<td>243</td>
					<td>5</td>
			</tr> 
			<tr>
					<td>2</td>
					<td>실험용 창입니다.</td>
					<td>김희주</td>
					<td>2015/11/08 18:18:18</td>
					<td>243</td>
					<td>5</td>
			</tr> 
			<tr>
					<td>3</td>
					<td>실험용 창입니다.</td>
					<td>김희주</td>
					<td>2015/11/08 18:18:18</td>
					<td>243</td>
					<td>5</td>
			</tr> 
		
		<tr align="right">
			<td colspan="6"><button type="button" class="ml-button" onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>
			
		
		</tr>
	</table>

</body>
</html>