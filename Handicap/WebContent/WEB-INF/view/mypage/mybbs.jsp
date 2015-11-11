<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.handicap.model.beans.BbsVO"%>
[
<%
	List<BbsVO> list = (List<BbsVO>)request.getAttribute("mybbs");
	for(int i=0; i<list.size(); i++){
		
	}
%>
]