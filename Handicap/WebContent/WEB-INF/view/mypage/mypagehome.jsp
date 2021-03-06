<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<title>mypage home</title>

<style>
      table#aa {
        width: 100%;
       border: 1px solid #C58A52;
      }
      
      table td.t3{
       width: 100%;
      margin-top : 10;
       border-bottom:  1px solid #C58A52;
      }
      
          table td#t4{
       width: 100%;
      margin-top : 10;
       border-top:  1px solid #C58A52;
      }
      
      #mypageList{
      
      width: 700px;
      text-align: center;
      }
      
    </style>

<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/Handicap/js/jquery.form.min.js"></script>

<script type="text/javascript">
	function bbsdel (i, no, boardno){
		if(confirm("정말로 삭제하시겠습니까?")==true){
		var del = "no="+no+"&boardno="+boardno;
		$.ajax({
			type : "GET",
			url : "mypage/bbsdelete",
			data : del,
			success : function(data){	
				alert(data);
				$("#chk_adminbbs").click();
			}
		})
		} else{
			return;
		}
	}
	
	function commentdel(commentno){
		if(confirm("정말로 삭제하시겠습니까?")==true){
		$.ajax({
			type : "GET",
			url : "mypage/commentdelete",
			data : "commentno="+commentno,
			success : function(data){	
				alert(data);
				$("#chk_admincomment").click();
			}
		})
		} else{
			return;
		}
	}
	$(document).ready(function(){
			$("#img").change(function(){					
				$('#imgform').submit();
			});//change
			$('#imgform').ajaxForm({
	            beforeSubmit: function (data,form,option) {
	                //validation체크 
	                //막기위해서는 return false를 잡아주면됨
	            	var img = $("#img").val();
	                img = img.slice(img.indexOf(".") + 1).toLowerCase();
	                if(img != "jpg" && img!= "png" && img != "gif" && img!="bmp"){
	                	alert("이미지 파일(jpg,png,gif,bmp)만 등록 가능합니다.");
	                	return false;
	                } else{
	    	            	var reader = new FileReader();
	    	            	reader.onload = function(e){
	    	            		$("#myimage").attr('src', e.target.result);
	    	            	}
	    	            	reader.readAsDataURL($("input[name=img]")[0].files[0]);	    	            	
		                return true;
	                }
	            },
	            success: function(response,status){
	            	//성공후 서버에서 받은 데이터 처리	   
	            	alert("업로드성공!!!");	            	
	            	//$("#myimage").attr("src" , "/Handicap/myimg/"+response);
	            	/* $("#myimage").attr({src : "", alt : "잠시만 기다려주세요"});
	            	setInterval(function(){$("#myimage").attr("src" , "/Handicap/myimg/"+response)}, 5000); */
	            }                              
	        });
			
			/* 신고수가 1 이상인 게시글 */
			//삭제
			
			
			$("#chk_adminbbs").click(function(){							
				$.ajax({
					type : "get",
					url : "mypage/adminbbs",
					dataType:'json',
					success : function(data){
						if(data==""){
							$("#mypageList").html("신고수가 1이상인글이 없습니다.");
						} else{
							$("#mypageList").html("");
							$("#mypageList").append("<tr ><td >글번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회</td><td>신고</td><td>삭제</td></tr>");
							$.each(data, function(i, dataObj){								
								$("#mypageList").append("<tr id="+i.toString()+" valign='top'>"+
								"<td>"+dataObj.no+"</td>"+
								"<td><a href='/Handicap/bbsContent?no="+dataObj.no+"&boardno="+dataObj.boardno+"'>"+dataObj.title+"</a></td>"+
								"<td>"+dataObj.author+"</td>"+
								"<td>"+dataObj.writedate+"</td>"+
								"<td>"+dataObj.hits+"</td>"+
								"<td>"+dataObj.bad+"</td><td><button type='button' name='delete' style='width:50px; height:30px' onclick='javascript: bbsdel("+i.toString()+","+dataObj.no+","+dataObj.boardno+")'>삭제</button></td></tr>");
							})							
						}
					}
				});			 
			})
			
			/* 신고수가 1이상인 모든 댓글 */
			$("#chk_admincomment").click(function(){							
					$.ajax({
						type : "get",
						url : "mypage/adminbbscomment",						
						dataType:'json',
						success : function(data){
							if(data==""){
								$("#mypageList").html("신고수가 1이상인 댓글이 없습니다.");
							} else{
								$("#mypageList").html("");
								$("#mypageList").append("<tr><td>댓글내용</td><td>작성자</td><td>작성일</td><td>신고</td></tr>");
								$.each(data, function(i, dataObj){								
									$("#mypageList").append("<tr id="+i.toString()+" valign='top'>"+
									"<td><a href='/Handicap/bbsContent?no="+dataObj.no+"&boardno="+dataObj.boardno+"'>"+dataObj.contents+"</a></td>"+
									"<td>"+dataObj.author+"</td><td>"+dataObj.writedate+"</td><td>"+dataObj.bad+"</td><td><button type='button' name='delete' style='width:50px; height:30px' onclick='javascript: commentdel("+dataObj.commentno+")'>삭제</button></td></tr>");								
								})								
							}
						}
					});
			})
			
			/* 내게시글 */
			$("#chk_info").click(function(){				
				var userid = "userid=${memberid}"
				$.ajax({
					type : "get",
					url : "mypage/mybbs",
					data : userid,
					dataType:'json',
					success : function(data){
						if(data==""){
							$("#mypageList").html("작성하신 게시글이 없습니다.");
						} else{
							$("#mypageList").html("");
							$("#mypageList").append("<tr><td >글번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회</td><td>추천</td></tr>");
							$.each(data, function(i, dataObj){								
								$("#mypageList").append("<tr id="+i.toString()+" valign='top'>"+
								"<td>"+dataObj.no+"</td>"+
								"<td><a href='/Handicap/bbsContent?no="+dataObj.no+"&boardno="+dataObj.boardno+"'>"+dataObj.title+"</a></td>"+
								"<td>"+dataObj.author+"</td>"+
								"<td>"+dataObj.writedate+"</td>"+
								"<td>"+dataObj.hits+"</td>"+
								"<td>"+dataObj.good+"</td></tr>");
							})							
						}
					}
				});			 
			})
			/* 내 댓글 */
			$("#chk_info2").click(function(){
							
				var userid = "userid=${memberid}"
					$.ajax({
						type : "get",
						url : "mypage/mycomment",
						data : userid,
						dataType:'json',
						success : function(data){
							if(data==""){
								$("#mypageList").html("작성하신 댓글이 없습니다.");
							} else{
								$("#mypageList").html("");
								$("#mypageList").append("<tr><td>댓글내용</td><td>작성자</td><td>작성일</td></tr>");
								$.each(data, function(i, dataObj){								
									$("#mypageList").append("<tr id="+i.toString()+" align='left' valign='top'>"+
									"<td><a href='/Handicap/bbsContent?no="+dataObj.no+"&boardno="+dataObj.boardno+"'>"+dataObj.contents+"</a></td>"+
									"<td>"+dataObj.author+"</td><td>"+dataObj.writedate+"</td></tr>");								
								})								
							}
						}
					});
			})
		
		
		$("#btnprofile").click(function(){
			var profile = "profile="+$("#profile").val();
			if($("#profile").val()==""){
				alert("프로필을 변경하시려면 입력후 버튼을 눌러주세요!!");
				$("#profile").focus();
			} else{
				$.ajax({
					type : "post",
					url : "mypage/updateprofile",
					data : profile,
					success : function(data){
						$("#profiletxt").text("");
						$("#profiletxt").text($("#profile").val());
						$("#profile").val("");
					}
				})
			}
		});
	});
