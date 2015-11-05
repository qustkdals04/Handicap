<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.handicap.model.beans.BbsVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.BbsVO"></jsp:useBean>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="/HandicapUpload/js/jquery-1.10.2.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#delete").click(function(){			 //삭제버튼
			if(confirm("정말로 삭제하시겠습니까?") == true){  // 확인
				$("#bbsNoticeContent").attr({action:'bbsNoticeDelete', method:'post'});
	            $("#bbsNoticeContent").submit();
			}
			else{
					return;   // 취소
			}
		});
		/* $("#goodupdate").click(function(){
			if(confirm("추천하였습니다!!")==true){
				$("#bbsNoticeContent").attr({action:'goodupdate', method:'post'});
				$("#bbsNoticeContent").submit();
			}
		}) */
		 $("#goodupdate").click(function(){
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
		<form id="bbsNoticeContent" name="bbsNoticeContent">
			<table border="1" width="800">
				<tr>
					<td align="center">작성자</td>
					<td align="center">${bbsNoticeContent.author}</td>
					<td align="center" style="width: 56px; ">작성일</td>
					<td align="center" style="width: 67px; ">${bbsNoticeContent.writedate}</td>										
				</tr>
				<tr>
					<td align="center">제  목</td>
					<td align="center" width="500">${bbsNoticeContent.title}</td>
					<td align="center" style="width: 69px; ">조회수</td>
					<td align="center" style="width: 21px; ">${bbsNoticeContent.hits}</td>
									
				</tr>
				<tr>
					<td align="center">내용</td>
					<td colspan="3">
					<textarea readonly="readonly"style="height: 445px; width: 689px">${bbsNoticeContent.contents}</textarea>
					</td>										
				</tr>
				<tr>
					<td align="center" style="width: 73px; ">첨부파일</td>
											
				</tr>
				<c:forEach var="bbsFileName" items="${bbsFileName}" >
						<tr><td><td>${bbsFileName.filename}</td></td></tr>	  	 			
  	 			</c:forEach>
				<tr>
					<td align="center" colspan="4">
					<input type="button" id="goodupdate" value="추천">
					<input type="button" id="list" value="목록" onclick="location.href='/HandicapUpload/bbsNoticeList'">
					<input type="button" id="update" value="수정" onclick="location.href='/HandicapUpload/bbsNoticeUpdateForm?boardno=${bbsNoticeContent.boardno}&no=${bbsNoticeContent.no}'">
					<input type="button" id="delete" value="삭제" >
					
					</td>
														
				</tr>
			</table>
			<input type="hidden" name="no" value="${bbsNoticeContent.no }">
		</form>
</body>
</html>