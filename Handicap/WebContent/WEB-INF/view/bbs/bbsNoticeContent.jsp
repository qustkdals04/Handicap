<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.handicap.model.beans.BbsVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.BbsVO"></jsp:useBean>
<link rel="stylesheet" type="text/css" media="all"
   href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
   href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all"
   href="/Handicap/css/styles.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
   src="/HandicapUpload/js/jquery-1.10.2.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
   $(document).ready(function() {
      $("#delete").click(function() { //삭제버튼
         if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
            $("#bbsContent").attr({
               action : 'bbsDelete',
               method : 'post'
            });
            $("#bbsContent").submit();
         } else {
            return; // 취소
         }
      });hju
      /* $("#goodupdate").click(function(){
         if(confirm("추천하였습니다!!")==true){
            $("#bbsNoticeContent").attr({action:'goodupdate', method:'post'});
            $("#bbsNoticeContent").submit();
         }
      }) */
      $("#goodupdate").click(function() {
         /*  if ($("#goodupdate")) {
            alert("추천할꺼야?");
         } else {  */
         $.ajax({
            type : "GET",
            url : "goodupdate",
            data : goodupdate,
            success : function(data) {
               goodCk = true;
               alert("추천하였습니다!!");
            }
         });
         //}
      });
   });
</script>
</head>
<body>
   <div id="CssWrapper" align="center">
      <%@include file="../top.jsp"%>
      <div align="center">
         <%@include file="../menu.jsp"%>
      </div>
      <!-- center 끝 -->
      <div id="CssContents">
         <table align="left">
            <tr>
               <td width="100px" align="center"><%@include
                     file="../new/NewSubMenu.jsp"%></td>
               <td>
                  <!-- 위에 폼 인쿨루드 -->

                  <form id="bbsContent" name="bbsContent">
                     <table class="bbsTitle">
                        <tr>
                           <td align="center"><font size="15"></font></td>
                        </tr>
                     </table>

                     <table class="bbsList">
                        <tr>
                           <td width="50px"><font size="3px"
                              style="font-weight: bold;">제목 :</td>
                           <td width="350px" align="left"><font size="3px"
                              style="font-weight: bold;">${bbsContent.category}${bbsContent.title}</font></td>
                           <td colspan="2" width="300px" align="right"><font
                              size="2px">작성일 : ${bbsContent.writedate}</font></td>
                        </tr>
                        <tr>
                           <td colspan="4" align="left"><font size="3px">작성자 :
                                 ${bbsContent.author}
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
                                 ${bbsContent.hits}</font></td>
                        </tr>
                        <tr>

                           <td colspan="4">
                                <c:if test="${bbsFileName !=null }">						
					 <c:forEach var="bbsfile" items="${bbsFileName}">					 
					 	 <img name="img" height="300px" style="width: 300px;" 
					 	 src="/Handicap/img/${bbsfile.fileoriginal}"> 					 	 
					</c:forEach>							
					</c:if>	 
                              <br>${bbsContent.contents}
                           </td>
                        </tr>
                        <tr>
                           <td align="left"><font size="1px">첨부파일 : </font></td>
                           <td colspan="4"><c:forEach var="bbsFileName"
                                 items="${bbsFileName}">
                                 <tr>
                                    <td>${bbsFileName.filename}</td>
                                 </tr>
                              </c:forEach></td>
                        </tr>
                     </table>
                     <table class="bbsList">
                        <tr>
                           <td align="left" width="400px"><button type="button"
                                 id="list"
                                 onclick="location.href='/Handicap/bbsList?boardno=${boardno}'">목록</button></td>
                           <td align="right" colspan="3" width="300px">
                              <button type="button" id="goodupdate">추천</button>
                              <button type="button" id="update"
                                 onclick="location.href='/Handicap/bbsUpdateForm?boardno=${bbsContent.boardno}&no=${bbsContent.no}'">수정</button>
                              <button type="button" id="delete">삭제</button>
                           </td>
                        </tr>
                     </table>
                     <input type="hidden" name="no" value="${bbsContent.no }">
                  </form> <!-- 아래 폼 인쿨루드 -->
               </td>
            </tr>
         </table>
      </div>
      <!-- contents 끝 -->
      <%@include file="../Footer.jsp"%>
      <%-- <div id="sidebar" align="right">
         <%@include file="../banner.jsp"%>
      </div>
 --%>
   </div>
   <br>
</body>
</html>