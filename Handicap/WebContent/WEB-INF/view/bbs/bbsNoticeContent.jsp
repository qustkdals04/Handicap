<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.handicap.model.beans.BbsVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.BbsVO"></jsp:useBean>
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
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script src="ckeditor2/config.js"></script>
<script src="ckeditor2/ckeditor.js"></script> 
<script type="text/javascript">   
window.onload = function() {
	CKEDITOR.replace('content',{
		
		toolbar: []
	});		
};
$(document).ready(function() {
    $("#delete").click(function() { //삭제버튼
       if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
          $("#bbsContent").attr({
             action : 'bbsDelete',
             method : 'post'
          });
          $("#bbsContent").submit();
       } else {
          return; // 취소
       }
    });
  
   $("#goodupdate").click(function() {
      var param = "no=${bbsContent.no}&boardno=${bbsContent.boardno}&userid=${memberid}";
      $.ajax({
           type : "post",
           url : "gbsearch",
           data : param,
           success : function(data) {
              if (data.trim()=="true") {
                 alert("이미 평가한 게시글입니다.");
              } else {
                 $("#bbsContent").attr({
                      action : "bbsgood",
                      method : 'get'
                });
                 alert("추천하였습니다.");
                 $("#bbsContent").submit();
              }
           }
        });
   });
   
   $("#badupdate").click(function() {
	      var param = "no=${bbsContent.no}&boardno=${bbsContent.boardno}&userid=${memberid}";
	      $.ajax({
	           type : "post",
	           url : "gbsearch",
	           data : param,
	           success : function(data) {
	              if (data.trim()=="true") {
	                 alert("이미 평가한 게시글입니다.");
	              } else {
	                 $("#bbsContent").attr({
	                      action : "bbsbad",
	                      method : 'get'
	                });
	                 alert("신고하였습니다.");
	                 $("#bbsContent").submit();
	              }
	           }
	        });
	   });
    
    $("#tradecomplite").click(function() { 
        if (confirm("완료처리를 하시겠습니까?") == true) {
           $("#bbsContent").attr({
              action : 'statusupdate',
              method : 'get'
           });
           $("#bbsContent").submit();
        } else {
           return; // 취소
        }
     });
    $("#qnacomplite").click(function() { 
        if (confirm("완료처리를 하시겠습니까?") == true) {
           $("#bbsContent").attr({
              action : 'statusupdate',
              method : 'get'
           });
           $("#bbsContent").submit();
        } else {
           return; // 취소
        }
     });
    $("#comment").click(function() {
        if (confirm("댓글을 등록하시겠습니까?") == true){
           if ($("#contents").val() == ""){
              alert("댓글 내용을 입력해 주세요.");
           }
           else{
              $("#bbsContent").attr({
                    action : 'commentWrite',
                    method : 'post'
                 });
                 $("#bbsContent").submit();
           }
        }
        
      });
    function commentbadupdate1(commentno) {
    	var param = "commentno=" + commentno + "&userid=${memberid}";
    	$.ajax({
            type : "post",
            url : "gbcommentsearch",
            data : param,
            success : function(data) {
               if (data.trim()=="true") {
                  alert("이미 평가한 댓글입니다.");
               } else {
                  $("#bbsContent").attr({
                       action : "bbscommentbad",
                       method : 'get'
                 });
                  alert("신고하였습니다.");
                  $("#bbsContent").submit();
               }
            }
         });
    }
 });

</script>

