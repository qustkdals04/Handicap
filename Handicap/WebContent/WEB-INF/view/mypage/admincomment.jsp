<%@page import="com.handicap.model.beans.BbsCommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
	List<BbsCommentVO> list = (List<BbsCommentVO>)request.getAttribute("mycomment");
	for(int i=0; i<list.size(); i++){
		BbsCommentVO bcv = list.get(i);
		String empty = "";
		out.print("{");
		out.print("\"contents\":\""+bcv.getContents()+"\"");
		out.print(",\"writedate\":\""+bcv.getWritedate().substring(0,10)+"\"");
		out.print(",\"no\":\""+bcv.getNo()+"\"");
		out.print(",\"bad\":\""+bcv.getBad()+"\"");
		out.print(",\"boarno\":\""+bcv.getBoardno()+"\"");
		out.print(",\"nickname\":\""+bcv.getNickname()+"\"");
		out.print("}");
		if(i < list.size()-1) out.print(",");
	}
%>
]<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>