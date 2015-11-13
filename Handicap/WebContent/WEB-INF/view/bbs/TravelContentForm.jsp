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


		<table border="1" class="ClubContentList">
			<tr height="30px">
				<td align="left" width="350px" colspan="2">작성자 :
					${bbsReviewContent.author}</td>
				<td align="right" width="350px">작성일 :
					${bbsReviewContent.writedate}</td>
			</tr>


			<tr height="30px">
				<td align="left" colspan="4">제 목 : ${bbsReviewContent.title}</td>
			</tr>


			<tr height="300px">
				<td colspan="4"><c:if test="${bbsFileName !=null }">
						<c:forEach var="bbsfile" items="${bbsFileName}">
							<img src="/HandicapUpload/img/${bbsfile.filename}">
						</c:forEach>
					</c:if> <br>${bbsReviewContent.contents}</td>
			</tr>

			<tr height="30px">
				<td align="right" width="700px" colspan="4">추천수 :
					${bbsReviewContent.good} 평점 : ${bbsReviewContent.star} 조회수 :
					${bbsReviewContent.hits}</td>
			</tr>

			<tr height="30px">
				<td align="left" colspan="1" width="100px">첨부파일</td>
				<td colspan="3"><c:forEach var="bbsFileName"
						items="${bbsFileName}">
						<input type="hidden" name="fileid" value="${bbsFileName.fileid}">
						<tr>
							<td colspan="3">${bbsFileName.filename}</td>
						</tr>
					</c:forEach></td>
			</tr>


			<tr height="30px">
				<td>
						<button type="button" id="list" onclick="location.href='/HandicapUpload/bbsReviewList'">목록</button>
				</td>
				<td align="right" colspan="3">
							<button type="button"	id="goodupdate" >추천</button>
							<button type="button" id="update"	onclick="location.href='/HandicapUpload/bbsReviewUpdateForm?boardno=${bbsNoticeContent.boardno}&no=${bbsNoticeContent.no}'">수정</button>
							<button type="button" id="delete">삭제</button>
				</td>

			</tr>
		</table>
		<input type="hidden" name="no" value="${bbsReviewContent.no }">
		<%-- <input type="hidden" name="fileid" value="${bbsfilename.fileid}"> --%>
	</form>
</html>