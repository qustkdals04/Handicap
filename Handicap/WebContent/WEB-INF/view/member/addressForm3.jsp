<%@page import="com.handicap.model.beans.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
   List<ZipcodeVO> list = (List<ZipcodeVO>)request.getAttribute("addressList");
   for(int i=0; i<list.size(); i++){
	   ZipcodeVO zip = list.get(i);
	   String empty = "";
	   out.print("{");
	   out.print("\"zipcode\":\""+zip.getZipcode()+"\"");
	   out.print(",\"sido\":\""+zip.getSido()+"\"");
	   out.print(",\"gugun\":\""+zip.getGugun()+"\"");
	   out.print(",\"dong\":\""+zip.getDong()+"\"");
	   if (zip.getBunji() != null){
		   out.print(",\"bunji\":\""+zip.getBunji()+"\"");
	   }
	   else{
		   out.print(",\"bunji\":\""+empty+"\"");
	   }
	   out.print("}");
	   if(i < list.size()-1)out.print(",");
   }
%>
]