<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<title>글쓰기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#bbsNoticeWrite").click(function() {
							var title = $("#title").val();
							var content = $("#contents").val();
							if ($("#title").val() == "") {
								alert("제목을 입력해주세요..");
								$("#title").focus();
							} else if ($("#contents").val() == "") {
								alert("내용을 입력해주세요..");
								$("#contents").focus();
							} else {
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

	<div id="wrapper" align="center">
		<%@include file="../top.jsp"%>


		<div align="center">
			<%@include file="../menu.jsp"%>
		</div>
		<!-- center 끝 -->
		<div id="contents">
			<table align="left">
				<tr>
					<td width="100px" align="center"><%@include
							file="../new/NewSubMenu.jsp"%></td>
					<td>
					<!-- 위에 폼 인쿨루드 -->
						<form method="post" name="bbsNoticeWriteForm"
							id="bbsNoticeWriteForm" enctype="multipart/form-data">
							<table class="bbsTitle">
								<tr>
									<td align="center"><font size ="15">글 쓰기</font></td>
								</tr>
							</table>

							<table class="bbsList">
								<tr>
									<td align="center"><font size="3px">작성자</font></td>

									<td width="700px"><input type="text" size="10"
										maxlength="10" id="author" name="author"> <select
										name="category" id="category">
											<option value="공지사항1">공지</option>
											<option value="공지사항2">긴급</option>
											<option value="공지사항3">알림</option>
									</select></td>
								</tr>
								<tr>

									<td align="center"><font size="3px">제 목</font></td>
									<td><input type="text" size="40" maxlength="50"
										name="title" id="title" style="width: 100%"></td>

								</tr>
								<tr>
									<td align="center"><font size="3px">내 용</font></td>
									<td><textarea name="contents" id="contents" rows="13"
											cols="40" style="height: 450px; width: 100%"></textarea></td>
								</tr>
								<tr>
									<td align="center"><font size="3px">파일 첨부</font></td>
									<td align="left">
										<table id="fileview" align="left">
											<tr>
												<td colspan="2"><input name="files" type="file" /> <input
													id="addFile" type="button" value="파일첨부" /></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<!-- a href="bbsNoticeWriteForm" -->
									<td>
										<button type="button" id="bbsNoticelist"
											onclick="location.href='/HandicapUpload/bbsNoticeList'">목록</button>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<button type="reset" id="bbsNoticereset">다시작성</button>
										<button type="button" id="bbsNoticeWrite">확인</button>
									</td>
								</tr>
							</table>
							<input type="hidden" name="flag" value="bbsNoticeWrite">
						</form>
					</td>
					<!-- 아래 폼 인쿨루드 -->
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