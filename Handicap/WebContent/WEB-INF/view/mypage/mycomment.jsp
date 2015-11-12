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
		out.print(",\"writedate\":\""+bcv.getWritedate()+"\"");
		out.print(",\"bad\":\""+bcv.getBad()+"\"");
		out.print(",\"no\":\""+bcv.getNo()+"\"");
		out.print(",\"boarno\":\""+bcv.getBoardno()+"\"");
		out.print("}");
		if(i < list.size()-1) out.print(",");
	}
%>
]