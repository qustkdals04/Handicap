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
	검색결과가 없습니다.
</c:if>
<c:if test="${list != null }">
	<c:forEach var="result" items="${list }">
		<table>
			<tr>
				<td>${result.title }</td><td>${result.writedate }</td>
			</tr>
			<tr>
				<td colspan="2">${result.contents }</td>
			</tr>
			<tr>
				<td>${result.hits }</td><td>${result.good }</td>
			</tr>
		</table>
	</c:forEach>
</c:if>
</body>
</html>