</script>
</head>
<body>

<div id="CssWrapper" align="center">

 
<table>
	<tr>
		<td>
				<div id="top">
				<%@include file="../top.jsp"%>
				</div>
		</td>
	</tr>
	
	<tr>
				<td align="left">
					<div id="CssContent1">
						<%@include file="../menu.jsp"%>
					</div>
				
				</td>
			</tr>
			<tr>
				<td align="center">
					<div id="CssContents">
					
      
      <!-- center 끝 -->
      <div id="CssContents">
         <table class="mypage">
            <tr>
               <td align="left"><font size="6">mypage</font></td>
            </tr>
         </table>

         <table border="1" bordercolor="#C58A52" class="mypageList" > 
         	<tr><td>닉네임 : ${membernick }</td><td align="right"><button type="button" class="ml-button" onclick="location.href='/Handicap/mypage/pwcheck'">정보수정</button></td></tr>
            <tr>
               <td width="200px" height="200px" align="center"
                  style="vertical-align: middle;" id="myimagetd">
                  <img id="myimage" alt="이미지를 등록하세요." src="/Handicap/myimg/${mypage.image }" width="180" height="180"> </td>
               <!-- 이미지 공간 -->
               <td rowspan="5">
                  <table border="0"  align="center" width="500px">
                     <tr>
                        <td style="vertical-align: top;" height="20px" align="center">
                          <!--  <input type="radio" name="chk_info" id="chk_info" value="내가 쓴 게시글">내가 쓴 게시글
                           <input type="radio" name="chk_info" id="chk_info" value="내가 쓴 댓글">내가 쓴 댓글 -->
                           <c:if test="${membergrade == 3 }">
                           <button type="button" class="ml-button" name="chk_adminbbs" id="chk_adminbbs" value="신고글">신고글</button>
                           <button type="button" class="ml-button" name="chk_admincomment" id="chk_admincomment" value="신고댓글">신고댓글</button>                           </c:if>
                           <button type="button" class="ml-button" name="chk_info" id="chk_info" value="게시글">게시글</button>
                           <button type="button" class="ml-button" name="chk_info2" id="chk_info2" value="댓글">댓글</button>
                     </tr>
                     <tr>
                        <td align="center" height="500px" style='padding-top: 25px; vertical-align: top'>
                        <!-- 리스트 -->
                        <table id="mypageList" width="430" style="font-size: 10pt;">  
                        	<tr><td>게시글내역 또는 댓글내역을 선택해주세요..</td></tr>                      	                   	
                        </table>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
            <tr>
               <td align="center">
               <form id="imgform" action="mypage/myimage" method="post" enctype='multipart/form-data'>
               <input type='file' id="img" name="img" style='display: none'>
               <label class="ml-button" for='img' id="image">이미지 선택</label>
               <!-- <button for='img' type="button" class="ml-button"
                     style="vertical-align: middle;" id="image">이미지 선택</button> -->
               <!-- <input type="button" for="img" class="ml-button" value="이미지선택"> -->
               </form>
                
               </td>
            </tr>
            <tr>
               <td align="center" height="200px" style="vertical-align: middle;" id="profiletxt">${mypage.profile }</td>
               <!-- 한줄말 -->
            </tr>
            <tr>
               <td align="center" ><!-- <input type="text"
                  style="width: 90%; vertical-align: middle; margin-top: 30px;" name="profile" id="profile"> -->
                  <textarea rows="5" cols="5" name="profile" id="profile" style="width: 180px; height: 50px; margin-top: 20px; font-size: 12pt" ></textarea>
                  <button type="button" class="ml-button"
                     style="vertical-align: middle;" id="btnprofile">소개글</button></td>
            </tr>            
</table>
</div>
</div>
</td>
</tr>
<tr>
	<td>
		<div id="Foot" align="center">
										<%@include file="../Footer.jsp"%>
									</div>
	
	</td>
</tr>
         </table>
      </div>
     
   <!-- 전체 wapper -->


</body>
</html>