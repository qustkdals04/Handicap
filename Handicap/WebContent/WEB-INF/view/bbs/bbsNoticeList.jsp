<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.handicap.model.beans.BbsVO"%>
<%@ page import="com.handicap.model.dao.BbsDAO"%>
<jsp:useBean id="BbsVO" class="com.handicap.model.beans.BbsVO" />
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
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- 게시판 리스트 -->




	<div id="CssWrapper" align="center">


		<table>
			<tr>
				<td><%@include file="../top2.jsp"%></td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<%@include file="../menu.jsp"%>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div id="CssContents">
						<table align="center">
							<tr>
								<td width="100px" align="center"><c:choose>
										<c:when test="${boardno == 10 }">
											<%@include file="../new/NewSubMenu.jsp"%>
										</c:when>
										<c:when test="${boardno == 11 }">
											<%@include file="../new/NewSubMenu11.jsp"%>
										</c:when>
										<c:when test="${boardno == 20 }">
											<%@include file="BbsSubMenu.jsp"%>
										</c:when>
										<c:when test="${boardno == 21 }">
											<%@include file="BbsSubMenu21.jsp"%>
										</c:when>
										<c:when test="${boardno == 22 }">
											<%@include file="BbsSubMenu22.jsp"%>
										</c:when>
										<c:when test="${boardno == 23 }">
											<%@include file="BbsSubMenu23.jsp"%>
										</c:when>
										<c:when test="${boardno == 30 }">
											<%@include file="../equipmen/EquipmenSubMenu.jsp"%>
										</c:when>
										<c:when test="${boardno == 31 }">
											<%@include file="../equipmen/EquipmenSubMenu31.jsp"%>
										</c:when>
										<c:when test="${boardno == 32 }">
											<%@include file="../equipmen/EquipmenSubMenu32.jsp"%>
										</c:when>
										<c:when test="${boardno == 40 }">
											<%@include file="../job/JobSubMenu.jsp"%>
										</c:when>
										<c:when test="${boardno == 50 }">
											<%@include file="../service/ServiceSubMeun.jsp"%>
										</c:when>
										<c:otherwise>
											<%@include file="../service/ServiceSubMeun51.jsp"%>
										</c:otherwise>
									</c:choose></td>
								<td>
									<!-- 위에 폼 인쿨루드 --> <c:choose>

										<c:when test="${boardno == '32'}">
											<table class="bbsList">
												<tr height="20px">
													<th width="9%">글번호</th>
													<th width="35%">제 목</th>
													<th width="10%">작성자</th>
													<th width="19%">작성일</th>
													<th width="9%">조회수</th>
													<th width="9%">추천수</th>
													<th width="9%">평 점</th>
												</tr>

												<tr>


													<c:forEach var="bbs" items="${list}">
														<tr>
															<td align="center">${bbs.no}</td>
															<td align="center"><a
																href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${fn:substring(bbs.title,0,20)}...</a></td>
															<td align="center">${bbs.nickname}</td>
															<td align="center">${bbs.writedate}</td>
															<td align="center">${bbs.hits}</td>
															<td align="center">${bbs.good}</td>
															<td align="center"><c:choose>
																	<c:when test="${bbs.star == '1'}">
																		<img width="60" height="12"
																			src="/Handicap/img/star1.png">
																	</c:when>
																	<c:when test="${bbs.star =='2'}">
																		<img width="60" height="12"
																			src="/Handicap/img/stat2.png">
																	</c:when>
																	<c:when test="${bbs.star == '3'}">
																		<img width="60" height="12"
																			src="/Handicap/img/stat3.png">
																	</c:when>
																	<c:when test="${bbs.star =='4'}">
																		<img width="60" height="12"
																			src="/Handicap/img/stat4.png">
																	</c:when>
																	<c:when test="${bbs.star == '5'}">
																		<img width="60" height="12"
																			src="/Handicap/img/stat5.png">
																	</c:when>
																</c:choose></td>
														</tr>
													</c:forEach>
													</c:when>
													<c:when test="${boardno == '40' }">
														<table class="bbsList">
															<tr height="20px">
																<th width="10%">글번호</th>
																<th width="38%">제 목</th>
																<th width="14%">작성자</th>
																<th width="20%">작성일</th>
																<th width="8%">조회수</th>
																<th width="20%">답변진행</th>


															</tr>
															<tr>

																<c:forEach var="bbs" items="${list}">
																	<tr>
																		<td align="center">${bbs.no}</td>
																		<td align="center"><a
																			href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${bbs.region}${fn:substring(bbs.title,0,20)}...</a></td>
																		<td align="center">${bbs.nickname}</td>
																		<td align="center">${bbs.writedate}</td>
																		<td align="center">${bbs.hits}</td>
																		<td align="center"><c:choose>
																				<c:when test="${bbs.status == '1' }">
                                                                  미답변
                                                               </c:when>
																				<c:otherwise>
                                                                  답변
                                                               </c:otherwise>
																			</c:choose></td>


																	</tr>
																</c:forEach>
																</c:when>
																<c:when test="${boardno == 30 }">
																	<table class="bbsList">
																		<tr height="20px">
																			<th width="10%">글번호</th>
																			<th width="38%">제 목</th>
																			<th width="14%">작성자</th>
																			<th width="20%">작성일</th>
																			<th width="8%">조회수</th>
																			<th width="10%">진행상태</th>


																		</tr>
																		<tr>

																			<c:forEach var="bbs" items="${list}">
																				<tr>
																					<td align="center">${bbs.no}</td>
																					<td align="center"><a
																						href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${fn:substring(bbs.title,0,20)}...</a></td>
																					<td align="center">${bbs.nickname}</td>
																					<td align="center">${bbs.writedate}</td>
																					<td align="center">${bbs.hits}</td>
																					<td align="center"><c:choose>
																							<c:when test="${bbs.status == 1}">
																							거래대기
																							</c:when>
																							<c:otherwise>
																							거래완료
																							</c:otherwise>
																						</c:choose></td>


																				</tr>

																			</c:forEach>
																			</c:when>
																			<%-- <c:when test="${boardno == 22}">
																	<!-- <tr height="20px">
																			<th width="10%">글번호</th>
																			<th width="38%">제 목</th>
																			<th width="14%">작성자</th>
																			<th width="20%">작성일</th>
																			<th width="8%">조회수</th>
																			<th width="10%">진행상태</th>


																		</tr> -->
																		<table>
																			<tr>
																			<td>
																			<c:forEach var="bbs" items="${list}">																				
																					<tr>
																					<td align="center"><img alt="안나와" src="/Handicap/bbsimg/${bbs.fileoriginal }" width="100" height="100"> </td>																					
																					</tr>																				
																					<tr>																			
																					<td align="center"><a
																						href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${bbs.title}</a></td>
																					</tr>																																								
																			</c:forEach>
																			</td>
																			</tr>
																		</table>
																</c:when> --%>

																			<c:otherwise>
																				<table class="bbsList">
																					<tr height="20px">
																						<th width="10%">글번호</th>
																						<th width="38%">제 목</th>
																						<th width="14%">작성자</th>
																						<th width="20%">작성일</th>
																						<th width="9%">조회수</th>
																						<th width="9%">추천수</th>


																					</tr>
																					<tr>

																						<c:forEach var="bbs" items="${list}">
																							<tr>
																								<td align="center">${bbs.no}</td>
																								<td align="center"><a
																									href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${fn:substring(bbs.title,0,20)}...</a></td>
																								<td align="center">${bbs.nickname}</td>
																								<td align="center">${bbs.writedate}</td>
																								<td align="center">${bbs.hits}</td>
																								<td align="center">${bbs.good}</td>


																							</tr>

																						</c:forEach>
																						</c:otherwise>
																						</c:choose>
																					</tr>
																					<input type="hidden" name="pageNumber"
																						value="${pageNumber }">

																				</table>
																				<center>
																					<table>
																						<tr>
																							<td style="font-size: large;"><c:if
																									test="${startPage>1 }">
																									<span> <a
																										href="/Handicap/bbsList?pageNumber=${startPage-1 }">이전</a>
																									</span>
																								</c:if> <c:forEach var="i" begin="${startPage }"
																									end="${endPage }">
																									<c:choose>
																										<c:when test="${pageNumber==i }">
																											<span> <a
																												href="/Handicap/bbsList?pageNumber=${i }"
																												style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
																											</span>
																										</c:when>
																										<c:otherwise>
																											<span> <a
																												href="/Handicap/bbsList?pageNumber=${i}"
																												style="text-decoration: none; color: gray;">${i}</a>&nbsp;
																											</span>
																										</c:otherwise>
																									</c:choose>
																								</c:forEach> <c:if test="${endPage<totalPageCount}">
																									<span> <a
																										href="/Handicap/bbsList?pageNumber=${endPage+1 }">다음</a>
																									</span>
																								</c:if></td>
																						</tr>
																					</table>
																				</center>
																				<table style="margin-top: 5px">
																					<tr align="right">
																						<c:choose>
																							<c:when test="${boardno == 10}">
																								<c:if test="${membergrade == 3 }">
																									<td colspan="6" width="750px"><button
																											type="button" class="ml-button"
																											onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>

																								</c:if>
																							</c:when>
																							<c:when test="${boardno == 11}">
																								<c:if test="${membergrade == 3 }">
																									<td colspan="6" width="750px"><button
																											type="button" class="ml-button"
																											onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>

																								</c:if>
																							</c:when>
																							<c:when test="${membergrade >= 1 }">
																								<td colspan="6" width="750px"><button
																										type="button" class="ml-button"
																										onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>

																							</c:when>


																						</c:choose>
																					</tr>


																				</table>
																				<!-- 아래 폼 인쿨루드 -->
																		</tr>
																	</table>
																	<div>


																		<!-- contents 끝 -->
																		<%@include file="../Footer.jsp"%>
																	</div>


																	<td>
																		<!-- 배너 --> <%@include file="../banner.jsp"%>
																	</td>
															</tr>
														</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>

		<!-- center 끝 -->
	</div>

</body>
</html>