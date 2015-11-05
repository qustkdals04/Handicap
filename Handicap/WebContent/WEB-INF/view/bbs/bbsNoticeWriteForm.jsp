<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">


 $(document).ready(function() {
	$("#bbsNoticeWrite").click(function() {				
		var title = $("#title").val();		
		var content = $("#contents").val();						
			if ($("#title").val() == "") {
				alert("제목을 입력해주세요..");
				$("#title").focus();	
			}else if ($("#contents").val() == "") {
				alert("내용을 입력해주세요..");
				$("#contents").focus();
			}else {
				$("#bbsNoticeWriteForm").attr({
					action : "bbsNoticeWrite",
					method : 'post'
				});
				$("#bbsNoticeWriteForm").submit();
				}			
		})
	
	/* $("#bbsNoticelist").click(function(){	
		$("#bbsNoticelist").attr({
			action : "bbsNoticelist",
			method : 'post'
		});
	}); */
	
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
	<form method="post" name="bbsNoticeWriteForm" id="bbsNoticeWriteForm"
		 enctype="multipart/form-data">
		<%-- <input type="hidden" name="num" value="${num}"> <input
			type="hidden" name="ref" value="${ref}"> <input type="hidden"
			name="re_step" value="${re_step}"> <input type="hidden"
			name="re_level" value="${re_level}">
		 --%>
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
				<input type="text" size="10" maxlength="10"
					id="author" name="author" style="width: 135px; ">
				</td>				
			</tr>			
			<tr>
							
				<td width="70" align="center">제 목</td>
				<td width="330">
				
				<input type="text" size="40" maxlength="50" 
				name="title" id="title" style="width: 593px;"></td>
				
			</tr>			
			<tr>
				<td width="70" align="center">내 용</td>
				<td width="330" style="width: 483px; ">
				<textarea name="contents" id="contents"rows="13" cols="40" 
				style="width: 595px; height: 363px"></textarea></td>
			</tr>
			<tr>
				<td width="70"  align="center">파일 첨부</td>
				<td><input id="addFile" type="button" value="File Add" />
				    <table id="fileview" align="right">
				        <tr>
				            <td><input name="files" type="file" /></td>
				        </tr>
				    </table>	
				    </td>			    
			</tr>
			<tr>
			<!-- a href="bbsNoticeWriteForm" -->
				<td colspan=2  align="center">
				<input type="button" value="글쓰기" id="bbsNoticeWrite" > 
				<input type="reset" value="다시작성" id="bbsNoticereset">
				<input type="button" value="목록보기" id="bbsNoticelist" onclick="location.href='/HandicapUpload/bbsNoticeList'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="flag" value="bbsNoticeWrite">
	</form>
	</center>
</body>
</html>