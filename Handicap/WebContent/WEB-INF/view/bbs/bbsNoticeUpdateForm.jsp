<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.handicap.model.beans.BbsVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.BbsVO"></jsp:useBean>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">


 $(document).ready(function() {
	$("#bbsNoticeUpdate").click(function() {				
		var title = $("#title").val();		
		var content = $("#contents").val();		
			if ($("#title").val() == "") {
				alert("제목을 입력해주세요..");
				$("#title").focus();	
			}else if ($("#contents").val() == "") {
				alert("내용을 입력해주세요..");
				$("#contents").focus();
			}else {
				$("#bbsNoticeUpdateForm").attr({
					action : "bbsNoticeUpdate",
					method : 'post'
				});
				$("#bbsNoticeUpdateForm").submit();
				}			
		})
	
	
 $('#addFile').click(function() {
     var fileIndex = $('#fileview tr').children().length;      
     $('#fileview').append(
             '<tr><td>'+
             '   <input type="file" name="files['+ fileIndex +']" />'+
             '</td></tr>');
 });     
	
});
</script>
</head>
<body>
	<center>
		<b>글쓰기</b>
	
	<br>
	<form method="post" name="bbsNoticeUpdateForm" id="bbsNoticeUpdateForm" enctype="multipart/form-data">
	
		<table width="400" border="1" cellspacing="0" cellpadding="0"
			align="center" style="width: 570px; ">
			<tr>		
				<td>		
				<select name="category" id="category">
						<option value="공지사항1">공지사항1</option>
						<option value="공지사항2">공지사항2</option>
						<option value="공지사항3">흠3</option>						
				</select> 
				</td>				
				<td width="70" align="center">작성자				
				${bbsNoticeUpdateForm.author }
				</td>				
			</tr>			
			<tr>
							
				<td width="70" align="center">제 목</td>
				<td width="330">				
				<textarea name="title" id="title" style="width: 593px;">${bbsNoticeUpdateForm.title}</textarea></td>
				
			</tr>			
			<tr>
				<td width="70" align="center">내 용</td>
				<td width="330" style="width: 483px; ">
				<textarea name="contents" id="contents"rows="13" cols="40" 
				style="width: 595px; height: 363px">${bbsNoticeUpdateForm.contents }</textarea></td>
			</tr>
			<tr>
				<td width="70"  align="center">파일 첨부</td>
				<td><input id="addFile" type="button" value="File Add" />
				    <table id="fileview" align="right">
				        <tr>
				            <td><input name="files[0]" type="file" /></td>
				        </tr>
				    </table>	
				    </td>			    
			</tr>
			<tr>
				<td colspan=2  align="center">
				<input type="button" value="수정" id="bbsNoticeUpdate" > 
				<input type="button" value="목록보기" id="bbsNoticelist" onclick="location.href='/HandicapUpload/bbsNoticeList'">
				</td>
			</tr>
		</table>
		<%-- bbsNoticeUpdateForm?boardno=${bbsNoticeUpdateForm.boardno}&no=${bbsNoticeUpdateForm.no} --%>
	<input type="hidden" name="boardno" value="${bbsNoticeUpdateForm.boardno }">
	<input type="hidden" name="no" value="${bbsNoticeUpdateForm.no }">
	</form>
	</center>
</body>
</html>