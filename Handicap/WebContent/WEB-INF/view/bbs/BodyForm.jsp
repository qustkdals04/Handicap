<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">

<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<title>신체적폼</title>
<script type="text/javascript">
	
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
							file="BbsSubMenu.jsp"%></td>
					<td>

						<table class="bbsList">
							<tr height="20px">
								<th width="10%">글번호</th>
								<th width="40%">제 목</th>
								<th width="14%">작성자</th>
								<th width="20%">작성일</th>
								<th width="8%">조회수</th>
								<th width="8%">추천수</th>
							</tr>
							<tr>

								<c:forEach var="bbs" items="${list}">
									<tr>
										<td align="center">${bbs.no}</td>
										<td align="center"><a
											href="bbsNoticeContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.title}</a></td>
										<td align="center">${bbs.author}</td>
										<td align="center">${bbs.writedate}</td>
										<td align="center">${bbs.hits}</td>
										<td align="center">${bbs.good}</td>
									</tr>
								</c:forEach>

							</tr>

							<tr align="right">
								<td colspan="6"><button type="button" class="ml-button"
										onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>


							</tr>
						</table>

					</td>

				</tr>
			</table>

			</td>
			<%-- 				<td>
					<%@include file="../banner.jsp"%>
				</td> --%>
			</tr>
			</table>
		</div>
		<%@include file="../Footer.jsp"%>


		<%-- <div id="sidebar" align="right">
			<%@include file="../banner.jsp"%>


		</div>
 --%>
	</div>
	<!-- 전체 wapper -->

</body>
</html>


