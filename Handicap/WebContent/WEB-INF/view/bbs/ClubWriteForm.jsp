<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<script type="text/javascript"  src="/HandicapUpload/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
	<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
	<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">

<script src="ckeditor/ckeditor.js"></script>
<script src="ckeditor/config.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   
   $(document).ready(function(){
      $("#delete").click(function(){          //삭제버튼
         if(confirm("정말로 삭제하시겠습니까?") == true){  // 확인
            $("#bbsReviewContent").attr({action:'bbsReviewDelete', method:'post'});
               $("#bbsReviewContent").submit();
         }
         else{
               return;   // 취소
         }
      });
      
      $("goodupdate").click(function(){
            $.ajax({
               type : "GET",
               url : "goodupdate",
               data : goodupdate,
               success : function(data){
                  
                  alert("추천하였습니다.");
               }
            })      
      })      
   });
                  
            

      
      /*  $("#goodupdate").click(function(){
          if ($("#goodupdate")) {
            alert("추천할꺼야?");
         } else { 
            $.ajax({
               type : "GET",
               url : "goodupdate",
               data : goodupdate,
               success : function(data) {                  
                     goodCk = true;
                     alert("추천하였습니다!!");                     
                  
               }
            });
         }
      });  */
   
   
      
</script>
</head>
<body>
      <form id="bbsReviewContent" name="bbsReviewContent">
         <table border="1" width="800">
            <tr>
               <td align="center">작성자</td>
               <td align="center">${bbsReviewContent.author}</td>
               <td align="center" style="width: 56px; ">작성일</td>
               <td align="center" style="width: 67px; ">${bbsReviewContent.writedate}</td>                              
            </tr>
            <tr>
               <td align="center">제  목</td>
               <td align="center" width="500">${bbsReviewContent.title}</td>
               <td align="center" style="width: 69px; ">조회수</td>
               <td align="center" style="width: 21px; ">${bbsReviewContent.hits}</td>
               
            </tr>
            <tr>
               <td align="center">내용</td>
               <td colspan="3">
               <c:if test="${bbsFileName !=null }">                  
                <c:forEach var="bbsfile" items="${bbsFileName}">
                   <img src="/HandicapUpload/img/${bbsfile.filename}">
                </c:forEach>                     
               </c:if>      
               <br>${bbsReviewContent.contents}
               </td>
                                    
            </tr>
            <tr>
               <td align="center" style="width: 69px; ">추천수</td>
               <td align="center" style="width: 21px; ">${bbsReviewContent.good}</td>                           
               <td>평점</td>
               <td>${bbsReviewContent.star}</td>
            </tr>
            <tr>
               <td align="center" style="width: 73px; ">첨부파일</td>
                                 
            </tr>
            <c:forEach var="bbsFileName" items="${bbsFileName}" >
               <input type="hidden" name="fileid" value="${bbsFileName.fileid}">
               <tr><td colspan="4">${bbsFileName.filename}</td></tr>               
               </c:forEach>
            <tr>
               
            </tr>
            <tr>
            
               <td align="center" colspan="4">
               <input type="button" id="goodupdate" value="추천">
               <input type="button" id="list" value="목록" onclick="location.href='/HandicapUpload/bbsReviewList'">
               <input type="button" id="update" value="수정" onclick="location.href='/HandicapUpload/bbsReviewUpdateForm?boardno=${bbsNoticeContent.boardno}&no=${bbsNoticeContent.no}'">
               <input type="button" id="delete" value="삭제" >
               
               </td>
                                          
            </tr>
         </table>
         <input type="hidden" name="no" value="${bbsReviewContent.no }">
         <%-- <input type="hidden" name="fileid" value="${bbsfilename.fileid}"> --%>
      </form>
</html>