</head>
<body>




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
                  <table>
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
                           <!-- 위에 폼 인쿨루드 -->

                           <form id="bbsContent" name="bbsContent">


                              <c:choose>
                              	<c:when test="${boardno == 30}">
                              	<table class="bbsList">
                                       <tr>
                                          <td width="50px"><font size="3px"
                                             style="font-weight: bold;">제목 :</td>
                                          <td width="450px" align="left"><font size="3px"
                                             style="font-weight: bold;">${bbsContent.category}${bbsContent.region}${bbsContent.title}</font></td>
                                          <td colspan="2" width="200px" align="right"><font
                                             size="2px">작성일 : ${bbsContent.writedate}</font></td>
                                       </tr>
                                       <tr>
                                          <td colspan="4" align="left"><font size="3px">작성자
                                                : ${bbsContent.nickname}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
                                                ${bbsContent.hits}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 진행상태:
                                                <c:choose>
                                                <c:when test="${bbsContent.status ==1 }"> 거래대기</c:when>
                                                <c:otherwise>거래완료</c:otherwise>
                                                </c:choose></font></td>
                                       </tr>
                                       <tr style="height: 300px; vertical-align: text-top;">

                                          <td colspan="4" >
                                          <c:if test="${bbsFileName !=null }">
                                          <c:forEach var="bbsfile" items="${bbsFileName}">
                                          <img height="130px" style="width: 130px;"
                                          src="/Handicap/bbsimg/${bbsfile.fileoriginal}" onclick="window.open('/Handicap/img?filepath=${bbsfile.fileoriginal}','popup1','width=500,height=500, top='+(screen.height/2-250)+',left='+(screen.width/2-250)+'')">
                                          </c:forEach>
                                          </c:if> 
                                          <br>
                                          	<textarea readonly="readonly" rows="20" 
                                          	cols="100" id="content" name="content"
                                          	>                                          	
                                          	${bbsContent.contents}</textarea>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="left"><font size="1px">첨부파일 : </font></td>
                                          <td colspan="4"><c:forEach var="bbsFileName"
                                                items="${bbsFileName}">
                                                <tr>

                                                   <td>${bbsFileName.filename}</td>

                                                </tr>
                                             </c:forEach></td>

                                       </tr>
                                    </table>
                              	</c:when>
                                 <c:when test="${boardno == '32' }">
                                    <table class="bbsList">
                                       <tr>
                                          <td width="50px"><font size="3px"
                                             style="font-weight: bold;">제목 :</td>
                                          <td width="450px" align="left"><font size="3px"
                                             style="font-weight: bold;">${bbsContent.category}${bbsContent.title}</font></td>
                                          <td colspan="2" width="200px" align="right"><font
                                             size="2px">작성일 : ${bbsContent.writedate}</font></td>
                                       </tr>
                                       <tr>
                                          <td colspan="4" align="left"><font size="3px">작성자
                                                : ${bbsContent.nickname}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
                                                ${bbsContent.hits}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 추천수 :
                                                ${bbsContent.good}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평점 <c:choose>
                                                   <c:when test="${bbsContent.star == '1'}">
                                                      <img width="100" height="25"
                                                         src="/Handicap/img/star1.png">
                                                   </c:when>
                                                   <c:when test="${bbsContent.star =='2'}">
                                                      <img width="100" height="25"
                                                         src="/Handicap/img/stat2.png">
                                                   </c:when>
                                                   <c:when test="${bbsContent.star == '3'}">
                                                      <img width="100" height="25"
                                                         src="/Handicap/img/stat3.png">
                                                   </c:when>
                                                   <c:when test="${bbsContent.star =='4'}">
                                                      <img width="100" height="25"
                                                         src="/Handicap/img/stat4.png">
                                                   </c:when>
                                                   <c:when test="${bbsContent.star == '5'}">
                                                      <img width="100" height="25"
                                                         src="/Handicap/img/stat5.png">
                                                   </c:when>
                                                </c:choose>
                                          </font></td>
                                       </tr>
                                       <tr style="height: 300px; float: right;">

                                          <td colspan="4"><c:if test="${bbsFileName !=null }">
                                                <c:forEach var="bbsfile" items="${bbsFileName}">
                                               
                                                <!-- <a onclick=
