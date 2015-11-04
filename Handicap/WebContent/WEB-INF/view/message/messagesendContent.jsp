<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.handicap.model.beans.MessageVO" %>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.MessageVO"></jsp:useBean>
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="/Handicap/js/jquery-1.10.2.min.js"></script>
  <link rel="stylesheet" type="text/css" media="all" href="/Handicap/css/styles.css">
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
<table style="width: 618px; " class="basic">
			<tr style="width: 495px; ">
				<td align = "center" width="100px" color = "#678197">받는사람  </td>
				<td style="width: 150px;height:22px;">&nbsp;${messagesendContent.recipient}</td> <!-- 보낸사람 -->
				<td align="right">${messagesendContent.senddate }</td>   <!-- 현재시간 -->
				
			</tr>
			
			<tr>
				<td align = "center" color = "#678197">내	용  </td>
				
				<td  colspan="2" ><textarea style="width: 490px; height: 172px" readonly="readonly">${messagesendContent.contents }</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<!-- <button type="button" style="width:70px;height: 20px;" id="delete" onclick="location.href='/Handicap/messagedelete'">삭제</button> -->
					<img src = "/Handicap/img/deleteB.png" id="delete" onclick="location.href='/Handicap/messagedelete'" style="width: 95px; height: 38px; ">
					<!-- <button type="button" style="width:70px;height: 20px;" id="cancel" onclick="history.back()">취소</button> -->
					<img src = "/Handicap/img/closeB.png" id="cancel" onclick="history.back()" style="width: 95px; height: 38px; ">
				</td>
			</tr>
		</table>
		<input type="hidden" name="messageno" value="${messagesendContent.messageno }">
 </form>
</body>
</html>