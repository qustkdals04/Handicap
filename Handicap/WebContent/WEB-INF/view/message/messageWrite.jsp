<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
var searchNick = false;
	$(document).ready(function(){
		$("#send").click(function(){			 //보내기버튼
			if($("#recipient").val()==""){
				alert("받는사람을 입력해주세요..");
				$("#recipient").focus();
			} else if($("#contents").val()==""){
				alert("내용을 입력해주세요..");
				$("#contents").focus();
			} else if(searchNick != true){
				alert("받는사람에 닉네임을 입력하고 검색을 해주세요.");
			} else{
				$("#messageWrite").attr({action:'messageWriteAction', method:'post'});
	            $("#messageWrite").submit();
			}
		});
		$("#findnick").click(function(){
			var checkNick = "nickname="+$("#recipient").val();
			if($("#recipient").val()==""){
				alert("받는사람을 입력해주세요..");
				$("#recipient").focus();
			} else{
				$.ajax({
		             type:"GET",
		             url:"nickcheck",
		             data:checkNick,	             
		             success:function(data){
		            	 if($.trim(data)!=""){		            		
		            		searchNick=true;
		                    alert("닉네임이 존재합니다. 내용을 입력해주세요");
		                    $("#contents").focus();
		                 }else{		                	
		                 	searchNick=false;
		                    alert("존재하지 않는 닉네임입니다.");	
		                    $("#recipient").val()=="";
		                    $("#recipient").focus();
		                 }		                
		             },
		             error:function(status){
		            	 alert(status+"error");
		             }
				});
			}
		});
	});
</script>
</head>
<body>
	<form name="messageWrite" id="messageWrite">
		<table class ="basic">
			<tr>
				<td align='center' color = "#678197">받는사람  </td>
				<td ><input type="text" name="recipient" id="recipient" style="width: 100%;height:22px;" ></td>
				<td align='center' ><img src = "/Handicap/img/searchB.png" id="findnick" style="width: 95px; height: 38px; "><!-- <button type="button" id="findnick">검색</button> --></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle;" color = "#678197">내	용  </td>
				<td colspan="2" ><textarea rows="10" cols="50" name="contents" id="contents" style="width: 100%"></textarea> </td>
			</tr>
			<tr>
				<td></td>
				<td align="right" colspan="2">
					
					<!-- <button type="button" style="width:70px;height: 20px;" id="send">보내기</button> -->
					<img src = "/Handicap/img/sendB.png" id="send" style="width: 95px; height: 38px; ">
					<img src = "/Handicap/img/closeB.png" id="cancel" onclick="history.back()" style="width: 95px; height: 38px; ">
					<!-- <button type="button" style="width:70px;height: 20px;" id="cancel" onclick="history.back()">취소</button> -->
				</td>
			</tr>
		</table>
		<input type="hidden" name="userid" value="${userid }">
	</form>
</body>
</html>