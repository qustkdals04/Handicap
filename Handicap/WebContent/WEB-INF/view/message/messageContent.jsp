<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.handicap.model.beans.MessageVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delete").click(function(){			 //삭제버튼
			if(confirm("정말로 삭제하시겠습니까?") == true){  // 확인
				$("#messageContent").attr({action:'messagedelete', method:'post'});
	            $("#messageContent").submit();
			}
			else{
					return;   // 취소
			}
		});
	});
</script>
</head>
<body>
	<%-- <!-- 상세보기 -->--%>
<form id="messageContent" name="messageContent">

<table class="gmlwn">
				<tr>
						<td >● 상세보기(받는)</td>
				</tr>
		</table>

<table  class="list1" >
			<tr >
				<td colspan="2" width="300" align="left">보낸사람 : ${messageContent.sender}</td>
				 <!-- 보낸사람 -->
				 <td>
				 </td>
				<td align="right" width="200px">${messageContent.senddate }</td>   <!-- 현재시간 -->
				
			</tr>
			
</table>
<table class="list1">
			
			<tr height="200px">
				


				<td colspan="3" ><textarea rows="10" cols="50" name="contents" id="contents" style="width: 100%; height: 278px;"></textarea> </td>
			</tr>
			<tr>
				<td width="400px"></td>
				<td  colspan="2" align="right" width="400px">
				
					
					<button  id="send">보내기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button id="cancel" onclick="history.back()">취소</button>
				</td>
			</tr>
				<%-- <td  colspan="4">
				<textarea rows="10" cols="50" readonly="readonly" style="width: 100%; height: 278px;">${messageContent.contents }</textarea>
				<textarea style="width: 100%; height: 100%;" readonly="readonly">${messageContent.contents }</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<!-- <button type="button" style="width:70px;height: 20px;" id="delete" onclick="location.href='/Handicap/messagedelete'">삭제</button>
					<button type="button" style="width:70px;height: 20px;" id="cancel" onclick="history.back()">취소</button> --> <!-- 					<img src = "/shop1/img/deleteB.png" id="delete" onclick="location.href='/Handicap/messagedelete'" style="width: 95px; height: 38px; ">
					<img src = "/shop1/img/closeB.png" id="cancel" onclick="history.back()" style="width: 95px; height: 38px; "> -->
					<button onclick="location.href='/Handicap/messagedelete'" id="delete" style="width:80px;height: 25px;" >삭제하기</button>
					
					<button onclick="history.back()" id="cancel" style="width:80px;height: 25px;" >취소하기</button>
				</td>
			</tr> --%>
		</table>



		<input type="hidden" name="messageno" value="${messageContent.messageno }">
 </form>


</body>
</html>