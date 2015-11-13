<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <td>
               <div id="CssContents">
                  <table align="center">
                     <tr>
                        <td width="100px" align="center">
                        <c:choose>
                        <c:when test="${boardno == 10 }">
                        <%@include file="../new/NewSubMenu.jsp"%>
                        </c:when>
                        <c:when test="${boardno == 11 }">
                        <%@include file="../new/NewSubMenu11.jsp"%>
                        </c:when>
                        <c:when test="${boardno == 20 }">
                        
                        </c:when>
                        <c:when test="${boardno == 21 }">
                        
                        </c:when> 
                        <c:when test="${boardno == 22 }">
                        
                        </c:when> 
                        <c:when test="${boardno == 23 }">
                        
                        </c:when> 
                        <c:when test="${boardno == 30 }">
                        
                        </c:when>
                        <c:when test="${boardno == 31 }">
                        
                        </c:when> 
                        <c:when test="${boardno == 32 }">
                        
                        </c:when> 
                        <c:when test="${boardno == 40 }">
                        
                        </c:when> 
                        <c:when test="${boardno == 50 }">
                        
                        </c:when> 
                       	<c:otherwise>
                       		
                       	</c:otherwise>                    
                        </c:choose>
                        </td>
                        <td>
                           <!-- 위에 폼 인쿨루드 -->


                         <c:choose>
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
                                    
                                       <%-- <% int boardno;  
                                 boardno = BbsVO.getBoardno(); 
                                     if(boardno==31){ 
                                 %> --%>
                                       <c:forEach var="bbs" items="${list}">
                                          <tr>
                                             <td align="center">${bbs.no}</td>
                                             <td align="center"><a
                                                href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${bbs.title}</a></td>
                                             <td align="center">${bbs.nickname}</td>
                                             <td align="center">${bbs.writedate}</td>
                                             <td align="center">${bbs.hits}</td>
                                             <td align="center">${bbs.good}</td>
                                             <td align="center">
                                             <c:choose>
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
                                                </c:choose>
                                                </td>
                                          </tr>
                                       </c:forEach>
                                       </c:when>
                                       <c:when test="${boardno == '50' }">
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
                                                <%-- <% int boardno;  
                                     boardno = BbsVO.getBoardno(); 
                                     if(boardno==31){ 
                                  %> --%>
                                                <c:forEach var="bbs" items="${list}">
                                                   <tr>
                                                      <td align="center">${bbs.no}</td>
                                                      <td align="center"><a
                                                         href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${bbs.region}${bbs.title}</a></td>
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
                                                         <%-- <% int boardno;  
                                     boardno = BbsVO.getBoardno(); 
                                     if(boardno==31){ 
                                  %> --%>
                                                         <c:forEach var="bbs" items="${list}">
                                                            <tr>
                                                               <td align="center">${bbs.no}</td>
                                                               <td align="center"><a
                                                                  href="/Handicap/bbsContent?boardno=${bbs.boardno}&no=${bbs.no}">${bbs.category}${bbs.region}${bbs.title}</a></td>
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
                                                      	<c:otherwise>
                                                      		<td colspan="6" width="750px"><button
                                                               type="button" class="ml-button"
                                                               onclick="location.href='/Handicap/bbsNoticeWriteForm'">글쓰기</button></td>
                                                      			
                                                      	</c:otherwise>
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