<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<!-- bbsList.jsp -->
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
///////////////////////////////글검색
%>
<body>
<table width="800" align="center" border="1">
	<tr>
		<td align="left" width="20%">&nbsp;[글수:<%= rcnt %>]</td>
			<td align="center" width="60%">
			<font size="4" color="">게시판 리스트</font>
			</td>
			<td align="right" width="20%"></td>
	</tr>
</table><br>
<table width="800" align="center" border="1">
	<tr>
		<td width="10%" bgcolor="#cccccc">&nbsp;번호</td>
		<td width="17%" bgcolor="#cccccc">&nbsp;제목</td>
		<td width="50%" bgcolor="#cccccc">&nbsp;작성자</td>
		<td width="13%" bgcolor="#cccccc">&nbsp;작성일</td>
		<td width="10%" bgcolor="#cccccc">&nbsp;조회</td>
	</tr>
	<%--
		Vector listVector = boardQuery.getBoardList(offset,limit);
	
		//JSP 빈에서 가져와서 뿌리기
		for(int k=0; k<listVector.size();k++){
			BoardBean boardBean = (BoardBean)listVector.elementAt(k);
	--%>
	<tr>
		<td>&nbsp;<%=boardBean.getIdx() %></td>
		<td>&nbsp;<%=boardBean.getWdate() %></td>
		<td>&nbsp;<a href="content.jsp?idx=<%= boardBean.getIdx() %>"><%= boardBean.getTitle() %></a></td>
		<td>&nbsp;<%=boardBean.getName() %></td>
		<td>&nbsp;<%=boardBean.getHit() %></td>
	</tr>
	<%-- <%
		} //for문 끝
	%> --%>
</table>
<%
	//페이지 처리하기
	PagingCount pc = new PagingCount(rcnt);
%>
<%= pc.showPaging(pagelink,"list.jsp") %>

<br>
<!-- ////////////////////////////// -->
  <form action="search.jsp" method=post name="sform">
	<table width="800" align="center" border="1">
		<tr>
			<td align="center">
				<select name=find>
					<option value=name>이 름</option>
					<option value=title selected>제 목</option>
					<option value=content>내 용</option>
				</select>	
				<input type="text" name="search" size="20">
				<input type="button" value="글찾기" onclick="send(this.form);">	
			</td>
		</tr>
		<tr>
			<td align="right">
				<button type="button">글쓰기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>