<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!String memberid;%>
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
<script src="ckeditor/config.js"></script>
<script src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	var editor;
	CKEDITOR
			.on(
					'instanceReady',
					function(ev) {
						editor = ev.editor;
						document.getElementById('readOnlyOn').style.display = '';
						editor
								.on(
										'readOnly',
										function() {
											document
													.getElementById('readOnlyOn').style.display = this.readOnly ? 'none'
													: '';
											document
													.getElementById('readOnlyOff').style.display = this.readOnly ? ''
													: 'none';
										});
					});

	window.onload = function() {
		CKEDITOR.replace('contents', {
			enterMode : '3'
		});
	};

	/* var fileNm = $("#files").val();	 
	if (fileNm != "") {	 
	    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();	 
	    if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
	        alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
	        return false;
	    }	 
	} */

	$(document)
			.ready(
					function() {
						$("#bbsWrite").click(
								function() {
									if ($("#title").val() == "") {
										alert("제목을 입력해주세요..");
										$("#title").focus();
									} else if (editor.getData() == "") {
										alert("내용을 입력해주세요..");
										//$("#contents").focus();					
									} else if ($("#boardno").val() == 30
											&& $("#category").val() == "") {
										alert("말머리를 선택해주세요");
									} else if ($("#boardno").val() == 40
											&& $("#category").val() == "") {
										alert("말머리를 선택해주세요");
									} else if ($("#boardno").val() == 40
											&& $("#region").val() == "") {
										alert("지역을 선택해주세요");
									} else if ($("#boardno").val() == 32
											&& $("#star").val() == "") {
										alert("평점을 선택해주세요");
									} else {
										$("#bbsWriteForm").attr({
											action : "bbsWrite",
											method : 'post'
										});
										$("#bbsWriteForm").submit();
									}
								})
						var fileIndex = 1;
						$("#files2").hide();
						$("#files3").hide();
						$("#files4").hide();
						$("#files5").hide();
						$('#addFile').click(function() {
							//var fileIndex = $('#fileview tr').length; //<table id="fileview"> 밑에 tr 갯수을 fileIndex에 담음
							if (Number(fileIndex) > '5') { //file Upload 갯수를 5개로 제한
								alert('파일은 첨부는 5개만 가능하십니다.');
								return;
							}
							var i = $('#fileview tr').length;
							if (Number(i) > '5') {
								return;
							}

							$("#files" + fileIndex).show();
							fileIndex++;
							/* $('#fileview').append(
							      '<tr><td>'
							         + '   <input type="file" id="files['+ fileIndex +']" class="files" accept=".gif, .jpg, .png, .bmp" name="files['+ fileIndex +']" />'
							         + '</td></tr>'); */

						});

						$("#files1")
								.change(
										function() {
											//확장자 비교
											var filename = $('#files1').val();
											var extension = filename.replace(
													/^.*\./, '');
											//var fileIndex = $('#fileview tr').length; 
											//if($('#files').val() == null){               
											if (extension == filename) {
												extension = '';
											} else {
												extension = extension
														.toLowerCase();
											}

											//이미지 파일은 JPG, PNG 확장자만 가능
											if ((extension != 'jpg')
													&& (extension != 'png')
													&& (extension != 'gif')
													&& (extension != 'bmp')) {
												//초기화
												//http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery
												var control = $('#files1');
												control
														.replaceWith(control = control
																.clone(true));

												alert("이미지 파일은 JPG, PNG, gif, bmp 확장자만 가능합니다.");
											}

										});
						$("#files2")
								.change(
										function() {
											//확장자 비교
											var filename = $('#files2').val();
											var extension = filename.replace(
													/^.*\./, '');
											//var fileIndex = $('#fileview tr').length; 
											//if($('#files').val() == null){               
											if (extension == filename) {
												extension = '';
											} else {
												extension = extension
														.toLowerCase();
											}

											//이미지 파일은 JPG, PNG 확장자만 가능
											if ((extension != 'jpg')
													&& (extension != 'png')
													&& (extension != 'gif')
													&& (extension != 'bmp')) {
												//초기화
												//http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery
												var control = $('#files2');
												control
														.replaceWith(control = control
																.clone(true));

												alert("이미지 파일은 JPG, PNG, gif, bmp 확장자만 가능합니다.");
											}

										});
						$("#files3")
								.change(
										function() {
											//확장자 비교
											var filename = $('#files3').val();
											var extension = filename.replace(
													/^.*\./, '');
											//var fileIndex = $('#fileview tr').length; 
											//if($('#files').val() == null){               
											if (extension == filename) {
												extension = '';
											} else {
												extension = extension
														.toLowerCase();
											}

											//이미지 파일은 JPG, PNG 확장자만 가능
											if ((extension != 'jpg')
													&& (extension != 'png')
													&& (extension != 'gif')
													&& (extension != 'bmp')) {
												//초기화
												//http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery
												var control = $('#files3');
												control
														.replaceWith(control = control
																.clone(true));

												alert("이미지 파일은 JPG, PNG, gif, bmp 확장자만 가능합니다.");
											}

										});
						$("#files4")
								.change(
										function() {
											//확장자 비교
											var filename = $('#files4').val();
											var extension = filename.replace(
													/^.*\./, '');
											//var fileIndex = $('#fileview tr').length; 
											//if($('#files').val() == null){               
											if (extension == filename) {
												extension = '';
											} else {
												extension = extension
														.toLowerCase();
											}

											//이미지 파일은 JPG, PNG 확장자만 가능
											if ((extension != 'jpg')
													&& (extension != 'png')
													&& (extension != 'gif')
													&& (extension != 'bmp')) {
												//초기화
												//http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery
												var control = $('#files4');
												control
														.replaceWith(control = control
																.clone(true));

												alert("이미지 파일은 JPG, PNG, gif, bmp 확장자만 가능합니다.");
											}

										});
						$("#files5")
								.change(
										function() {
											//확장자 비교
											var filename = $('#files5').val();
											var extension = filename.replace(
													/^.*\./, '');
											//var fileIndex = $('#fileview tr').length; 
											//if($('#files').val() == null){               
											if (extension == filename) {
												extension = '';
											} else {
												extension = extension
														.toLowerCase();
											}

											//이미지 파일은 JPG, PNG 확장자만 가능
											if ((extension != 'jpg')
													&& (extension != 'png')
													&& (extension != 'gif')
													&& (extension != 'bmp')) {
												//초기화
												//http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery
												var control = $('#files5');
												control
														.replaceWith(control = control
																.clone(true));

												alert("이미지 파일은 JPG, PNG, gif, bmp 확장자만 가능합니다.");
											}

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
				<td><div align="center">
						<%@include file="../menu.jsp"%>
					</div></td>
			</tr>

			<tr>
				<td align="center">
					<!-- center 끝 -->
					<div id="CssContents">
						<table align="center">
							<tr>
								<td>
									<!-- 위에 폼 인쿨루드 -->

									<form name="bbsWriteForm" id="bbsWriteForm"
										enctype="multipart/form-data">
										<c:choose>
											<c:when test="${boardno == '30'}">
											<center>
												<table class="bbsList11">
													<tr>
														<td align="center" width="100px"><font size="3px">작성자</font></td>
														<%
															if (session.getAttribute("memberid") != null) {
																		memberid = session.getAttribute("memberid").toString();
																		String nickname = session.getAttribute("membernick").toString();
														%>
														<td width="700px"><input type="text" size="10"
															maxlength="10" id="nickname" name="nickname"
															readonly="readonly" value="<%=nickname%>"><input
															type="hidden" id="author" name="author"
															value="<%=memberid%>"></td>
													</tr>
													<%
														}
													%>
													<tr>
														<td align="center"><font size="3px">말머리</td>
														<td><select id="category" name="category">
																<option value="">선택</option>
																<option value="[삽니다]">삽니다</option>
																<option value="[팝니다]">팝니다</option>
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
																cols="40" style="height: 450px; width: 100%"
																maxlength="3000"></textarea></td>
													</tr>
													<tr>
														<td align="center"><font size="3px">파일 첨부</font></td>
														<td align="left" >
															<table id="fileview" align="left">
																<tr>
																	<th colspan="2" valign="middle"><input name="files" type="file"
																		class="files" id="files1"
																		accept=".gif, .jpg, .png, .bmp"><br> <input
																		name="files" type="file" class="files" id="files2"
																		accept=".gif, .jpg, .png, .bmp"><br> <input
																		name="files" type="file" class="files" id="files3"
																		accept=".gif, .jpg, .png, .bmp"><br> <input
																		name="files" type="file" class="files" id="files4"
																		accept=".gif, .jpg, .png, .bmp"><br> <input
																		name="files" type="file" class="files" id="files5"
																		accept=".gif, .jpg, .png, .bmp"></th>
														
																
																		<th style="vertical-align: top;">
																		<input 	id="addFile" type="button" value="파일첨부">
																		</th>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<!-- a href="bbsNoticeWriteForm" -->
														<td colspan="2" align="left">
															<button type="button" id="bbsNoticelist"
																onclick="location.href='/Handicap/bbsList?boardno=${boardno}'">목록</button>
														</td>
													</tr>
													<tr>
														<td colspan="2" align="right">
															<button type="button" id="bbsreset" onclick="history.back()">취소</button>
															<button type="button" id="bbsWrite">확인</button>
														</td>
													</tr>
												</table>
												</center>
												<input type="hidden" name="boardno" id="boardno"
													value="${boardno}">

												<input type="hidden" name="category" id="category" value="">
												<input type="hidden" name="region" id="region" value="">
									</form> </c:when> 
									
									
									
									
									<c:when test="${boardno == '32'}">
										<table class="bbsList11">
											<tr>
												<td align="center" width="150px;"><font size="3px">작성자</font></td>
												<%
													if (session.getAttribute("memberid") != null) {
																memberid = session.getAttribute("memberid").toString();
																String nickname = session.getAttribute("membernick").toString();
												%>
												<td width="700px" colspan="2"><input type="text" size="10"
													maxlength="10" id="author" name="author"
													readonly="readonly" value="<%=nickname%>"></td>
											</tr>  <!-- 끝남 -->
											<%
												}
											%>
											<tr>
											<td align="center"><font size="3px">제 목</font></td>
											<td colspan="2"><input type="text" size="40" maxlength="50"
												name="title" id="title" style="width: 100%"></td>


											</tr>
											<tr>
												<td align="center" ><font size="3px">내 용</font></td>
												<td colspan="2"><textarea name="contents" id="contents" rows="13"
														cols="40" style="height: 450px; width: 100%"
														maxlength="3000"></textarea></td>
											</tr>
											<tr>
												<td align="center"><font size="3px">파일 첨부</font></td>
												<td align="center">
													<table id="fileview" align="center" >
														<tr>
															<th width="350px;" style="vertical-align: top;"><input name="files" type="file"
																class="files" id="files1"
																accept=".gif, .jpg, .png, .bmp"><br> <input
																name="files" type="file" class="files" id="files2"
																accept=".gif, .jpg, .png, .bmp"><br> <input
																name="files" type="file" class="files" id="files3"
																accept=".gif, .jpg, .png, .bmp"><br> <input
																name="files" type="file" class="files" id="files4"
																accept=".gif, .jpg, .png, .bmp"><br> <input
																name="files" type="file" class="files" id="files5"
																accept=".gif, .jpg, .png, .bmp"></th>
																<th><input 	id="addFile" type="button" value="파일첨부"></th>
														</tr>
													</table>
												</td>

												<th width="270px" align="right" valign="top"><font size="3px">별점</font>
													<select id="star" name="star">
														<option value="">선택</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
												</select></th>

											</tr>

										</table>
								</td>
							</tr>
							<tr>
								<!-- a href="bbsNoticeWriteForm" -->
								<td>
									<button type="button" id="bbsNoticelist" class = "ml-button"
										onclick="location.href='/Handicap/bbsList?boardno=${boardno}'">목록</button>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right">
									<button type="button" id="bbsreset" class = "ml-button" onclick="history.back()">취소</button>
									<button type="button" id="bbsWrite" class = "ml-button">확인</button>
								</td>
							</tr>
						</table>
						<input type="hidden" name="boardno" id="boardno"
							value="${boardno}"> <input type="hidden" name="category"
							id="category" value=""> <input type="hidden"
							name="region" id="region" value="">

						</form>
						</c:when>
						<c:when test="${boardno == '40'}">
						<center>
							<table class="bbsList11">
								<tr>
									<td align="center" width="100px"><font size="3px">작성자</font></td>
									<%
										if (session.getAttribute("memberid") != null) {
													memberid = session.getAttribute("memberid").toString();
													String nickname = session.getAttribute("membernick").toString();
									%>
									<td width="700px"><input type="text" size="10"
										maxlength="10" id="nickname" name="nickname"
										readonly="readonly" value="<%=nickname%>"><input
										type="hidden" id="author" name="author" value="<%=memberid%>"></td>
								</tr>
								<%
									}
								%>
								<tr>
									<td align="center"><font size="3px">말머리</td>
									<td><select id="category" name="category">
											<option value="">선택</option>
											<c:if test="${membergrade =='2'}">
												<option value="[구인]">구인</option>
											</c:if>
											<c:if test="${membergrade == '1'}">
												<option value="[구직]">구직</option>
											</c:if>
											<c:if test="${membergrade =='3' }">
												<option value="[구인]">구인</option>
												<option value="[구직]">구직</option>
											</c:if>
									</select> <select id="region" name="region">
											<option value="">선택</option>
											<option value="[서울]">서울</option>
											<option value="[경기]">경기</option>
											<option value="[인천]">인천</option>
											<option value="[강원]">강원</option>
											<option value="[세종]">세종</option>
											<option value="[충북]">충북</option>
											<option value="[충남]">충남</option>
											<option value="[대구]">대구</option>
											<option value="[대전]">대전</option>
											<option value="[전북]">전북</option>
											<option value="[전남]">전남</option>
											<option value="[광주]">광주</option>
											<option value="[경북]">경북</option>
											<option value="[경남]">경남</option>
											<option value="[울산]">울산</option>
											<option value="[부산]">부산</option>
											<option value="[제주]">제주</option>

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
											cols="40" style="height: 450px; width: 100%" maxlength="3000"></textarea></td>
								</tr>
								<tr>
									<td align="center"><font size="3px">파일 첨부</font></td>
									<td align="left">
										<table id="fileview" align="left">
											<tr>
												<th colspan="2"><input name="files" type="file"
													class="files" id="files1" accept=".gif, .jpg, .png, .bmp"><br>
													<input name="files" type="file" class="files" id="files2"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files3"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files4"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files5"
													accept=".gif, .jpg, .png, .bmp"></th>
													<th> <input
													id="addFile" type="button" value="파일첨부"></th>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<!-- a href="bbsNoticeWriteForm" -->
									<td colspan="2">
										<button type="button" id="bbsNoticelist"
											onclick="location.href='/Handicap/bbsList?boardno=${boardno}'">목록</button>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<button type="button" id="bbsreset" onclick="history.back()">취소</button>
										<button type="button" id="bbsWrite">확인</button>
									</td>
								</tr>
							</table>
							</center>
							<input type="hidden" name="boardno" id="boardno"
								value="${boardno}">


							</form>
						</c:when>
						<c:when test="${boardno == '50'}">
						<center>
							<table class="bbsList11">
								<tr>
									<td align="center" width="100px"><font size="3px">작성자</font></td>
									<%
										if (session.getAttribute("memberid") != null) {
													memberid = session.getAttribute("memberid").toString();
													String nickname = session.getAttribute("membernick").toString();
									%>
									<td width="700px"><input type="text" size="10"
										maxlength="10" id="nickname" name="nickname"
										readonly="readonly" value="<%=nickname%>"><input
										type="hidden" id="author" name="author" value="<%=memberid%>"></td>
								</tr>
								<%
									}
								%>
								<tr>

									<td align="center"><font size="3px">제 목</font></td>
									<td><input type="text" size="40" maxlength="50"
										name="title" id="title" style="width: 100%"></td>


								</tr>
								<tr>
									<td align="center"><font size="3px">내 용</font></td>
									<td><textarea name="contents" id="contents" rows="13"
											cols="40" style="height: 450px; width: 100%" maxlength="3000"></textarea></td>
								</tr>
								<tr>
									<td align="center"><font size="3px">파일 첨부</font></td>
									<td align="left">
										<table id="fileview" align="left">
											<tr>
												<th colspan="2"><input name="files" type="file"
													class="files" id="files1" accept=".gif, .jpg, .png, .bmp"><br>
													<input name="files" type="file" class="files" id="files2"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files3"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files4"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files5"
													accept=".gif, .jpg, .png, .bmp"></th>
													<th>
														 <input
													id="addFile" type="button" value="파일첨부">
													</th>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<!-- a href="bbsNoticeWriteForm" -->
									<td colspan="2">
										<button type="button" id="bbsNoticelist"
											onclick="location.href='/Handicap/bbsList?boardno=${boardno}'">목록</button>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<button type="button" id="bbsreset" onclick="history.back()">취소</button>
										<button type="button" id="bbsWrite">확인</button>
									</td>
								</tr>
							</table>
							</center>
							<input type="hidden" name="boardno" id="boardno"
								value="${boardno}">
							<input type="hidden" name="category" id="category" value="">
							<input type="hidden" name="region" id="region" value="">
							<input type="hidden" name="star" id="star" value="0">


							</form>
						</c:when>
						<c:otherwise>
						<center>
						
							<table class="bbsList11">
								<tr>
									<td align="center" width="100px"><font size="3px">작성자</font></td>
									<%
										if (session.getAttribute("memberid") != null) {
													memberid = session.getAttribute("memberid").toString();
													String nickname = session.getAttribute("membernick").toString();
									%>
									<td width="700px"><input type="text" size="10"
										maxlength="10" id="nickname" name="nickname"
										readonly="readonly" value="<%=nickname%>"><input
										type="hidden" id="author" name="author" value="<%=memberid%>"></td>
								</tr>
								<%
									}
								%>
								<tr>

									<td align="center"><font size="3px">제 목</font></td>
									<td><input type="text" size="40" maxlength="50"
										name="title" id="title" style="width: 100%"></td>


								</tr>
								<td align="center"><font size="3px">내 용</font></td>
								<td><textarea name="contents" id="contents" rows="13"
										cols="40" style="height: 450px; width: 100%" maxlength="3000"></textarea></td>
								</tr>
								<tr>
									<td align="center"><font size="3px">파일 첨부</font></td>
									<td align="left" colspan="2">
										<table id="fileview" align="left">
											<tr>
												<td colspan="2"><input name="files" type="file"
													class="files" id="files1" accept=".gif, .jpg, .png, .bmp"><br>
													<input name="files" type="file" class="files" id="files2"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files3"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files4"
													accept=".gif, .jpg, .png, .bmp"><br> <input
													name="files" type="file" class="files" id="files5"
													accept=".gif, .jpg, .png, .bmp"></td>
													<td style="vertical-align: top;">
														 <input
													id="addFile" type="button" value="파일첨부">
													</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<!-- a href="bbsNoticeWriteForm" -->
									<td colspan="2">
										<button type="button" id="bbsNoticelist" 
											onclick="location.href='/Handicap/bbsList?boardno=${boardno}'">목록</button>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<button type="button" id="bbsreset"onclick="history.back()">취소</button>
										<button type="button" id="bbsWrite">확인</button>
									</td>
								</tr>
							</table>
							</center>
							<input type="hidden" name="boardno" id="boardno"
								value="${boardno}">
							<input type="hidden" name="category" id="category" value="">
							<input type="hidden" name="region" id="region" value="">
							<input type="hidden" name="star" id="star" value="0">
							</form>
						</c:otherwise>
						</c:choose>
						<!-- 아래 폼 인쿨루드 -->
				</td>

			</tr>
			<tr>
				<td><%@include file="../Footer.jsp"%></td>
			</tr>
		</table>

	</div>






	<br>




</body>
</html>
