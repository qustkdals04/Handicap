<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.handicap.model.beans.BbsVO"%>
[
<%
	List<BbsVO> list = (List<BbsVO>)request.getAttribute("adminbbs");
	for(int i=0; i<list.size(); i++){
		BbsVO bv = list.get(i);
		String empty = "";
		out.print("{");
		out.print("\"no\":\""+bv.getNo()+"\"");
		out.print(",\"title\":\""+bv.getTitle()+"\"");
		out.print(",\"author\":\""+bv.getNickname()+"\"");
		out.print(",\"writedate\":\""+bv.getWritedate().substring(0,10)+"\"");
		out.print(",\"hits\":\""+bv.getHits()+"\"");
		out.print(",\"bad\":\""+bv.getBad()+"\"");
		out.print(",\"boardno\":\""+bv.getBoardno()+"\"");
		out.print("}");
		if(i < list.size()-1) out.print(",");
	}
%>
]