"javascript:window.open('img.html?img=http://phpschool.com/bbs/img/search_list.gif','','height=0,width=0');" 
style='cursor:hand'> --> <img height="130px" style="width: 130px;"
                                                      src="/Handicap/bbsimg/${bbsfile.fileoriginal}"  onclick="window.open('/Handicap/img?filepath=${bbsfile.fileoriginal}','popup1','width=500,height=500, top='+(screen.height/2-250)+',left='+(screen.width/2-250)+'')"></a>
                                                  
                                               
                                                
                                                
                                                </c:forEach>
                                             </c:if> 
                                             <br>
                                            <textarea readonly="readonly" rows="20" 
                                          	cols="100" id="content" name="content"
                                          	>                                          	
                                          	${bbsContent.contents}</textarea>
                                             </td>
                                       </tr>
                                       <tr>
                                          <td align="left"><font size="1px">첨부파일 : </font></td>
                                          <td colspan="4"><c:forEach var="bbsFileName"
                                                items="${bbsFileName}">
                                                <tr>

                                                   <td>${bbsFileName.filename}</td>

                                                </tr>
                                             </c:forEach></td>

                                       </tr>
                                    </table>
                                 </c:when>



                                 <c:when test="${boardno == 50}">
                                    <table class="bbsList">
                                       <tr>
                                          <td width="50px"><font size="3px"
                                             style="font-weight: bold;">제목 :</td>
                                          <td width="450px" align="left"><font size="3px"
                                             style="font-weight: bold;">${bbsContent.category}${bbsContent.title}</font></td>
                                          <td colspan="2" width="200px" align="right"><font
                                             size="2px">작성일 : ${bbsContent.writedate}</font></td>
                                       </tr>
                                       <tr>
                                          <td colspan="4" align="left"><font size="3px">작성자
                                                : ${bbsContent.nickname}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
                                                ${bbsContent.hits}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:choose>
                                                   <c:when test="${bbsContent.status == '2'}">
                                             [답변완료]
                                          </c:when>
                                                   <c:otherwise>
                                             [미답변]
                                          </c:otherwise>
                                                </c:choose>

                                          </font></td>
                                       </tr>
                                       <tr style="height: 300px; vertical-align: text-top;">

                                          <td colspan="4"><c:if test="${bbsFileName !=null }">
                                                <c:forEach var="bbsfile" items="${bbsFileName}">
                                                   <img height="130px" style="width: 130px;"
                                                      src="/Handicap/bbsimg/${bbsfile.fileoriginal}"  onclick="window.open('/Handicap/img?filepath=${bbsfile.fileoriginal}','popup1','width=500,height=500, top='+(screen.height/2-250)+',left='+(screen.width/2-250)+'')">
                                                </c:forEach>
                                             </c:if> <br>
                                             <textarea readonly="readonly" rows="20" 
                                          	cols="100" id="content" name="content"
                                          	>                                          	
                                          	${bbsContent.contents}</textarea>
                                             </td>
                                       </tr>
                                       <tr>
                                          <td align="left"><font size="1px">첨부파일 : </font></td>
                                          <td colspan="4"><c:forEach var="bbsFileName"
                                                items="${bbsFileName}">
                                                <tr>

                                                   <td>${bbsFileName.filename}</td>

                                                </tr>
                                             </c:forEach></td>

                                       </tr>
                                    </table>
                                 </c:when>
							

                                 <c:otherwise>
                                    <table class="bbsList">
                                       <tr>
                                          <td width="50px"><font size="3px"
                                             style="font-weight: bold;">제목 :</td>
                                          <td width="450px" align="left"><font size="3px"
                                             style="font-weight: bold;">${bbsContent.category}${bbsContent.region}${bbsContent.title}</font></td>
                                          <td colspan="2" width="200px" align="right"><font
                                             size="2px">작성일 : ${bbsContent.writedate}</font></td>
                                       </tr>
                                       <tr>
                                          <td colspan="4" align="left"><font size="3px">작성자
                                                : ${bbsContent.nickname}
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
                                                ${bbsContent.hits}</font></td>
                                       </tr>
                                       <tr style="height: 300px; vertical-align: text-top;">

                                          <td colspan="4" >
                                          <c:if test="${bbsFileName !=null }">
                                          <c:forEach var="bbsfile" items="${bbsFileName}">
 												<img height="130px" style="width: 130px;"
                                                      src="/Handicap/bbsimg/${bbsfile.fileoriginal}"  onclick="window.open('/Handicap/img?filepath=${bbsfile.fileoriginal}','popup1','width=500,height=500, top='+(screen.height/2-250)+',left='+(screen.width/2-250)+'')">&nbsp;&nbsp;&nbsp;
                                          </c:forEach>
                                          </c:if> 
                                          <br>
                                          	<textarea readonly="readonly" rows="20" 
                                          	cols="100" id="content" name="content"
                                          	>                                        	
                                          	${bbsContent.contents}</textarea>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="left"><font size="1px">첨부파일 : </font></td>
                                          <td colspan="4"><c:forEach var="bbsFileName"
                                                items="${bbsFileName}">
                                                <tr>

                                                   <td>${bbsFileName.filename}</td>

                                                </tr>
                                             </c:forEach></td>

                                       </tr>
                                    </table>
                                 </c:otherwise>
                              </c:choose>
                              <hr width="700px;">

                              <center>
                                 <table width="700px;"
                                    style="border-top: 3px; border-left: 3px; border-right: 3px; border-bottom: 3px;">
                                    <c:forEach var="commentList" items="${list}">
                                    	<tr>
                                    		<td align="left" ><font size="3px" style="font-weight: bolder;">${commentList.nickname}</font></td>
                                    		<td align="right"><font size="3px">${fn:substring(commentList.writedate,0,10)}</font></td>
                                    	</tr>
                                       <tr >
                                          
                                          <td align="left" ><font size="3px">${commentList.contents}</font></td>
                                          
                                          <td align="right">
                                          	<c:if test="${!(commentList.nickname!=membernick&&membergrade!=3) }">
                                          		<img src="/Handicap/img/temp.jpg"
                                                	onclick="location.href='/Handicap/commentDelete?no=${bbsContent.no}&boardno=${bbsContent.boardno}&commentno=${commentList.commentno }'">
                                          	</c:if>
                                          </td>
                                          <td>
                                          	<c:if test="${commentList.nickname != membernick&&commentList.nickname!='관리자' }">
                                          	 	<button type="button" id="commentbadupdate" class="ml-button" style="width: 50px; height: 30px;" onclick="commentbadupdate1(${commentList.commentno})">신고</button>
                                          	</c:if>
                                          </td>
                                       </tr>
                                    </c:forEach>
                                    <tr>
                                       <input type="hidden" name="pageNumber"
                                          value="${pageNumber }">
                                    </tr>
                                 </table>
                                 <table align="center">
                                    <tr>
                                       <td style="font-size: large;"><c:if
                                             test="${startPage>1 }">
                                             <span> <a
                                                href="/Handicap/bbsContent?pageNumber=${startPage-1 }&boardno=${bbsContent.boardno}&no=${bbsContent.no}">이전</a>
                                             </span>
                                          </c:if> <c:forEach var="i" begin="${startPage }"
                                             end="${endPage }">
                                             <c:choose>
                                                <c:when test="${pageNumber==i }">
                                                   <span> <a
                                                      href="/Handicap/bbsContent?pageNumber=${i }&boardno=${bbsContent.boardno}&no=${bbsContent.no}"
                                                      style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
                                                   </span>
                                                </c:when>
                                                <c:otherwise>
                                                   <span> <a
                                                      href="/Handicap/bbsContent?pageNumber=${i}&boardno=${bbsContent.boardno}&no=${bbsContent.no}"
                                                      style="text-decoration: none; color: gray;">${i}</a>&nbsp;
                                                   </span>
                                                </c:otherwise>
                                             </c:choose>
                                          </c:forEach> <c:if test="${endPage<totalPageCount}">
                                             <span> <a
                                                href="/Handicap/bbsContent?pageNumber=${endPage+1 }&boardno=${bbsContent.boardno}&no=${bbsContent.no}">다음</a>
                                             </span>
                                          </c:if></td>
                                    </tr>
                                 </table>
                                 
                                 <table>
                                    
                                   
                                    <c:if test="${!(membergrade!=3&&boardno==50) }">
                                          <c:if test="${memberid!=null}">
                                          	<tr>
                                       			<td></td>
                                       			<!-- 재원 contents를 content로 바꿈/진용(저거적용떄매 -->
                                       			<td align="center" width="700px" colspan="2" ><input type="text" id="contents" name="contents" 
                                          			style="width: 500px; height: 30; margin-bottom: 20px;" ><input
                                         			 type="button" value="등록" id="comment" class="ml-button"
                                         			 style="width: 70px; height: 30px; vertical-align: bottom; margin-bottom: 20px;"></td>



                                    		</tr>
                                          </c:if>
                                       </c:if>
                                 </table>
                                 
                                 <table style="margin-top: 50px;">
                       


                                       <td width="100px;" align="left" style="top: 30px">
                                          <button type="button" id="list" class="ml-button"
                                             onclick="location.href='/Handicap/bbsList?boardno=${boardno}'"
                                             style="margin-bottom: 50px;">목록</button>
                                       </td>
													<td width="600px;" align="right"><c:choose>
															<c:when test="${boardno!=10}">
																<c:if test="${membernick !=null}">
																	<c:choose>
																		<c:when test="${membernick != bbsContent.nickname}">
																			<button type="button" id="goodupdate"
																				class="ml-button">추천</button>
																			<button type="button" id="badupdate"
																				class="ml-button">신고</button>
																		</c:when>
																	</c:choose>
																</c:if>
															</c:when>

														</c:choose> <c:if test="${bbsContent.nickname == membernick }">
															<button type="button" id="update" class="ml-button"
																onclick="location.href='/Handicap/bbsUpdateForm?boardno=${bbsContent.boardno}&no=${bbsContent.no}'">수정</button>
															<button type="button" id="delete" class="ml-button">삭제</button>
															<c:choose>
																<c:when test="${boardno == 30 }">
																	<button type="button" id="tradecomplite" class="ml-button">완료</button>
																</c:when>
																<c:when test="${boardno==50}">
																	<c:if test="${membergrade ==3}">
																<button type="button" id="qnacomplite" class="ml-button">완료</button>
																	</c:if>
																</c:when>
															</c:choose>
														</c:if></td>

												</tr>
                                 </table>
                              </center>
                              <input type="hidden" name="no" value="${bbsContent.no }">
                              <input type="hidden" name="boardno" value="${bbsContent.boardno }">
							  <input type="hidden" name="userid" value="${memberid}">
                           </form> <!-- 아래 폼 인쿨루드 -->
                        </td>

                     </tr>
                  </table>
               </div>
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