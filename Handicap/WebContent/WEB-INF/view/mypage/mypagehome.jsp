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
      
    </style>

<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/Handicap/js/jquery.form.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
			$("#img").change(function(){					
				$('#imgform').submit();
			});//change
			$('#imgform').ajaxForm({
	            beforeSubmit: function (data,form,option) {
	                //validation체크 
	                //막기위해서는 return false를 잡아주면됨
	                return true;
	            },
	            success: function(response,status){
	            	//성공후 서버에서 받은 데이터 처리	   
	            	alert("업로드성공!!!");
	            	//$("#myimage").attr("src" , "/Handicap/myimg/"+response);
	            	$("#myimage").attr({src : "", alt : "잠시만 기다려주세요"});
	            	setInterval(function(){$("#myimage").attr("src" , "/Handicap/myimg/"+response)}, 5000);
	            }                              
	        });
			  /* $(function(){
					//폼전송
					$('#ajaxform').ajaxForm({
					   //보내기전 validation check가 필요할경우
				            beforeSubmit: function (data, frm, opt) {
							                alert("전송전!!");
							                return true;
							              },
				            //submit이후의 처리
				            success: function(responseText, statusText){
				            	alert("전송성공!!");
				            },
				            //ajax error
				            error: function(){
				            	alert("에러발생!!");
				            }                               
				          });
				}); */
			/*  */
		
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
							$("#mypageList").append("<tr><td>글번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회</td><td>추천</td></tr>");
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
								$("#mypageList").append("<tr><td>댓글내용</td><td>작성일</td></tr>");
								$.each(data, function(i, dataObj){								
									$("#mypageList").append("<tr id="+i.toString()+" valign='top'>"+
									"<td><a href='/Handicap/bbsContent?no="+dataObj.no+"&boardno="+dataObj.boardno+"'>"+dataObj.contents+"</a></td>"+
									"<td>"+subString(dataObj.writedate, 0, 10)+"</td></tr>");								
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
						$("#profiletxt").text(data);
						$("#profile").val("");
					},
					error : function(status){
						alert(status);
					}
				})
			}
		});
	});
</script>
</head>
<body>
   <div id="top" align="center">
      <%@include file="../top.jsp"%>


      <div align="center">
         <%@include file="../menu.jsp"%>
      </div>
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
                  <table border="0" align="center" width="500px">
                     <tr>
                        <td style="vertical-align: top;" height="20px" align="center">
                          <!--  <input type="radio" name="chk_info" id="chk_info" value="내가 쓴 게시글">내가 쓴 게시글
                           <input type="radio" name="chk_info" id="chk_info" value="내가 쓴 댓글">내가 쓴 댓글 -->
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
      <%@include file="../Footer.jsp"%>
   </div>
   <!-- 전체 wapper -->















</body>
</html>