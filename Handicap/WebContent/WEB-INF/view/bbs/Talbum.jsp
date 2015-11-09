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
<title>앨범 게시판</title>
</head>
<body>

	<table class="bbsAlbum">
		<tr>
			<td align="center"><font size="15">여행 게시판</font></td>
		</tr>
	</table>

	<table class="bbsAlbumList">

		<tr>
			<th width="200px" height="150px" align="center">[이미지]</th>
		</tr>

		<tr>
			<td style="margin-top: 15px;">제목 : ${bbs.title}</td>
		</tr>
		<tr>
			<td><font size="1px">조회수 :  [조회]  /  작성날 : [작성날]</font></td>
		</tr>
		<tr>
			<td style="margin-top: 15px;">작성자 : ${bbs.author}</td>
		</tr>

		<tr>
			<td align="right" colspan="4"><button type="button">글쓰기</button></td>
		</tr>

		<tr>
			<td colspan="4" align="center">페이징 처리 부분</td>
			<!-- 페이징 -->
		</tr>
		<tr>
			<td width="25%"></td>
			<td align="center" colspan="2" width="50%"><input type="text"
				style="width: 90%; text-align: right;"></td>
			<td width="25%" align="left">
				<button type="button" style="margin-left: 5px;">검색</button>
			</td>
		</tr>
	</table>
</body>
</html>