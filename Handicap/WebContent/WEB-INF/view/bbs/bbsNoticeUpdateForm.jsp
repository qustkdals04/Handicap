<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.handicap.model.beans.BbsVO"%>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.BbsVO"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>글수정</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#bbsNoticeUpdate").click(function() {
							var title = $("#title").val();
							var content = $("#contents").val();
							if ($("#title").val() == "") {
								alert("제목을 입력해주세요..");
								$("#title").focus();
							} else if ($("#contents").val() == "") {
								alert("내용을 입력해주세요..");
								$("#contents").focus();
							} else {
								$("#bbsNoticeUpdateForm").attr({
									action : "bbsUpdate",
									method : 'post'
								});
								$("#bbsNoticeUpdateForm").submit();
							}
						})

						$('#addFile')
								.click(
										function() {
											var fileIndex = $('#fileview tr')
													.children().length;
											$('#fileview')
													.append(
															'<tr><td>'
																	+ '   <input type="file" name="files['+ fileIndex +']" />'
																	+ '</td></tr>');
										});

					});
</script>
</head>
<body>
	<div id="CssWrapper" align="center">
		<table>

			<tr>
				<td><%@include file="../top.jsp"%></td>
			</tr>

			<tr>
				<td>
					<div align="center">
						<%@include file="../menu.jsp"%>
					</div>
				</td>
			</tr>

			<tr>
				<td><br>
					<form method="post" name="bbsNoticeUpdateForm"
						id="bbsNoticeUpdateForm" enctype="multipart/form-data">

						<table class="bbsList">
							<tr>
								<td align="center" width="100px" style="width: 117px;"><font
									size="3px">작성자</font></td>

								<td width="600px">${bbsNoticeUpdateForm.nickname }<!-- <select name="category" id="category">
						<option value="공지사항1">공지사항1</option>
						<option value="공지사항2">공지사항2</option>
						<option value="공지사항3">흠3</option>
				</select> --></td>
							</tr>

							<!-- <tr>		
				<td>		
				<select name="category" id="category">
						<option value="공지사항1">공지사항1</option>
						<option value="공지사항2">공지사항2</option>
						<option value="공지사항3">흠3</option>						
				</select> 
				</td>				
				<td>작성자 : 
				</td>				
			</tr>			 -->
							<tr>

								<td align="center"><font size="3px">제 목</font></td>
								<td><input type="text" size="40" maxlength="50"
									name="title" id="title" style="width: 100%"
									value="${bbsNoticeUpdateForm.title }"></td>

							</tr>
							<tr>
								<td align="center"><font size="3px">내 용</font></td>
								<td width="700px"><textarea name="contents" id="contents"
										rows="13" cols="40" style="height: 450px; width: 100%">${bbsNoticeUpdateForm.contents }</textarea></td>


							</tr>
							<tr>
								<td align="center"><font size="3px">파일 첨부</font></td>
								<td align="left">
									<table id="fileview" align="left">

										<tr>
											<td colspan="2"><input name="files" type="file" /> <input
												id="addFile" type="button" value="파일첨부" /></td>
											<td><c:forEach var="bbsFileName" items="${bbsFileName}">
													<tr>

														<td>${bbsFileName.filename}</td>

													</tr>
												</c:forEach></td>

										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan=2 align="right">
									<button type="button" id="bbsNoticeUpdate">수정</button>
									<button type="button" id="bbsNoticelist"
										onclick="location.href='/Handicap/bbsList?boardno=${bbsNoticeUpdate.boardno}'">목록</button>
								</td>
							</tr>
						</table>
						<%-- bbsNoticeUpdateForm?boardno=${bbsNoticeUpdateForm.boardno}&no=${bbsNoticeUpdateForm.no} --%>
						<input type="hidden" name="boardno"
							value="${bbsNoticeUpdateForm.boardno }"> <input
							type="hidden" name="no" value="${bbsNoticeUpdateForm.no }">
					</form></td>
			</tr>

			<tr>
				<td><%@include file="../Footer.jsp"%></td>
			</tr>


		</table>
</body>
</html>