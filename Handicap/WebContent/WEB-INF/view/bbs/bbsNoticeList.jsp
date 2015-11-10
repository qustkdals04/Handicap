<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import ="com.handicap.model.beans.BbsVO" %>
 <%@ page import = "com.handicap.model.dao.BbsDAO" %>
 <jsp:useBean id="BbsVO" class="com.handicap.model.beans.BbsVO" />
 <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
 
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
               <td align="center">공지사항</td>
         </tr>
</table>
   
   <table class="bbsList">
      <tr height="20px">
         <th width="10%">글번호</th>
         <th width="40%">제  목</th>
         <th width="14%">작성자</th>
         <th width="20%">작성일</th>
         <th width="8%">조회수</th>
         <th width="8%">추천수</th>      
      </tr>
      <tr>
      
       <c:forEach var="bbs" items="${list}">
            <tr>
               <td align="center">${bbs.no}</td>
               <td align="center" ><a href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.title}</a></td>
               <td align="center">${bbs.author}</td>
               <td align="center">${bbs.writedate}</td>
               <td align="center">${bbs.hits}</td>
               <td align="center">${bbs.good}</td>
            </tr>
         </c:forEach>
         
         </tr> 
      <tr>
         <input type="hidden" name="pageNumber" value="${pageNumber }">
      </tr>
      
   </table>
   <table align="center">
      <tr>
         <td style="font-size: large;">
            <c:if test="${startPage>1 }">
               <span>
                  <a href="/Handicap/bbsList?pageNumber=${startPage-1 }">이전</a>
               </span>
            </c:if>
            <c:forEach var="i" begin="${startPage }" end="${endPage }">
               <c:choose>
                  <c:when test="${pageNumber==i }">
                     <span>
                        <a href="/Handicap/bbsList?pageNumber=${i }" style="text-decoration:none;color:blue;font-weight:bold;">${i}</a>&nbsp;
                     </span>
                  </c:when>
                  <c:otherwise>
                     <span>
                        <a href="/Handicap/bbsList?pageNumber=${i}" style="text-decoration:none;color:gray;">${i}</a>&nbsp;
                     </span>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <c:if test="${endPage<totalPageCount}">
               <span>
                  <a href="/Handicap/bbsList?pageNumber=${endPage+1 }">다음</a>
               </span>
            </c:if>
         </td>
      </tr>
   </table>
   <table style="margin-top: 5px">
      <tr align="right">
         <td colspan="6"><button type="button" class="ml-button" onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>      
      </tr>
   </table>
   

</body>
</html>