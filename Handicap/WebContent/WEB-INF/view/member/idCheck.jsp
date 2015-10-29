<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.handicap.model.dao.UserDAOImpl"></jsp:useBean>

<%
   String userid=request.getParameter("userid");
   System.out.print(userid);
   String str="";
   try{
      String idCheck =dao.findPasswd(userid);
      if(equals(idCheck)){         
         out.print(str);
      }else{         
         out.print(str);
         }
      }catch(Exception e){
         e.printStackTrace();
      }
   
%>